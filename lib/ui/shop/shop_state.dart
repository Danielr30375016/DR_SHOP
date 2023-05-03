import 'package:dr_shop/domain/models/user_model.dart';
import 'package:equatable/equatable.dart';

class ShopState extends Equatable {
  final bool isLoading;
  final List<UserModel> listModel;
  final bool aux;
  const ShopState({
    this.isLoading = true,
    this.listModel = const [],
    this.aux = false,
  });

  ShopState copyWith({
    bool? isLoading,
    List<UserModel>? listModel,
    bool? aux,
  }) =>
      ShopState(
        isLoading: isLoading ?? this.isLoading,
        listModel: listModel ?? this.listModel,
        aux: aux ?? this.aux,
      );

  @override
  List<Object?> get props => [
        isLoading,
        listModel,
        aux,
      ];
}
