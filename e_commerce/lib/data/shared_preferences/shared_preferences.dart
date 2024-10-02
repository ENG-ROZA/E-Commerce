import 'dart:convert';
import 'package:e_commerce/data/models/response/auth_response.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
@injectable
class  SharedPref {
  void saveUser(User user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("user", jsonEncode(user.toJson()));
  }

  void saveToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("token", token);
  }

  Future<User?> getUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userAsString = sharedPreferences.getString("user");
    if (userAsString == null) return null;
    return User.fromJson(jsonDecode(userAsString));
  }

  Future<String?> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString("token");
  }
}
