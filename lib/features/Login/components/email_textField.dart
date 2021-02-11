import 'package:app_ewally/components/textfield.dart';
import 'package:app_ewally/Design/colors.dart';
import 'package:flutter/material.dart';

class LoginUserTextField extends StatelessWidget {

  Function onChanged;
  TextEditingController controller;
  Stream<String> element;

  LoginUserTextField({
    this.onChanged,
    this.element,
    this.controller
  });

  @override
  Widget build(BuildContext context) {

    Color lightBlue = DesignColors.lightBlue();

    return StreamBuilder<String>(
      stream: element,
      builder: (_, snapshot){
        return CustomTextField.show(
          controller: controller,
          hint: " Usuário",
          icon: Icons.person_outline,
          obscure: false,
          colorHint: lightBlue,
          colorText: lightBlue,
          colorIcon: lightBlue,
          colorBorder: lightBlue,
          colorCursor: lightBlue,
          textInputType: TextInputType.emailAddress,
          onChanged: onChanged
        );
      },
    );
  }
}
