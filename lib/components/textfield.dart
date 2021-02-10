import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField  {

  static Widget show({
    IconData icon,
    String hint,
    String errorText,
    bool obscure,
    Function onChanged,
    TextInputType textInputType,
    Color colorHint,
    Color colorText,
    Color colorIcon,
    Color colorBorder,
    Color colorCursor,
    bool enabled,
    Widget prefix,
    Widget suffix,
    TextEditingController controller
  }){
    return TextField(
      controller: controller ?? null,
      onChanged: onChanged,
      style: TextStyle(color: colorText),
      obscureText: obscure,
      enabled: enabled,
      keyboardType: textInputType,
      cursorColor: colorCursor,
      inputFormatters: textInputType == TextInputType.number ? [
        WhitelistingTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(3)
      ] : null,
      decoration: InputDecoration(
          errorText: errorText ?? null,
          prefixIcon: prefix,
          suffixIcon: suffix,
          contentPadding:
          EdgeInsets.only(left: 5, right: 20, bottom: 10, top: 20),
          icon: icon != null ? Icon(icon, color: colorIcon) : null,
          hintText: hint,
          hintStyle: TextStyle(color: colorHint),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: colorBorder)
          )
      ),
    );
  }


  static Widget underLineInput({
    TextEditingController controller,
    Function validator,
    IconData icon,
    String label,
    bool obscure,
    bool cpf,
    Function onChanged,
    TextInputType textInputType,
    Color colorLabel,
    Color colorText,
    Color colorIcon,
    Color colorBorder,
    Color colorCursor
  }){
    return TextFormField(
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      style: TextStyle(color: colorText),
      obscureText: obscure,
      keyboardType: textInputType,
      cursorColor: colorCursor,
      inputFormatters:
      textInputType == TextInputType.number ?
      [WhitelistingTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(3)]
          :
      null,
      decoration: InputDecoration(
          errorText: null,
          contentPadding: EdgeInsets.only(left: 5, right: 30, bottom: 10, top: 20),
          icon: icon != null ? Icon(icon, color: colorIcon) : null,
          alignLabelWithHint: true,
          labelText: label,
          labelStyle: TextStyle(
            fontSize: 16.0,
            color: colorLabel
            ,
          )
      ),
    );
  }

}