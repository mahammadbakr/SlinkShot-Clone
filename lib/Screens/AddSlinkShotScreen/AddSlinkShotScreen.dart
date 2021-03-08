import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slinkshot_clone/Components/MainButton.dart';
import 'package:slinkshot_clone/Constants/AppIcons.dart';
import 'package:slinkshot_clone/Constants/AppTextStyle.dart';
import 'package:slinkshot_clone/Constants/ColorConstants.dart';
import 'package:slinkshot_clone/Providers/AuthenticationProvider.dart';
import 'package:slinkshot_clone/Providers/OtherProvider.dart' as other;

class AddSlinkShotScreen extends StatefulWidget {
  @override
  _AddSlinkShotScreenState createState() => _AddSlinkShotScreenState();
}

class _AddSlinkShotScreenState extends State<AddSlinkShotScreen> {
  Map<String, String> dataMap = {
    "name": "",
    "user": "",
    "userDetails": "",
    "description": "",
    "videoUrl": ""
  };

  final _formKey = GlobalKey<FormState>();

  void onSubmit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    other.OtherProvider provider =
        Provider.of<other.OtherProvider>(context, listen: false);

   final bool status= await  provider.addSlinkshot(
        name: dataMap["name"],
        description: dataMap["description"],
        videoUrl: dataMap["videoUrl"],
        user: dataMap["user"],
        userDetails: dataMap["userDetails"]);

    if (status) {
      Navigator.pushNamed(context, "/home");
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.white,
          elevation: 4,
          title: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Warning:",
                style: AppTextStyle.boldTitle24
                    .copyWith(color: PaletteColors.blackAppColor),
              )),
          content: Text("There is problem adding this slinkshot meanwhile..."),
          actions: [
            FlatButton(
              height: 40,
              color: PaletteColors.blueColorApp,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cancel",
                style:
                    AppTextStyle.regularTitle16.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    AuthenticationProvider auth =
        Provider.of<AuthenticationProvider>(context, listen: false);
    dataMap["user"] = auth.myUser.id.toString();
    dataMap["userDetails"] = auth.myUserDetails.id.toString();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: PaletteColors.blackAppColor,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Title",
                        style: AppTextStyle.boldTitle22
                            .copyWith(color: PaletteColors.mainAppColor),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: TextFormField(
                        onChanged: (text) {
                          dataMap["name"] = text;
                        },
                        validator: (text) {
                          if (text.length < 4) {
                            return "title not valid";
                          } else {
                            return null;
                          }
                        },
                        style: AppTextStyle.thinTitle18,
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          hintText: 'title',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 0.5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Desc",
                        style: AppTextStyle.boldTitle22
                            .copyWith(color: PaletteColors.mainAppColor),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: TextFormField(
                        onChanged: (text) {
                          dataMap["description"] = text;
                        },
                        validator: (text) {
                          if (text.length < 4) {
                            return "description not valid";
                          } else {
                            return null;
                          }
                        },
                        style: AppTextStyle.thinTitle16,
                        maxLines: 5,
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          hintText: 'description',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 0.5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        "video",
                        style: AppTextStyle.boldTitle20
                            .copyWith(color: PaletteColors.mainAppColor),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: TextFormField(
                        onChanged: (text) {
                          dataMap["videoUrl"] = text;
                        },
                        validator: (text) {
                          if (text.length < 4) {
                            return "Video Url is not valid";
                          } else {
                            return null;
                          }
                        },
                        style: AppTextStyle.thinTitle16,
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          hintText: 'video url (only youtube)',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 0.5,
                ),
                MainButton(
                  onPressed: onSubmit,
                  label: "Add SlinkShot",
                  color: PaletteColors.blueColorApp,
                  icon: "null",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
