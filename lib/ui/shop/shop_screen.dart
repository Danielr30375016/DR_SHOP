import 'package:dr_shop/di/injector.dart';
import 'package:dr_shop/ui/shop/shop_bloc.dart';
import 'package:dr_shop/ui/shop/shop_state.dart';
import 'package:dr_shop/ui/shopping_cart/shopping_cart_screen.dart';
import 'package:dr_shop/ui/widgets/text_field_web.dart';
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
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controllerText1 = TextEditingController();
  final TextEditingController _controllerText2 = TextEditingController();

  @override
  void initState() {
    _controller;
    _controllerText1;
    _controllerText2;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controllerText1.dispose();
    _controllerText2.dispose();
    super.dispose();
  }

  bool switchActive = false;
  String text1 = "";
  String text2 = "";
  String text3 = "";

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
            return const Center(child: CircularProgressIndicator());
          } else {
            return _body(state);
          }
        },
      ))),
    );
  }

  Widget _body(ShopState state) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        width: constraints.maxWidth,
        child: ListView(
          children: [
            _switchTheme(context, constraints),
            _changePage(),
            TextFieldWeb(
              constraints: constraints,
              onTap: (value) {
                text1 = value;
              },
            ),
            TextFieldWeb(
              constraints: constraints,
              onTap: (value) {
                text2 = value;
              },
            ),
            TextFieldWeb(
              constraints: constraints,
              onTap: (value) {
                text3 = value;
              },
            ),
            _button(state, constraints),
            _showData(state, constraints),
            _searchUser(state, constraints),
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

  Widget _button(
    ShopState state,
    BoxConstraints constraints,
  ) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        left: constraints.maxWidth * 0.05,
        right: constraints.maxWidth * 0.05,
      ),
      child: Card(
        child: Container(
          height: 50,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: InkWell(
            onTap: () {
              widget.shopBloc.insertData(
                int.parse(text1),
                text2,
                text3,
              );
            },
            child: const Text(
              "Guardar",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Widget _showData(
    ShopState state,
    BoxConstraints constraints,
  ) {
    return Padding(
      padding: EdgeInsets.only(
          top: 20,
          left: constraints.maxWidth * 0.05,
          right: constraints.maxWidth * 0.05),
      child: Container(
        width: constraints.maxWidth,
        height: 500,
        decoration: const BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: ListView.separated(
          itemCount: state.listModel.length,
          itemBuilder: (context, i) {
            return Card(
              child: ListTile(
                title: Text("ID: ${state.listModel[i].username}"),
                subtitle: Text("ID: ${state.listModel[i].email}"),
              ),
            );
          },
          separatorBuilder: (context, i) {
            return const SizedBox(
              height: 10,
            );
          },
        ),
      ),
    );
  }

  Widget _searchUser(
    ShopState state,
    BoxConstraints constraints,
  ) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        left: constraints.maxWidth * 0.05,
        right: constraints.maxWidth * 0.05,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: constraints.maxWidth,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: SizedBox(
                      child: TextField(
                        controller: _controller,
                      ),
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    width: constraints.maxWidth * 0.3,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: InkWell(
                      onTap: () {
                        widget.shopBloc.searchUser(_controller.text);
                      },
                      child: const Text(
                        "Buscar id",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              width: constraints.maxWidth,
              child: TextField(
                controller: _controllerText1,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              width: constraints.maxWidth,
              child: TextField(
                controller: _controllerText2,
              ),
            ),
          )
        ],
      ),
    );
  }
}
