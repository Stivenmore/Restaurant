class UserModel {
  final String password;
  final String email;
  final bool autenticate;

  UserModel({required this.password, required this.email, required this.autenticate});

  factory UserModel.fromJson(Map<String, dynamic> snapshot) {
    return UserModel(
        password: snapshot["password"],
        email: snapshot["email"],
        autenticate: snapshot["token"]);
  }
}
