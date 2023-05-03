import 'package:bloc/bloc.dart';
import 'package:dr_shop/domain/models/user_model.dart';
import 'package:dr_shop/domain/repository/hive_repository.dart';
import 'package:dr_shop/ui/shop/shop_state.dart';
import 'package:get_it/get_it.dart';

class ShopBloc extends Cubit<ShopState> {
  final HiveRepository _hiveRepository = GetIt.instance<HiveRepository>();
  ShopBloc() : super(const ShopState());

  Future<void> firstState() async {
    Future.delayed(const Duration(seconds: 5), () async {
      loadData();
      emit(state.copyWith(
        isLoading: false,
      ));
    });
  }

  Future<void> loadData() async {
    List<UserModel> listModel = await _hiveRepository.getUserLists();
    emit(state.copyWith(listModel: listModel));
  }

  Future<void> insertData(
    int id,
    String username,
    String email,
  ) async {
    UserModel userModel = UserModel(
      id: id,
      username: username,
      email: email,
    );
    await _hiveRepository.addUser(userModel);
    await loadData();
  }

  Future<void> deleteUser(int id) async {
    await _hiveRepository.deleteUser(id);
    await loadData();
  }

  Future<void> deleteAllUsers() async {
    await _hiveRepository.deleteAllUsers();
    await loadData();
  }

  Future<void> searchUser(String user) async {
    Future.delayed(const Duration(milliseconds: 200));
    emit(state.copyWith(
        listModel: state.listModel
            .where((e) => e.email.toUpperCase().contains(user.toUpperCase()))
            .toList()));
  }
}
