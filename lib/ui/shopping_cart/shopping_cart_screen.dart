import 'package:dr_shop/ui/shopping_cart/shopping_cart_bloc.dart';
import 'package:dr_shop/ui/shopping_cart/shopping_cart_state.dart';
import 'package:dr_shop/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../di/injector.dart';

class ShoppingCartScreen extends StatefulWidget {
  final ShoppingCartBloc shoppingCartBloc = injector.get<ShoppingCartBloc>();
  ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.getTheme(),
      home: SafeArea(
          child: Scaffold(
              body: BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
        bloc: widget.shoppingCartBloc,
        builder: (context, state) {
          if (state.isLoading) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              widget.shoppingCartBloc.firstState();
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
            _headder(),
          ],
        ),
      );
    });
  }

  Widget _headder() {
    return const Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Text(
        "asdasdas dasdasd asdas dasdasdasda sdasdasd"
        "asda sdas dasdasd asd asdasdasd asdasda sdasd as",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
