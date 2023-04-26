import 'package:bloc/bloc.dart';
import 'package:dr_shop/di/injector.dart';
import 'package:dr_shop/domain/models/user_model.dart';
import 'package:dr_shop/domain/repository/user_repository.dart';
import 'package:dr_shop/ui/shop/shop_state.dart';
import 'package:logger/logger.dart';

class ShopBloc extends Cubit<ShopState> {
  final UserRepository _userRepository = injector<UserRepository>();
  final Logger logger = Logger();
  ShopBloc() : super(const ShopState());

  Future<void> firstState() async {
    Future.delayed(const Duration(seconds: 5), () async {
      int aux = await _userRepository
          .insertMyModel(UserModel(id: 11, name: "Roberto Carlos"));
      logger.d(_userRepository.getMyModels());
      logger.d("------------ $aux");
      emit(state.copyWith(
        isLoading: false,
      ));
    });
  }
}
