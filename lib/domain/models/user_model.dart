class UserModel {
  final int id;
  final String name;

  UserModel({required this.id, required this.name});

  factory UserModel.fromMap(Map<String, dynamic> map) =>
      UserModel(id: map['id'], name: map['name']);

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
      };
}
