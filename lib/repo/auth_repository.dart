import '../model/user_model.dart';

class AuthRepository {
  Future<UserModel> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 2));
    return UserModel(id: 1, name: "Kuldeep", email: '');
  }

  Future<UserModel> signup(String email, String password) async {
    await Future.delayed(Duration(seconds: 2));
    return UserModel(id: 2, name: "New User", email: '');
  }
}
