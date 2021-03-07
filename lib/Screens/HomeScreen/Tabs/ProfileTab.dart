import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slinkshot_clone/Constants/AppIcons.dart';
import 'package:slinkshot_clone/Constants/AppTextStyle.dart';
import 'package:slinkshot_clone/Constants/ColorConstants.dart';
import 'package:slinkshot_clone/Models/UserDetails.dart';
import 'package:slinkshot_clone/Providers/AuthenticationProvider.dart';
import 'package:slinkshot_clone/Providers/OtherProvider.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthenticationProvider auth =
        Provider.of<AuthenticationProvider>(context, listen: false);

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Stack(
            children: [
              FadeInImage.assetNetwork(
                placeholder: AppIcons.loading,
                image:auth.mySkin.image,
                height: 150,
                width: 150,
              ),
              Positioned(
                right: 2,top: 2,
                  child: IconButton(
                iconSize: 30,
                icon: Icon(Icons.edit),
                onPressed: () {},
              )),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: PaletteColors.yellowColorApp,
            ),
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            padding: EdgeInsets.all(6),
            child: Text(
              auth.myUserDetails.bio,
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
            press: () =>Navigator.pushNamed(context, "/mySlinkShots"),
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
              Provider.of<AuthenticationProvider>(context, listen: false)
                  .setLoginFalse();
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
        padding: EdgeInsets.all(10),
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
