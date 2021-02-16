import 'package:app_ewally/components/raisedbutton.dart';
import 'package:app_ewally/Design/colors.dart';
import 'package:flutter/material.dart';

class LoginButtonSignIn extends StatelessWidget {

  bool isLoading;
  Function onPress;

  LoginButtonSignIn({this.isLoading, this.onPress});

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    Color lightBlue = DesignColors.lightBlue();
    Color lightBlueOpacity = DesignColors.lightBlueOpacity();

    return CustomRaisedButton.show(
        key: Key('buttonUser'),
        heightButton: size.width * 0.13,
        color: lightBlueOpacity,
        borderSideColor: lightBlue,
        widthBorder: onPress != null ? 2 : 1,
        borderRadius: 7,
        elevation: 4,
        text: "ENTRAR",
        fontSize: size.width * 0.042,
        textColor: Colors.white,
        disabledColor: lightBlue.withOpacity(0.5),
        disabledTextColor: Colors.black.withOpacity(0.3),
        loading: isLoading,
        onPress: onPress
    );
  }
}
