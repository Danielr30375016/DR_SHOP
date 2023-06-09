import 'package:dr_shop/data/repository_impl/hive_repository_impl.dart';
import 'package:dr_shop/domain/repository/hive_repository.dart';
import 'package:dr_shop/ui/shop/shop_bloc.dart';
import 'package:dr_shop/ui/shopping_cart/shopping_cart_bloc.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> initializeDepencies() async {
  //DB
  injector.registerFactory<HiveRepository>(() => HiveRepositoryImpl());

  //Blocs
  injector.registerFactory<ShopBloc>(() => ShopBloc());
  injector.registerFactory(() => ShoppingCartBloc());
}
