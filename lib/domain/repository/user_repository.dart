import 'package:dr_shop/domain/models/user_model.dart';

abstract class UserRepository {
  Future<List<UserModel>> getMyModels();
  Future<int> insertMyModel(UserModel myModel);
  Future<void> deleteUser(int id);
}
