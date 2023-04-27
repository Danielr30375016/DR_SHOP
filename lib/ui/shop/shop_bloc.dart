import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dr_shop/di/injector.dart';
import 'package:dr_shop/domain/models/user_model.dart';
import 'package:dr_shop/infrastructure/database_helper.dart';
import 'package:dr_shop/ui/shop/shop_state.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

class ShopBloc extends Cubit<ShopState> {
  final _databaseHelper = GetIt.instance.get<DatabaseHelper>();
  final Logger logger = Logger();
  ShopBloc() : super(const ShopState());

  Future<void> firstState() async {
    Future.delayed(const Duration(seconds: 5), () async {
      emit(state.copyWith(
        isLoading: false,
      ));
    });
  }

  Future<void> loadData() async {
    final data = await _databaseHelper.getData();
    emit(state.copyWith(data: data));
  }

  Future<void> insertData(String name) async {
    await _databaseHelper.insertData(name);
    final data = await _databaseHelper.getData();
    emit(state.copyWith(data: data));
  }

  Future<void> updateData(int id, String name) async {
    await _databaseHelper.updateData(id, name);
    final data = await _databaseHelper.getData();
    emit(state.copyWith(data: data));
  }

  Future<void> deleteData(int id) async {
    await _databaseHelper.deleteData(id);
    final data = await _databaseHelper.getData();
    emit(state.copyWith(data: data));
  }
}
