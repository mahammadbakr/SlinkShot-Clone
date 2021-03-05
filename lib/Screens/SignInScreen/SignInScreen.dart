import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slinkshot_clone/Constants/AppIcons.dart';
import 'package:slinkshot_clone/Constants/AppTextStyle.dart';
import 'package:slinkshot_clone/Constants/ColorConstants.dart';
import 'package:slinkshot_clone/Providers/AuthenticationProvider.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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

    final auth = Provider.of<AuthenticationProvider>(context, listen: false);
    var status = await auth.login(
        username: authMap["username"],
        password: authMap["password"]);

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
                // enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 4),
                autoPlayAnimationDuration: Duration(milliseconds: 1500),
                autoPlayCurve: Curves.fastOutSlowIn,
                // enlargeCenterPage: true,
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
                    },
                    validator: (text) {
                      if (text.length < 4) {
                        return "password not valid";
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
                            "Sign In",
                            style: AppTextStyle.regularTitle16
                                .copyWith(color: Colors.white),
                          ),
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
    );
  }
}
