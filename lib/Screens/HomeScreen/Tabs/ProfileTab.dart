import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slinkshot_clone/Components/StaticFunctions.dart';
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
          FadeInImage.assetNetwork(
            placeholder: AppIcons.imageLoading,
            image: auth.mySkin.image,
            height: 150,
            width: 150,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                children: [
                  Text(
                    auth.myUser.username,
                    style: AppTextStyle.boldTitle34.copyWith(
                        letterSpacing: 1.3, color: PaletteColors.blueColorApp),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                    onTap: ()=>lunchURL(auth.myUserDetails.channel.toString()),
                      child: Image.asset(
                    AppIcons.youtube,
                    width: 70,
                    height: 50,
                  ))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Text(
                    "Your Slink Coins:",
                    style: AppTextStyle.boldTitle18,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: PaletteColors.buttonColor,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            AppIcons.slinkCoin,
                            width: 20,
                            height: 20,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(auth.myUserDetails.wallet.toString(),
                              style: AppTextStyle.regularTitle16.copyWith(
                                  color: PaletteColors.mainBackground)),
                        ],
                      )),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: PaletteColors.lightColorApp,
            ),
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            padding: EdgeInsets.all(6),
            child: Text(
              auth.myUserDetails.bio,
              textAlign: TextAlign.justify,
              style: AppTextStyle.regularTitle16,
            ),
          ),
          ProfileMenu(
            text: "Edit Profile",
            icon: AppIcons.personGirl,
            press: () => Navigator.pushNamed(context, "/editProfile"),
          ),

          ProfileMenu(
            text: "My Skins",
            icon: AppIcons.skin2,
            press: () => Navigator.pushNamed(context, "/mySkins"),
          ),
          ProfileMenu(
            text: "My SlinkShots",
            icon: AppIcons.slinkImage,
            press: () => Navigator.pushNamed(context, "/mySlinkShots"),
          ),
          ProfileMenu(
            text: "Spin Wheel",
            icon: AppIcons.spin,
            press: () => Navigator.pushNamed(context, "/spinWheel"),
          ),
          ProfileMenu(
            text: "Notifications",
            icon: AppIcons.notification,
            press: () {warningAlert(context: context,label: "We are Sorry",content: "Sorry it is not Active right now ...");},
          ),
          ProfileMenu(
            text: "Followers",
            icon: AppIcons.love,
            press: () {warningAlert(context: context,label: "We are Sorry",content: "Sorry it is not Active right now ...");},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: AppIcons.logout,
            press: () {
              Provider.of<AuthenticationProvider>(context, listen: false)
                  .setLoginFalse();
              Navigator.pushNamed(context, "/signIn");
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
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: FlatButton(
        padding: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: PaletteColors.secondBackground,
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
