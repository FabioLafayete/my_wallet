import 'package:app_ewally/Design/colors.dart';
import 'package:flutter/material.dart';

class CustomRaisedButton {

  static Widget show ({
    VoidCallback onPress,
    String text,
    bool loading = false,
    double elevation,
    double borderRadius,
    double heightButton,
    double widthButton,
    Color color,
    Color textColor,
    Color disabledColor,
    Color disabledTextColor,
    Color borderSideColor,
    double fontSize,
    double widthBorder
  }){
    return SizedBox(
        height: heightButton,
        width: widthButton,
        child: RaisedButton(
            color: color,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: borderSideColor, width: widthBorder),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            elevation: elevation,
            child: loading ? Padding(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: Center(
                  child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(DesignColors.greenPool()),
                  )
              ),
            ) :
            Text(text,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: fontSize)),
            textColor: textColor,
            disabledColor: disabledColor,
            disabledTextColor: disabledTextColor,
            onPressed: onPress
        )
    );
  }



  static Widget iconButton({
    VoidCallback onPress,
    String text,
    double elevation,
    double borderRadius,
    double heightButton,
    Color color,
    Color textColor,
    Color disabledColor,
    Color borderSideColor,
    Color backgroundIconColor,
    Color imageColor,
    double fontSize,
    double widthBorder,
    String imageAsset,
    Size size
  }){
    return SizedBox(
      height: heightButton,
      child: RaisedButton(
          color: color,
          padding: EdgeInsets.all(0.0),
          shape: RoundedRectangleBorder(
            side:
            BorderSide(color: borderSideColor, width: widthBorder),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: elevation,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: backgroundIconColor ?? Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(borderRadius),
                    bottomLeft: Radius.circular(borderRadius),
                  )
                ),
                height: double.infinity,
                width: size.width * 0.18,
                padding: EdgeInsets.only(
                  left: size.width * 0.05,
                  right: size.width * 0.05,
                  top: size.width * 0.02,
                  bottom: size.width * 0.02
                ),
                child: Image.asset(
                  "assets/images/" + imageAsset,
                  color: imageColor,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(width: size.width * 0.05),
              Text(text,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize,
                    color: textColor
                  )),
              
            ],
          ),
          disabledColor: disabledColor,
          onPressed: onPress
      ),
    );
  }

}