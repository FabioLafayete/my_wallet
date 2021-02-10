import 'package:shared_preferences/shared_preferences.dart';

class Shared {

  static Future saveToken(String token, bool keepLoggedIn) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', token);
    sp.setBool('keepLoggedIn', keepLoggedIn);
  }

  static Future resetToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    if (sp.getKeys().contains("token")) {
      sp.remove('token');
    }
    if (sp.getKeys().contains("keepLoggedIn")) {
      sp.remove('keepLoggedIn');
    }
  }

  static Future<String> getToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    if (sp.getKeys().contains("token")) {
      return sp.getString("token");
    }

    return null;
  }

  static Future<bool> keepLoggedIn() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    if (sp.getKeys().contains("keepLoggedIn")) {
      if (sp.getKeys().contains("token")) {

        if(sp.getString("token").isNotEmpty){
          return sp.getBool("keepLoggedIn");
        } else return false;

      }
    }

    return false;
  }

}