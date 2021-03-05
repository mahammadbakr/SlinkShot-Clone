import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slinkshot_clone/Constants/AppIcons.dart';
import 'package:slinkshot_clone/Constants/AppTextStyle.dart';
import 'package:slinkshot_clone/Constants/ColorConstants.dart';

class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                child: Image.asset(
                  AppIcons.personBoy,
                  scale: 5,
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
                  child:TextFormField(
                    initialValue:  " Name Name",
                    style: AppTextStyle.thinTitle18,
                    textAlign: TextAlign.start,
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
                    initialValue: "My Story Starts Where I'm Beginning to open my eyes! My Story Starts Where I'm Beginning to open my eyes! My Story Starts Where I'm Beginning to open my eyes!",
                    style: AppTextStyle.thinTitle16,
                    maxLines: 5,
                    textAlign: TextAlign.start,
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
                    initialValue: "linklinklinklinklinklinklinklinklink",
                    style: AppTextStyle.thinTitle16,
                    textAlign: TextAlign.start,
                  ),
                ),

              ],
            ),
            Divider(
              thickness: 0.5,
            ),

            FlatButton(
              height: 40,
              color: PaletteColors.blueColorApp,
              onPressed: () {},
              child: Text(
                "Save Changes",
                style:
                AppTextStyle.regularTitle16.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

