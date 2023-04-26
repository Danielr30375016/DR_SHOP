import 'package:dr_shop/data/repositoryimpl/user_repository_impl.dart';
import 'package:dr_shop/domain/repository/user_repository.dart';
import 'package:dr_shop/infrastructure/data_base.dart';
import 'package:dr_shop/ui/shop/shop_bloc.dart';
import 'package:dr_shop/ui/shopping_cart/shopping_cart_bloc.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> initializeDepencies() async {
  //BD
  injector.registerLazySingleton(() => DataBaseProvider.dbProvider);

  //Repository
  injector.registerFactory<UserRepository>(
      () => UserRepositoryImpl(injector<DataBaseProvider>()));

  //Blocs
  injector.registerFactory<ShopBloc>(() => ShopBloc());
  injector.registerFactory(() => ShoppingCartBloc());
}
