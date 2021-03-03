import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slinkshot_clone/Constants/ColorConstants.dart';
import 'package:slinkshot_clone/Screens/HomeScreen/HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeScreen()),);
    }
    );
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PaletteColors.secondBackground,
      body: Center(child: Image.asset("assets/images/logo.gif"),),
    );
  }
}
