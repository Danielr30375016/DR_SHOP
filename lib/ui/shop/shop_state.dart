import 'package:equatable/equatable.dart';

class ShopState extends Equatable {
  final bool isLoading;
  final List<Map<String, dynamic>> data;
  const ShopState({this.isLoading = true, this.data = const []});

  ShopState copyWith({
    bool? isLoading,
    List<Map<String, dynamic>>? data,
  }) =>
      ShopState(
        isLoading: isLoading ?? this.isLoading,
        data: data ?? this.data,
      );

  @override
  List<Object?> get props => [
        isLoading,
        data,
      ];
}
