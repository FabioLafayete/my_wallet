import 'package:app_ewally/features/Design/colors.dart';
import 'package:flutter/material.dart';

class DateStatement extends StatefulWidget {
  @override
  _DateStatementState createState() => _DateStatementState();
}

class _DateStatementState extends State<DateStatement> {

  List<Map<String, dynamic>> _days = [
    {"name": "7 dias", "value": 7},
    {"name": "15 dias", "value": 15},
    {"name": "30 dias", "value": 30},
  ];

  String selected = '';
  Size size;

  Color lightBlue = DesignColors.lightBlue();
  Color greenPool = DesignColors.greenPool();
  Color white = DesignColors.white();

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;


    return Container(
      width: size.width,
      height: size.width * 0.1,
      color: Colors.grey.withOpacity(0.5),
      padding: EdgeInsets.only(
        left: size.width * 0.05,
        right: size.width * 0.05,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(_days.length,
                (index) => _date(_days[index]['name'])
        )..add(_date('Outro')),
      ),
    );
  }

  Widget _date(String name){
    return GestureDetector(
      onTap: () => setState(() => selected = name),
      child: Container(
        padding: EdgeInsets.all(size.width * 0.015),
        margin: EdgeInsets.only(right: size.width * 0.04),
        decoration: BoxDecoration(
            color: selected == name ? lightBlue : Colors.transparent,
            borderRadius: BorderRadius.circular(15)
        ),
        child: Text(
            name,
            style: TextStyle(
                color: selected == name ? white : lightBlue,
                fontSize: size.width * 0.04,
                fontWeight: FontWeight.w500
            )
        )
      ),
    );
  }

}
