import 'package:app_ewally/Design/colors.dart';
import 'package:app_ewally/Design/curves/curved_left.dart';
import 'package:app_ewally/Design/curves/curved_left_shadow.dart';
import 'package:app_ewally/features/Home/screens/home.dart';
import 'package:app_ewally/features/Login/components/button_singin.dart';
import 'package:app_ewally/features/Login/components/email_textField.dart';
import 'package:app_ewally/features/Login/components/password_textField.dart';
import 'package:app_ewally/features/Login/controller/controller_login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoading = false;
  bool isVisible = true;
  Size size;
  final GlobalKey<ScaffoldState> keyScaffold = GlobalKey<ScaffoldState>();

  Color lightBlue = DesignColors.lightBlue();
  Color greenPool = DesignColors.greenPool();
  Color white = DesignColors.white();

  final loginController = LoginController();

  @override
  void initState() {
    super.initState();

    loginController.setPassword('');
    loginController.setUser('');
    loginController.inKeyScaffold.add(keyScaffold);
  }

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return Scaffold(
        key: keyScaffold,
        backgroundColor: Colors.white,
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            if(MediaQuery.of(context).viewInsets.bottom == 0)
              Positioned(top: 0, left: 0, child: CurvedLeftShadow()),
            if(MediaQuery.of(context).viewInsets.bottom == 0)
              Positioned(top: 0, left: 0, child: CurvedLeft()),
            Container(
              padding: EdgeInsets.all(size.width * 0.05),
              alignment: Alignment.center,
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: _body(context),
                  ),
                ),
              ),
            ),
          ],
        )
    );

  }

  List<Widget> _body(BuildContext context){

    return [
      _title(),
      _br(0.05),
      LoginUserTextField(
        onChanged: loginController.setUser,
        element: loginController.outUser,
      ),
      _br(0.05),
      StreamBuilder(
        stream: loginController.outVisible,
        initialData: false,
        builder: (_, snapshotIsVisible){
          return LoginPasswordTextField(
            isVisible: snapshotIsVisible.data,
            onChanged: loginController.setPassword,
            element: loginController.outPassword,
            loginBloc: loginController,
          );
        },
      ),
      _br(0.1),
      StreamBuilder(
        stream: loginController.outLoading,
        initialData: false,
        builder: (_, snapshotLoading){
          return StreamBuilder<bool>(
            stream: loginController.outSubmitValid,
            builder: (_, snpashotSubmitValid){
              return LoginButtonSignIn(
                  isLoading: snapshotLoading.data,
                  onPress: !loginController.getResult ? null : () async {
                    await loginController.login().then((value){
                      if(value){
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_)=> Home())
                        );
                      }
                    });
                  }
              );
            },
          );
        },
      ),
      _br(0.12),
      _lineBottom(),
    ];
  }

  Widget _br(double height){
    return SizedBox(height: size.width * height);
  }

  Widget _title() {
    return Text(
        "MyWallet",
        textAlign: TextAlign.center,
        style: GoogleFonts.montserrat(
          fontSize: size.width * 0.15,
          color: lightBlue,
        )
    );
  }

  Widget _divider(){
    return Row(
      children: <Widget>[
        Expanded(child: Divider(color: Colors.white, thickness: 1)),
        SizedBox(width: 10),
        Text("OU", style: TextStyle(color: Colors.white)),
        SizedBox(width: 10),
        Expanded(child: Divider(color: Colors.white, thickness: 1)),
      ],
    );
  }

  Widget _lineBottom(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text("Esqueceu a senha?",
            style: TextStyle(
                color: lightBlue,
                fontWeight: FontWeight.w500,
                fontSize: 16)
        ),
        Text("Criar conta",
            style: TextStyle(
                color: lightBlue,
                fontWeight: FontWeight.w500,
                fontSize: 16)
        )
      ],
    );
  }

}
