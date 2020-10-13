import 'dart:convert';

import 'package:capacitacionflutter2/core/network.dart';
import 'package:capacitacionflutter2/models/Profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  Future<Profile> login(String username, String password) async {
    try {
      final jsonDecoded = await Network.post("auth/",
          {"username": username, "email": username, "password": password},
          auth: false);
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString("token", jsonDecoded["token"]);
      sharedPreferences.setString(
          "profile", json.encode(jsonDecoded["user"]["profile"]));
      return Profile.fromJson(jsonDecoded["user"]["profile"]);
    } catch (e) {
      return Future.error(e);
    }
  }
}
