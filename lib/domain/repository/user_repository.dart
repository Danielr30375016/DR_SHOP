import 'package:dr_shop/domain/models/user_model.dart';

abstract class UserRepository {
  Future<UserModel> getMyModel();
  Future<void> saveMyModel(UserModel myModel);
  Future<void> deleteUser(int id);
}
