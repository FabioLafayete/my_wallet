import 'dart:async';
import 'package:app_ewally/Design/colors.dart';
import 'package:app_ewally/Design/curves/curved_left.dart';
import 'package:app_ewally/Design/curves/curved_left_shadow.dart';
import 'package:app_ewally/Design/curves/curved_right.dart';
import 'package:app_ewally/Design/curves/curved_right_shadow.dart';
import 'package:app_ewally/features/Home/screens/home.dart';
import 'package:app_ewally/features/Login/screens/login.dart';
import 'package:app_ewally/services/SharedPreferences/sp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool login = true;

  Color lightBlue = DesignColors.lightBlue();
  Color white = DesignColors.white();

  void _goTo(){
    Timer(
        Duration(milliseconds: 3500),
            () => Navigator.of(context).pushReplacement(
            PageRouteBuilder(
                transitionDuration: Duration(seconds: 0),
                pageBuilder: (_, __, ___) =>
                login ? Login() : Home()
            )
        )
    );
  }

  void _checkLogin(){
    Shared.keepLoggedIn().then((e){
      if(e != null && e == true){
        setState(() {
          login = false;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _checkLogin();
    _goTo();
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: white,
        body: Stack(
          children: [
            Center(
                child: Text(
                  "MyWallet",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontSize: size.width * 0.15,
                    color: lightBlue,
                    //fontWeight: FontWeight.w500
                  ),
                )
            ),
            Positioned(top: 0, left: 0, child: CurvedLeftShadow()),
            Positioned(top: 0, left: 0, child: CurvedLeft()),
            Positioned(bottom: 0, left: 0, child: CurvedRightShadow()),
            Positioned(bottom: 0, left: 0, child: CurvedRight()),
          ],
        )
    );
  }
}
