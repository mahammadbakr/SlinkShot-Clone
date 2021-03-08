import 'package:flutter/material.dart';
import 'package:slinkshot_clone/Constants/AppTextStyle.dart';
import 'package:slinkshot_clone/Constants/ColorConstants.dart';

warningAlert({BuildContext context, String label, String content }) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.white,
      elevation: 4,
      title: Align(
          alignment: Alignment.topLeft,
          child: Text(
            label,
            style: AppTextStyle.boldTitle24
                .copyWith(color: PaletteColors.blackAppColor),
          )),
      content: Text(content),
      actions: [
        FlatButton(
          height: 40,
          color: PaletteColors.blueColorApp,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "Cancel",
            style: AppTextStyle.regularTitle16.copyWith(color: Colors.white),
          ),
        ),
      ],
    ),
  );
}
