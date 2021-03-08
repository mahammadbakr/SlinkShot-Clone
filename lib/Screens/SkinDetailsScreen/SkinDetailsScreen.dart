import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slinkshot_clone/Components/CustomAlert.dart';
import 'package:slinkshot_clone/Constants/AppIcons.dart';
import 'package:slinkshot_clone/Constants/AppTextStyle.dart';
import 'package:slinkshot_clone/Constants/ColorConstants.dart';
import 'package:slinkshot_clone/Models/Skin.dart';
import 'package:slinkshot_clone/Providers/AuthenticationProvider.dart';

class SkinDetailsScreen extends StatelessWidget {
  bool isBought;

  void onSubmit(
      {BuildContext context, Skin skin, AuthenticationProvider auth}) async {
    if (isBought) {
      warningAlert(
          context: context,
          label: "Sorry",
          content: "You Already Bought this Skin !");
      return;
    }
    if (auth.myUserDetails.wallet < skin.price) {
      warningAlert(
          context: context,
          label: "Sorry",
          content: "You don't have enough Slink Coins !");
      return;
    }
    final bool status = await auth.addSkinForUserDetails(
      id: auth.myUserDetails.id,
      skin: skin.id,
    );

    if (status) {
      warningAlert(
          context: context,
          label: "Success",
          content: "Congrats You bought this Skin ");
    } else {
      warningAlert(
          context: context,
          label: "Warning",
          content: "Skin can't add right now !");
    }
  }

  @override
  Widget build(BuildContext context) {
    AuthenticationProvider auth =
        Provider.of<AuthenticationProvider>(context, listen: false);

    final Skin skin = ModalRoute.of(context).settings.arguments;
    isBought = auth.isSkinListContains(skin);
    return Scaffold(
        body: SafeArea(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: PaletteColors.blackAppColor,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: FadeInImage.assetNetwork(
                placeholder: AppIcons.imageLoading,
                image: skin.image,
                // height: 150,
                // width: 150,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(15),
                //   color: PaletteColors.yellowColorApp,
                // ),
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      skin.name,
                      style: AppTextStyle.regularTitle24
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: PaletteColors.buttonColor,
                      ),
                      child: isBought
                          ? Text(
                              "Bought",
                              style: AppTextStyle.regularTitle20.copyWith(
                                  color: PaletteColors.mainBackground),
                            )
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AppIcons.slinkCoin,
                                  width: 22,
                                  height: 22,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  skin.price.toString(),
                                  style: AppTextStyle.regularTitle20.copyWith(
                                      color: PaletteColors.mainBackground),
                                ),
                              ],
                            ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: PaletteColors.yellowColorApp,
                ),
                padding: EdgeInsets.all(18),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        "   ${skin.description}",
                        textAlign: TextAlign.justify,
                        maxLines: 30,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.thinTitle18,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RaisedButton(
                        padding: EdgeInsets.zero,
                        color: PaletteColors.blackAppColor.withOpacity(0.7),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppIcons.slinkCoin,
                              width: 25,
                              height: 25,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              "Buy",
                              style: AppTextStyle.regularTitle16,
                            ),
                          ],
                        ),
                        textColor: PaletteColors.mainBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        onPressed: () async {
                          onSubmit(context: context, skin: skin, auth: auth);
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
    ));
  }
}
