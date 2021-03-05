import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slinkshot_clone/Constants/ColorConstants.dart';
import 'package:slinkshot_clone/Helper/Language.dart';
import 'package:slinkshot_clone/Providers/AuthenticationProvider.dart';
import 'package:slinkshot_clone/Providers/OtherProvider.dart';
import 'package:slinkshot_clone/Screens/HomeScreen/HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    checkLoggingState();
    // Timer(Duration(seconds: 3), () {
    //   Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => HomeScreen()),);
    // }
    // );
  }


    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PaletteColors.secondBackground,
      body: Center(child: Image.asset("assets/images/logo.gif"),),
    );
  }


  void checkLoggingState() async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Provider.of<Language>(context, listen: false).getLanguageDataInLocal();
    // String token = sharedPreferences.getString('mainToken');

      final auth = Provider.of<AuthenticationProvider>(context, listen: false);
      if (auth.isLoggedIn) {
        goToScreen("home");
      } else {
        goToScreen("signIn");
      }

  }

  void goToScreen(String route) {
    Provider.of<OtherProvider>(context, listen: false)
        .getAllSlinkshots();
    Provider.of<OtherProvider>(context, listen: false)
        .getAllSkins();
    Timer(Duration(milliseconds: 0), () {
      Navigator.pushNamed(context, '/$route');
    });
  }

}
