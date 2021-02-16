import 'package:app_ewally/features/Login/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main (){

  testWidgets('Login - Render', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Login(),
    ));

    expect(find.text('MyWallet'), findsOneWidget);
    expect(find.text('ENTRAR'), findsOneWidget);
    expect(find.text('Criar conta'), findsOneWidget);
    expect(find.text('Esqueceu a senha?'), findsOneWidget);

    expect(find.byType(RaisedButton), findsOneWidget);
    expect(find.widgetWithIcon(TextField, Icons.visibility_off), findsOneWidget);

  });
}