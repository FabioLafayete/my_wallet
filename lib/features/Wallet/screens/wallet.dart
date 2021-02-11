import 'package:app_ewally/features/Wallet/components/date_statement.dart';
import 'package:app_ewally/features/Wallet/components/statement.dart';
import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {

  Size size;

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return ListView(
      children: [
        _balance(),
        _br(0.08),
        DateStatement(),
        Statement()
      ],
    );
  }

  Widget _balance(){
    return Container(
      padding: EdgeInsets.only(
          left: size.width * 0.05,
          top: size.width * 0.1
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Saldo em conta'),
          Text('R\$ 2.020,88',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.07
              )
          )
        ],
      ),
    );
  }

  Widget _br(double number){
    return SizedBox(height: size.width * number);
  }

}
