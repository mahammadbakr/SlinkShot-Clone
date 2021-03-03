import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slinkshot_clone/Constants/ColorConstants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PaletteColors.mainBackground,
      body: Container(
        width: double.infinity,
        height: 90,
        color: PaletteColors.secondBackground,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/images/logo.png",
             width: 200,
              height: 200,
            )
          ],
        ),
      ),
    );
  }
}
