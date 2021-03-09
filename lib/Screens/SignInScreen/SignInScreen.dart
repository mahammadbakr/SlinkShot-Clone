import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slinkshot_clone/Components/LoadingWidget.dart';
import 'package:slinkshot_clone/Components/MainButton.dart';
import 'package:slinkshot_clone/Components/MainTextField.dart';
import 'package:slinkshot_clone/Constants/AppIcons.dart';
import 'package:slinkshot_clone/Constants/AppTextStyle.dart';
import 'package:slinkshot_clone/Constants/ColorConstants.dart';
import 'package:slinkshot_clone/Providers/AuthenticationProvider.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  
  bool isLoading=false;
  final List<String> imgList = [
    AppIcons.view1,
    AppIcons.view2,
    AppIcons.view3,
  ];

  Map<String, String> authMap = {"username": "", "password": ""};

  final _formKey = GlobalKey<FormState>();

  void onSubmit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    setState(() {
      isLoading=true;
    });
    final auth = Provider.of<AuthenticationProvider>(context, listen: false);
    var status = await auth.login(
        username: authMap["username"],
        password: authMap["password"]);

    if (status) {
      setState(() {
        isLoading=false;
      });
      Navigator.pushNamed(context, "/home");
    } else {
      setState(() {
        isLoading=false;
      });
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
                style: AppTextStyle.regularTitle16
                    .copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // final words = Provider.of<Language>(context, listen: false).words;

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 300,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 4),
                        autoPlayAnimationDuration: Duration(milliseconds: 1500),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        scrollDirection: Axis.horizontal,
                      ),
                      items: imgList.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Image.asset(i);
                          },
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                      child: Column(
                        children: [

                          MainTextField(
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
                            hint:'User Name' ,
                            icon: AppIcons.username,
                              isPassword:false

                          ),

                          SizedBox(
                            height: 10,
                          ),

                          MainTextField(
                            onChanged: (text) {
                              authMap["password"] = text;
                            },
                            validator: (text) {
                              if (text.length < 5) {
                                return "password not valid";
                              } else {
                                return null;
                              }
                            },
                            hint:'Password' ,
                            icon: AppIcons.password,
                            isPassword:true
                          ),

                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              children: [
                                MainButton(
                                  label: "Sign In",
                                  color: PaletteColors.blueColorApp,
                                  icon: "null",
                                  onPressed:onSubmit,
                                ),
                                Spacer(),
                                FlatButton(
                                  height: 40,
                                  // color: PaletteColors.yellowColorApp,
                                  onPressed: () {
                                    Navigator.pushNamed(context, "/signUp");
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        "Haven't Account ? ",
                                        style: AppTextStyle.regularTitle10.copyWith(
                                            color: PaletteColors.blackAppColor
                                                .withOpacity(0.8)),
                                      ),
                                      Text(
                                        "SignUp",
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
                    ),
                  ],
                ),
              ),
            ),
            
          isLoading?  LoadingWidget():SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
