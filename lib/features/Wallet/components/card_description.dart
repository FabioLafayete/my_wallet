import 'package:app_ewally/features/Design/colors.dart';
import 'package:app_ewally/services/Convert/convert_cent_to_money.dart';
import 'package:flutter/material.dart';
import 'package:app_ewally/features/Wallet/enum/operation_type.dart';

class CardDescription extends StatefulWidget {
  
  final dynamic data;
  
  CardDescription({this.data});
  
  @override
  _CardDescriptionState createState() => _CardDescriptionState();
}

class _CardDescriptionState extends State<CardDescription> {

  Color lightBlue = DesignColors.lightBlue();
  Color greenPool = DesignColors.greenPool();
  Color white = DesignColors.white();

  Size size;
  bool positiveAmount = false;
  String operationType = '';

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    if(!widget.data['amount'].toString().contains('-')){
      setState(() {
        positiveAmount = true;
      });
    }

    if(types.containsKey(widget.data['operationType'])) {
      operationType = types[widget.data['operationType']];
    } else operationType = 'Transação';

    return Card(
      elevation: 1.3,
      shadowColor: lightBlue,
      child:  Container(
        padding: EdgeInsets.all(size.width * 0.03),
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                //color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(operationType),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Text(
                    '${!positiveAmount ? '-' : ''}'
                        '${ConvertCents.convert(widget.data['amount'])}',
                    style: TextStyle(color: positiveAmount ? Colors.green : Colors.red)
                )
              ],
            )
          ],
        ),
      ),
    );

  }

  Widget _br(double number){
    return SizedBox(height: size.width * number);
  }
  
}
