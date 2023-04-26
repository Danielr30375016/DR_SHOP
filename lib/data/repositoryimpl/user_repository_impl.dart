import 'package:dr_shop/domain/models/user_model.dart';
import 'package:dr_shop/domain/repository/user_repository.dart';
import 'package:dr_shop/infrastructure/data_base.dart';

class UserRepositoryImpl implements UserRepository {
  final DataBaseProvider _dataBaseProvider;

  UserRepositoryImpl(this._dataBaseProvider);
  @override
  Future<void> deleteUser(int id) async {
    final db = await _dataBaseProvider.database;
    await db.delete("my_table", where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<List<UserModel>> getMyModels() async {
    final db = await _dataBaseProvider.database;
    final maps = await db.query("my_table");
    return List.generate(maps.length, (i) => UserModel.fromMap(maps[i]));
  }

  @override
  Future<int> insertMyModel(UserModel myModel) async {
    final db = await _dataBaseProvider.database;
    return await db.insert('my_table', myModel.toMap());
  }
}
