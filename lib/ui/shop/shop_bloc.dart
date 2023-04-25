import 'package:bloc/bloc.dart';
import 'package:dr_shop/ui/shop/shop_state.dart';

class ShopBloc extends Cubit<ShopState> {
  ShopBloc() : super(const ShopState());

  Future<void> firstState() async {
    Future.delayed(const Duration(seconds: 5), () {
      emit(state.copyWith(
        isLoading: false,
      ));
    });
  }
}
