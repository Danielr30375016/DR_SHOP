class UserModel {
  int id;
  String username;
  String email;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
  });

  Map<String, dynamic> toMap(UserModel userModel) => {
        "idUser": userModel.id,
        "name": userModel.username,
        "email": userModel.email,
      };

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json['id'] ?? 0,
        username: json['username'] ?? '',
        email: json['email'] ?? '',
      );
}
