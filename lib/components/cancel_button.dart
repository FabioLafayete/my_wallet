import 'package:app_ewally/features/Design/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CancelButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    Color pinkAccent = DesignColors.pinkAccent();
    Color lightBlue = DesignColors.lightBlue();

    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.arrow_back_ios, color: pinkAccent, size: size.width * 0.055),
            Text('Voltar',
                style: GoogleFonts.firaSans(
                    color: Colors.white,
                    fontSize: size.width * 0.045
                )
            )
          ],
        ),
      ),
    );
  }
}
