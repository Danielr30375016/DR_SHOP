import 'package:bloc/bloc.dart';
import 'package:dr_shop/ui/shopping_cart/shopping_cart_state.dart';

class ShoppingCartBloc extends Cubit<ShoppingCartState> {
  ShoppingCartBloc() : super(const ShoppingCartState());

  Future<void> firstState() async {
    Future.delayed(const Duration(seconds: 5), () {
      emit(state.copyWith(
        isLoading: false,
      ));
    });
  }
}
