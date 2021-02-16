import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main(){
  group('Test Integration', (){

    FlutterDriver driver;

    final textUser = find.byValueKey('textFieldUser');
    final textPass = find.byValueKey('textFieldPassword');
    final buttonLogin = find.byValueKey('buttonUser');

    final errorNetwork = find.byValueKey('errorNetwork');
    final sessionExpiration = find.byValueKey('sessionExpiration');
    final balance = find.byValueKey('balance');

    Future<bool> isPresent (SerializableFinder valueKey) async {
      try{
        await driver.waitFor(valueKey, timeout: Duration(seconds: 7));
        return true;
      }catch(e){
        return false;
      }

    }

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll((){
      if(driver != null)
        driver.close();
    });

    test('login',() async {
      await driver.waitFor(find.text('ENTRAR'), timeout: Duration(seconds: 4));

      await driver.tap(textUser);
      await driver.enterText('testFrontEwally');

      await driver.tap(textPass);
      await driver.enterText('123456');

      sleep(Duration(milliseconds: 500));
      await driver.tap(buttonLogin);

      if(await isPresent(balance))
        await driver.waitFor(find.text('Saldo em conta'));

      if(await isPresent(errorNetwork))
        await driver.waitFor(find.text('Erro ao carregar dados.'));

      if(await isPresent(sessionExpiration))
        await driver.waitFor(find.text('Sessão expirada'));

    });

  });
}