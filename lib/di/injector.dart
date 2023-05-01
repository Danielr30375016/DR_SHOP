import 'package:dr_shop/data/repository_impl/user_repository_impl.dart';
import 'package:dr_shop/domain/models/user_model.dart';
import 'package:dr_shop/domain/repository/user_repository.dart';
import 'package:dr_shop/ui/shop/shop_bloc.dart';
import 'package:dr_shop/ui/shopping_cart/shopping_cart_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

final injector = GetIt.instance;

Future<void> initializeDepencies() async {
  //Blocs
  injector.registerFactory<ShopBloc>(() => ShopBloc());
  injector.registerFactory(() => ShoppingCartBloc());
}
