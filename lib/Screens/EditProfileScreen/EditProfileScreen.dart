import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slinkshot_clone/Components/MainButton.dart';
import 'package:slinkshot_clone/Constants/AppIcons.dart';
import 'package:slinkshot_clone/Constants/AppTextStyle.dart';
import 'package:slinkshot_clone/Constants/ColorConstants.dart';
import 'package:slinkshot_clone/Providers/AuthenticationProvider.dart';

class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthenticationProvider auth =
        Provider.of<AuthenticationProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PaletteColors.secondBackground,
        centerTitle: true,
        title: Image.asset(
          AppIcons.title,
          height: 44,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
                child: Stack(
              children: [
                FadeInImage.assetNetwork(
                  placeholder: AppIcons.loading,
                  image: auth.mySkin.image,
                  height: 150,
                  width: 150,
                ),
                Positioned(
                    right: 2,
                    top: 2,
                    child: IconButton(
                      iconSize: 30,
                      icon: Icon(Icons.edit),
                      onPressed: () {},
                    )),
              ],
            )),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "Name",
                    style: AppTextStyle.boldTitle22
                        .copyWith(color: PaletteColors.mainAppColor),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: TextFormField(
                    initialValue: auth.myUserDetails.name,
                    style: AppTextStyle.thinTitle18,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: 'name',
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
                    "Bio",
                    style: AppTextStyle.boldTitle22
                        .copyWith(color: PaletteColors.mainAppColor),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: TextFormField(
                    initialValue: auth.myUserDetails.bio,
                    style: AppTextStyle.thinTitle16,
                    maxLines: 5,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: 'write your bio',
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
                    "Channel",
                    style: AppTextStyle.boldTitle20
                        .copyWith(color: PaletteColors.mainAppColor),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: TextFormField(
                    initialValue: auth.myUserDetails.channel.isEmpty
                        ? ""
                        : auth.myUserDetails.channel,
                    style: AppTextStyle.thinTitle16,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: 'your channel link (only youtube)',
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
              label: "Save Changes",
              color: PaletteColors.blueColorApp,
              icon: "null",
            )
          ],
        ),
      ),
    );
  }
}
