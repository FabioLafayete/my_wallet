import 'package:app_ewally/Design/colors.dart';
import 'package:app_ewally/features/Wallet/model/statement.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:app_ewally/services/Convert/convert_cent_to_money.dart';

import 'card_description.dart';

class Statement extends StatefulWidget {

  List<StatementModel> data;

  Statement({this.data});

  @override
  _StatementState createState() => _StatementState();
}

class _StatementState extends State<Statement> {

  Color lightBlue = DesignColors.lightBlue();
  Color greenPool = DesignColors.greenPool();
  Color paper = DesignColors.paper();

  Size size;

  @override
  void initState() {
    super.initState();
    widget.data = widget.data.reversed.toList();
  }

  @override
  Widget build(BuildContext context) {

    List<String> listOfDays = [];
    size = MediaQuery.of(context).size;

    return Container(
      color: paper,
      padding: EdgeInsets.all(size.width * 0.02),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(widget.data.length, (index){

          String day = widget.data[index].createdAt.substring(0, 10);
          bool addDay = true;

          if(!listOfDays.contains(day)){
            setState(() => listOfDays.add(day));
          } else setState(() => addDay = false);

          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if(addDay && listOfDays.length >= 2)
                  _br(0.1),

                if(addDay && listOfDays.length == 1)
                  _br(0.05),

                if(addDay)
                  _dateBalance(widget.data[index]),

                if(addDay)
                  _br(0.01),

                if(addDay)
                  _balance(index),

                if(addDay)
                  _br(0.03),

                CardDescription(data: widget.data[index])
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

  Widget _dateBalance(StatementModel data){
    DateFormat dateFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss", 'pt_Br');
    DateTime date = dateFormat.parse(data.createdAt);

    String hour = date.hour.toString().padLeft(2, '0');
    String minute = date.minute.toString().padLeft(2, '0');
    String month = DateFormat.MMMM('pt_Br').format(date);
    month = month.replaceAll(month[0], month[0].toUpperCase());
    String day = '${date.day}'.length <= 1 ? '0${date.day}' : '${date.day}';

    String resultDate = '$day de $month / ${date.year}';

    return Text(
        ' $resultDate',
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
          new TextSpan(text: ' Saldo do dia: '),
          new TextSpan(
              text: ConvertCents.convert(widget.data[index].balance),
              style: new TextStyle(fontWeight: FontWeight.bold)
          ),
        ],
      ),
    );
  }
}
