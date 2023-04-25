import 'package:dr_shop/di/injector.dart';
import 'package:dr_shop/ui/shop/shop_bloc.dart';
import 'package:dr_shop/ui/shop/shop_state.dart';
import 'package:dr_shop/ui/shopping_cart/shopping_cart_screen.dart';
import 'package:dr_shop/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class ShopScreen extends StatefulWidget {
  final ShopBloc shopBloc = injector.get<ShopBloc>();
  ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  bool switchActive = false;
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.getTheme(),
      home: SafeArea(
          child: Scaffold(
              body: BlocBuilder<ShopBloc, ShopState>(
        bloc: widget.shopBloc,
        builder: (context, state) {
          if (state.isLoading) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              widget.shopBloc.firstState();
            });
            return const CircularProgressIndicator();
          } else {
            return _body();
          }
        },
      ))),
    );
  }

  Widget _body() {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        width: constraints.maxWidth,
        child: ListView(
          children: [
            _switchTheme(context, constraints),
            _changePage(),
          ],
        ),
      );
    });
  }

  Widget _switchTheme(BuildContext context, BoxConstraints constraints) {
    final theme = Provider.of<ThemeChanger>(context);
    return Padding(
      padding: EdgeInsets.only(top: 30, right: constraints.maxWidth * 0.05),
      child: Container(
          alignment: Alignment.centerRight,
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              Switch(
                value: switchActive,
                onChanged: (value) {
                  setState(() {
                    switchActive = value;
                    theme.setTheme(
                        switchActive ? ThemeData.dark() : ThemeData.light());
                  });
                },
              ),
              const Padding(
                padding: EdgeInsets.only(top: 6),
                child: Icon(Icons.sunny),
              )
            ],
          )),
    );
  }

  Widget _changePage() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Center(
          child: IconButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ShoppingCartScreen()));
        },
        icon: const Icon(Icons.skip_next),
      )),
    );
  }
}
