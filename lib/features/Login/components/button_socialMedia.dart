import 'package:app_ewally/components/raisedbutton.dart';
import 'package:app_ewally/features/Design/colors.dart';
import 'package:flutter/material.dart';

class LoginButtonSocialMedia extends StatelessWidget {

  final String text;
  final String pathIcon;
  final Function onPress;

  LoginButtonSocialMedia({
    this.text,
    this.pathIcon,
    this.onPress
  });

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    Color lightBlue = DesignColors.lightBlue();

    return CustomRaisedButton.iconButton(
        size: size,
        heightButton: size.width * 0.13,
        color: Colors.white,
        backgroundIconColor: lightBlue.withOpacity(0.9),
        borderSideColor: lightBlue,
        widthBorder: 1,
        borderRadius: 7,
        elevation: 2,
        text: text,
        fontSize: size.width * 0.042,
        textColor: lightBlue,
        disabledColor: Colors.black.withOpacity(0.1),
        imageColor: Colors.white,
        imageAsset: pathIcon,
        onPress: onPress
    );
  }
}
