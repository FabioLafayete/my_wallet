import 'package:app_ewally/components/error_network.dart';
import 'package:app_ewally/components/session_expiration.dart';
import 'package:app_ewally/features/SplashScreen/screens/splash_screen.dart';
import 'package:app_ewally/features/Wallet/components/balance.dart';
import 'package:app_ewally/features/Wallet/components/statement.dart';
import 'package:app_ewally/features/Wallet/model/statement.dart';
import 'package:app_ewally/features/Wallet/repository/balance.dart';
import 'package:app_ewally/features/Wallet/repository/statement.dart';
import 'package:app_ewally/services/SharedPreferences/sp.dart';
import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {

  Size size;
  Future<dynamic> _fetchBalance;
  Future<List<StatementModel>> _fetchStatement;

  @override
  void initState() {
    super.initState();
    this._fetchBalance = fetchBalance();
    this._fetchStatement = fetchStatement();
  }

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return FutureBuilder(
      future: Future.wait([_fetchBalance, _fetchStatement]),
      builder: (_, snapshot){

        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if(snapshot.hasError){
          return Center(
            child: ErrorNetwork.renderError(
                context,
                refresh,
                size
            ),
          );
        }

        if(snapshot.data[0] is String
            && snapshot.data[0].contains('Sessão expirada')
        ){
          return Center(
            child: SessionExpiration.renderSession(
                context,
                logout,
                snapshot.data[0],
                size
            ),
          );
        }

        return ListView(
          children: [
            Balance(balance: snapshot.data[0]),
            _br(0.08),
            Statement(data: snapshot.data[1])
          ],
        );
      },
    );
  }

  void refresh() {
    this.setState(() {
      this._fetchBalance = fetchBalance();
      this._fetchStatement = fetchStatement();
    });
  }

  void logout (){
    Shared.resetToken();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_)=> SplashScreen())
    );
  }


  Widget _br(double number){
    return SizedBox(height: size.width * number);
  }

}
