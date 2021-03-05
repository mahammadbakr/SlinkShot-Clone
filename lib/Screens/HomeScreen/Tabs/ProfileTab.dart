import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slinkshot_clone/Constants/AppIcons.dart';
import 'package:slinkshot_clone/Constants/AppTextStyle.dart';
import 'package:slinkshot_clone/Constants/ColorConstants.dart';
import 'package:slinkshot_clone/Providers/AuthenticationProvider.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Image.asset(
            AppIcons.camera,
            scale: 6,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: PaletteColors.yellowColorApp,
            ),
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            padding: EdgeInsets.all(6),
            child: Text(
              "My Story Starts Where I'm Beginning  My Story Starts Where I'm Beginning to open my eyes! My Story Starts Where I'm Beginning  My Story Starts Where I'm Beginning to open my eyes! My Story Starts Where I'm Beginning ",
              style: AppTextStyle.thinTitle16,
            ),
          ),
          ProfileMenu(
            text: "Edit Profile",
            icon: AppIcons.personGirl,
            press: () => Navigator.pushNamed(context, "/editProfile"),
          ),
          ProfileMenu(
            text: "Followers",
            icon: AppIcons.love,
            press: () {},
          ),
          ProfileMenu(
            text: "My Skins",
            icon: AppIcons.skin2,
            press: () {},
          ),
          ProfileMenu(
            text: "My SlinkShots",
            icon: AppIcons.slinkImage,
            press: () {},
          ),
          ProfileMenu(
            text: "Notifications",
            icon: AppIcons.notification,
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: AppIcons.logout,
            press: () {
              Provider.of<AuthenticationProvider>(context, listen: false).setLoginFalse();
            },
          ),
        ],
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key key,
    @required this.text,
    @required this.icon,
    this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: FlatButton(
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: PaletteColors.yellowColorApp,
        onPressed: press,
        child: Row(
          children: [
            Image.asset(
              icon,
              width: 40,
              height: 40,
            ),
            SizedBox(width: 20),
            Expanded(child: Text(text)),
            Icon(
              Icons.arrow_forward_ios,
              color: PaletteColors.blackAppColor,
            ),
          ],
        ),
      ),
    );
  }
}

