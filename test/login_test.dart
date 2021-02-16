import 'package:app_ewally/features/Login/controller/controller_login.dart';
import 'package:app_ewally/features/Login/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

main (){
  LoginController controller;

  setUpAll((){
    controller = LoginController();

  });

  group('Login test', (){

    test('check user and password',(){
      controller.setPassword('');
      controller.setUser('');

      expect(controller.getResult, false);

      controller.setUser('username');
      controller.setPassword('password');
      expect(controller.getResult, true);
    });

    test('Login is true',() async {
      SharedPreferences.setMockInitialValues(<String, dynamic>{
        "token": "",
        "keepLoggedIn": false
      });
      await SharedPreferences.getInstance();

      controller.setUser('testFrontEwally');
      controller.setPassword('123456');

      bool result = await controller.login();

      expect(result, true);
    });

    test('Login is false',() async {

      controller.setUser('testUserFalse');
      controller.setPassword('123123');

      bool result = await controller.login();

      expect(result, false);
    });

  });
}