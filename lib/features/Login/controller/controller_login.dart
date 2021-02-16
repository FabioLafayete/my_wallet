import 'package:app_ewally/Design/colors.dart';
import 'package:app_ewally/features/Login/repository/sign_in.dart';
import 'package:app_ewally/services/SharedPreferences/sp.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class LoginController extends BlocBase {

  LoginController();

  TextStyle style = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold
  );

  final _userController = BehaviorSubject<String>();
  Sink get inUser => _userController.sink;
  String get valueUser => _userController.value;
  Stream get outUser => _userController.stream;

  final _passwordController = BehaviorSubject<String>();
  Sink get inPassword => _passwordController.sink;
  String get valuePass => _passwordController.value;
  Stream get outPassword => _passwordController.stream;

  final _loadingController = BehaviorSubject<bool>();
  Sink get inLoading => _loadingController.sink;
  Stream get outLoading => _loadingController.stream;

  final _visibleController = BehaviorSubject<bool>();
  Sink get inVisible => _visibleController.sink;
  Stream get outVisible => _visibleController.stream;

  final _keyScaffoldController = BehaviorSubject<GlobalKey<ScaffoldState>>();
  Sink get inKeyScaffold => _keyScaffoldController.sink;

  Stream<bool> get outSubmitValid => Rx.combineLatest2(
      outUser, outPassword, (a,b) => true
  );

  Function(String) get setUser => inUser.add;
  Function(String) get setPassword => inPassword.add;

  bool get getResult => checkValue();

  bool checkValue(){
    if(valueUser.length >= 3
        && valuePass.length >= 6){
      return true;
    } else return false;
  }

  void _messageStatus(String status, {Color color}){
    _keyScaffoldController.value.currentState.showSnackBar(
        SnackBar(
          backgroundColor: color ?? Colors.red,
          content: Text(
              status,
              style: style
          ),
          duration: Duration(seconds: 4),
        )
    );
  }

  Future<bool> login() async {

    bool result = false;
    inLoading.add(true);

    await signIn(valueUser, valuePass).then((model) async {

      if(model.hasError()){
        if(_keyScaffoldController.value != null)
          _messageStatus(model.error, color: Colors.redAccent);

      } else {

        Shared.saveToken(model.token, true);

        if(_keyScaffoldController.value != null)
          _messageStatus(
              'Seja bem-vindo :)',
              color: DesignColors.lightBlue()
          );

        await Future.delayed(Duration(seconds: 3));

        result = true;
      }

    }).catchError((e){
      print(e);
      result = false;
      if(_keyScaffoldController.value != null)
        _messageStatus('Erro ao fazer login...');

    }).whenComplete(() => inLoading.add(false));

    return result;
  }

  @override
  void dispose() {
    _userController.close();
    _passwordController.close();
    _loadingController.close();
    _keyScaffoldController.close();
    _visibleController.close();
  }
}