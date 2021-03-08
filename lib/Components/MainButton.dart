import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slinkshot_clone/Constants/AppIcons.dart';
import 'package:slinkshot_clone/Constants/ColorConstants.dart';

class MainButton extends StatelessWidget {
   String label;
   String icon;
   Color color;
   Function onPressed;


   MainButton({this.label, this.icon , this.color,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.zero,
      color:
      color,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         icon!="null" ? Image.asset(
            icon,
            width: 18,
            height: 18,
            color: PaletteColors.mainBackground,
          ):SizedBox.shrink(),
          SizedBox(
            width: 6,
          ),
          Text(label),
        ],
      ),
      textColor: PaletteColors.mainBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      onPressed: onPressed,
    );
  }
}
