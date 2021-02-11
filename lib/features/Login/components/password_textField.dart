import 'package:app_ewally/components/eye_button.dart';
import 'package:app_ewally/components/textfield.dart';
import 'package:app_ewally/Design/colors.dart';
import 'package:app_ewally/features/Login/controller/controller_login.dart';
import 'package:flutter/material.dart';

class LoginPasswordTextField extends StatelessWidget {

  bool isVisible;
  Function onChanged;
  LoginController loginBloc;
  final Stream<String> element;

  LoginPasswordTextField({
    this.isVisible,
    this.onChanged,
    this.element,
    this.loginBloc
  });

  Color pinkAccent = DesignColors.pinkAccent();
  Color lightBlue = DesignColors.lightBlue();
  Color greenPool = DesignColors.greenPool();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return StreamBuilder(
      stream: element,
      builder: (_, snapshot){
        return CustomTextField.show(
            hint: " Senha",
            icon: Icons.lock_outline,
            obscure: !isVisible,
            onChanged: onChanged,
            enabled: true,
            colorHint: lightBlue,
            colorText: lightBlue,
            colorIcon: greenPool,
            colorBorder: lightBlue,
            colorCursor: lightBlue,
            suffix: CustomIconButton(
              radius: size.width * 0.05,
              color: greenPool,
              iconData:
              !isVisible ? Icons.visibility_off : Icons.visibility,
              onTap: () => loginBloc.inVisible.add(!isVisible),
            )
        );
      },
    );
  }
}
