import 'package:dr_shop/domain/models/user_model.dart';
import 'package:dr_shop/domain/repository/hive_repository.dart';
import 'package:dr_shop/utils/app_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveRepositoryImpl extends HiveRepository {
  String hiveBox = AppContants.hiveBox;

  @override
  Future<void> addUser(UserModel userModel) async {
    var box = await Hive.openBox(hiveBox); //open the hive box before writing
    var mapUserData = userModel.toMap(userModel);
    await box.add(mapUserData);
    //Hive.close();
  }

  @override
  Future<void> deleteAllUsers() async {
    var box = await Hive.openBox(hiveBox);
    await box.clear();
  }

  @override
  Future<void> deleteUser(int id) async {
    var box = await Hive.openBox(hiveBox);
    await box.deleteAt(id);
  }

  @override
  Future<List<UserModel>> getUserLists() async {
    var box = await Hive.openBox(hiveBox);
    List<UserModel> users = [];

    for (int i = box.length - 1; i >= 0; i--) {
      var userMap = box.getAt(i);
      users.add(UserModel.fromMap(Map.from(userMap)));
    }
    return users;
  }
}
