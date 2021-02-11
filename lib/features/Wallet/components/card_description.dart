import 'package:app_ewally/features/Design/colors.dart';
import 'package:app_ewally/services/Convert/convert_cent_to_money.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    if(!widget.data['amount'].toString().contains('-')){
      setState(() {
        positiveAmount = true;
      });
    }

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
                    Text('Pagamento realizado'),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Text(
                    ConvertCents.convert(widget.data['amount']),
                    style: TextStyle(color: positiveAmount ? Colors.green : Colors.red)
                )
              ],
            )
          ],
        ),
      ),
    );

    return Container(
      margin: EdgeInsets.all(size.width * 0.01),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: white,
        border: Border.all(
          width: 0.5,
          color: Colors.black38
        )
      ),
      child: Container(height: size.width * 0.1,),
    );
  }

  Widget _br(double number){
    return SizedBox(height: size.width * number);
  }
  
}
