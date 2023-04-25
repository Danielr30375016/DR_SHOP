import 'package:equatable/equatable.dart';

class ShopState extends Equatable {
  final bool isLoading;

  const ShopState({this.isLoading = true});

  ShopState copyWith({bool? isLoading}) =>
      ShopState(isLoading: isLoading ?? this.isLoading);

  @override
  // TODO: implement props
  List<Object?> get props => [
        isLoading,
      ];
}