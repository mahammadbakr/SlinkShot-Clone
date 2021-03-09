import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainTextField extends StatelessWidget {
  Function onChanged;
  Function validator;
  String icon;
  String hint;
  bool isPassword;


  MainTextField({this.onChanged, this.validator, this.icon, this.hint,this.isPassword});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: EdgeInsets.all(8),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12)),
        suffixIcon: ImageIcon(
          AssetImage(icon),
        ),
      ),
    );
  }
}
