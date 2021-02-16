import 'package:app_ewally/services/Convert/convert_cent_to_money.dart';
import 'package:flutter/material.dart';

class Balance extends StatefulWidget {

  final int balance;

  Balance({this.balance});

  @override
  _BalanceState createState() => _BalanceState();
}

class _BalanceState extends State<Balance> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(
          left: size.width * 0.05,
          top: size.width * 0.1
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Saldo em conta', key: Key('balance')),
          Text(ConvertCents.convert(widget.balance),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.07
              )
          )
        ],
      ),
    );
  }
}
