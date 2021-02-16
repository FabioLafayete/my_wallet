import 'package:app_ewally/Design/colors.dart';
import 'package:flutter/material.dart';

import 'button.dart';

class SessionExpiration {
  static Widget renderSession(
      Key key,
      BuildContext context,
      Function function,
      String text,
      Size size
      ) {
    return Column(
      key: key,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Material(
            elevation: 5,
            shadowColor: Colors.white,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  _icon(size),
                  SizedBox(height: 20),
                  _title('Sessão expirada', size),
                  SizedBox(height: 20),
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: size.width * 0.04),
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: size.width * 0.05),
        Button.defaultButton(
          context: context,
          text: 'OK',
          onPressed: () => function(),
        )
      ],
    );
  }

  static Widget _icon(Size size) {
    return Container(
        alignment: Alignment.center,
        child: Icon(
            Icons.logout,
            size: size.width * 0.1,
            color: DesignColors.lightBlue()
        )
    );
  }

  static Widget _title(String text, Size size) {

    return Center(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: size.width * 0.04
        ),
      ),
    );
  }

}
