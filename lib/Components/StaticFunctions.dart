import 'package:flutter/material.dart';
import 'package:slinkshot_clone/Constants/AppTextStyle.dart';
import 'package:slinkshot_clone/Constants/ColorConstants.dart';
import 'package:url_launcher/url_launcher.dart';

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

askingAlert({BuildContext context,String label,String content,String labelBtn,Function onClickBtn }) {

  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text("Cancel"),
    onPressed: ()=>Navigator.pop(context),
  );
  Widget continueButton = FlatButton(
    child: Text(labelBtn),
    onPressed:  onClickBtn,
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(label),
    content: Text(content),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

lunchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}