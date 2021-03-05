import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slinkshot_clone/Constants/AppIcons.dart';
import 'package:slinkshot_clone/Constants/AppTextStyle.dart';
import 'package:slinkshot_clone/Constants/ColorConstants.dart';
import 'package:slinkshot_clone/Providers/AuthenticationProvider.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isEqual = false;
  Map<String, String> authMap = {
    "username": "",
    "password": "",
    "confirm-password": ""
  };

  final _formKey = GlobalKey<FormState>();

  void onSubmit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    if (!isEqual) {
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
          content: Text("Passwords not match !"),
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

    final auth = Provider.of<AuthenticationProvider>(context, listen: false);
    var status = await auth.register(
        username: authMap["username"], password: authMap["password"]);

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
          content: Text("Password or Username not valid..."),
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
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    "Welcome !",
                    style: AppTextStyle.thinTitle16
                        .copyWith(color: PaletteColors.blackAppColor),
                  ),
                ),
                Text(
                  "Sign up a new Account !",
                  style: AppTextStyle.boldTitle24
                      .copyWith(color: PaletteColors.blackAppColor),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    "Fill the below form please ...",
                    style: AppTextStyle.thinTitle16
                        .copyWith(color: PaletteColors.blackAppColor),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  onChanged: (text) {
                    authMap["username"] = text;
                  },
                  validator: (text) {
                    if (text.length < 4) {
                      return "username not valid";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'User Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    suffixIcon: ImageIcon(
                      AssetImage(AppIcons.username),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  onChanged: (text) {
                    authMap["password"] = text;
                    if (authMap["password"] == authMap["confirm-password"]) {
                      isEqual = true;
                    }
                  },
                  validator: (text) {
                    if (text.length < 4) {
                      return "username not valid";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    suffixIcon: ImageIcon(
                      AssetImage(AppIcons.password),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  onChanged: (text) {
                    authMap["confirm-password"] = text;
                    if (authMap["password"] == authMap["confirm-password"]) {
                      isEqual = true;
                    }
                  },
                  validator: (text) {
                    if (text.length < 4) {
                      return "username not valid";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    suffixIcon: ImageIcon(
                      AssetImage(AppIcons.password),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                isEqual
                    ? Text(
                        "Passwords are not match !",
                        style: AppTextStyle.thinTitle16
                            .copyWith(color: Colors.red),
                      )
                    : SizedBox.shrink(),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      FlatButton(
                        height: 40,
                        color: PaletteColors.blueColorApp,
                        onPressed: onSubmit,
                        child: Text(
                          "Sign Up",
                          style: AppTextStyle.regularTitle16
                              .copyWith(color: Colors.white),
                        ),
                      ),
                      Spacer(),
                      FlatButton(
                        height: 40,
                        // color: PaletteColors.yellowColorApp,
                        onPressed: () {
                          Navigator.pushNamed(context, "/signIn");
                        },
                        child: Row(
                          children: [
                            Text(
                              "Already you have an Account ? ",
                              style: AppTextStyle.regularTitle10.copyWith(
                                  color: PaletteColors.blackAppColor
                                      .withOpacity(0.8)),
                            ),
                            Text(
                              "SignIn",
                              style: AppTextStyle.regularTitle14
                                  .copyWith(color: PaletteColors.blueColorApp),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
