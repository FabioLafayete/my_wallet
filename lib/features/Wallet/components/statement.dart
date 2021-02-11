import 'package:app_ewally/features/Design/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:app_ewally/.env.dart';
import 'package:app_ewally/services/Convert/convert_cent_to_money.dart';

class Statement extends StatefulWidget {
  @override
  _StatementState createState() => _StatementState();
}

class _StatementState extends State<Statement> {

  Color lightBlue = DesignColors.lightBlue();
  Color greenPool = DesignColors.greenPool();
  Color paper = DesignColors.paper();

  Size size;

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return Container(
      color: paper,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(env['balance'].length, (index){
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _dateBalance(env['balance'][index]),
                _br(0.02),
                _balance(index),
                _br(0.07),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _br(double number){
    return SizedBox(height: size.width * number);
  }

  Widget _dateBalance(dynamic data){
    DateFormat dateFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss", 'pt_Br');
    DateTime date = dateFormat.parse(data['createdAt']);

    String hour = date.hour.toString().padLeft(2, '0');
    String minute = date.minute.toString().padLeft(2, '0');
    String month = DateFormat.MMMM('pt_Br').format(date);
    month = month.replaceAll(month[0], month[0].toUpperCase());
    String day = '${date.day}'.length <= 1 ? '0${date.day}' : '${date.day}';

    String resultDate = '$day de $month / ${date.year}';

    return Text(
        resultDate,
        style: TextStyle(
            fontSize: size.width * 0.04,
            color: lightBlue,
            fontWeight: FontWeight.w600
        )
    );
  }

  Widget _balance(int index){
    return RichText(
      text: TextSpan(
        style: new TextStyle(
          fontSize: size.width * 0.035,
          color: lightBlue,
        ),
        children: <TextSpan>[
          new TextSpan(text: 'Saldo do dia: '),
          new TextSpan(
              text: 'R\$ ${ConvertCents.convert(env['balance'][index]['balance'])}',
              style: new TextStyle(fontWeight: FontWeight.bold)
          ),
        ],
      ),
    );
  }
}
