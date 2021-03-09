import 'package:flutter/material.dart';
import 'package:slinkshot_clone/Constants/AppIcons.dart';
import 'package:slinkshot_clone/Constants/AppTextStyle.dart';
import 'package:slinkshot_clone/Constants/ColorConstants.dart';
import 'package:url_launcher/url_launcher.dart';

warningAlert({BuildContext context, String label, String content }) {
  return showDialog(
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4)
      ),
      child: Container(
        height: 250,
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.white70,
                child: Image.asset(AppIcons.logo,width: 90,height: 90,),
              ),
            ),
            Expanded(
              child: Container(
                color: PaletteColors.mainAppColor,
                child: SizedBox.expand(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(label,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(content,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        RaisedButton(
                          color: Colors.white,
                          child: Text('Okay'),
                          onPressed: ()=> {
                            Navigator.of(context).pop()
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    )
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