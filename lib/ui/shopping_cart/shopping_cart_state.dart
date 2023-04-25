import 'package:equatable/equatable.dart';

class ShoppingCartState extends Equatable {
  final bool isLoading;

  const ShoppingCartState({this.isLoading = true});

  ShoppingCartState copyWith({bool? isLoading}) =>
      ShoppingCartState(isLoading: isLoading ?? this.isLoading);

  @override
  // TODO: implement props
  List<Object?> get props => [
        isLoading,
      ];
}
