import 'package:dr_shop/domain/models/user_model.dart';

abstract class HiveRepository {
  Future<void> addUser(UserModel userModel);
  Future<List<UserModel>> getUserLists();
  Future<void> deleteUser(int id);
  Future<void> deleteAllUsers();
}
