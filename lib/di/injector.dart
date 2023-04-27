import 'package:dr_shop/infrastructure/database_helper.dart';
import 'package:dr_shop/ui/shop/shop_bloc.dart';
import 'package:dr_shop/ui/shopping_cart/shopping_cart_bloc.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> initializeDepencies() async {
  //BD
  injector.registerSingleton<DatabaseHelper>(DatabaseHelper());

  //Blocs
  injector.registerFactory<ShopBloc>(() => ShopBloc());
  injector.registerFactory(() => ShoppingCartBloc());
}
