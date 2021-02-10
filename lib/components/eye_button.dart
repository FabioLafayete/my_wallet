import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {

  CustomIconButton({this.radius, this.iconData, this.onTap, this.color});

  final double radius;
  final IconData iconData;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child : Material(
        color: Colors.transparent,
        child : InkWell(
          child : Icon(iconData, color: color),
          onTap: onTap,
        ),
      ),
    );
  }
}