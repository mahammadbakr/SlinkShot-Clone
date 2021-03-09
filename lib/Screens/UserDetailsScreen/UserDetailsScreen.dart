import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slinkshot_clone/Components/MainButton.dart';
import 'package:slinkshot_clone/Components/StaticFunctions.dart';
import 'package:slinkshot_clone/Constants/AppIcons.dart';
import 'package:slinkshot_clone/Constants/AppTextStyle.dart';
import 'package:slinkshot_clone/Constants/ColorConstants.dart';
import 'package:slinkshot_clone/Models/UserDetails.dart';
import 'package:slinkshot_clone/Providers/OtherProvider.dart';

class UserDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String,dynamic> userDetails = ModalRoute.of(context).settings.arguments;
    OtherProvider provider = Provider.of<OtherProvider>(context, listen: false);
    String image = provider.getSkinsById(userDetails["skin"].toString()).image;
    return Scaffold(
      appBar:
          AppBar(backgroundColor: PaletteColors.secondBackground, elevation: 0.0),
      backgroundColor: PaletteColors.secondBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            FadeInImage.assetNetwork(
              placeholder: AppIcons.imageLoading,
              image: image,
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
                      userDetails["name"],
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.boldTitle34.copyWith(
                          letterSpacing: 1.3,
                          color: PaletteColors.blueColorApp),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                        onTap: ()=>lunchURL(userDetails["channel"].toString()),
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
                      "Slink Coins:",
                      style: AppTextStyle.boldTitle18,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 3),
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
                            Text(userDetails["wallet"].toString(),
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
                userDetails["bio"],
                textAlign: TextAlign.justify,
                style: AppTextStyle.regularTitle16,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(14.0),
              child: MainButton(
                label: "Follow",
                color: PaletteColors.blueColorApp,
                icon: "null",
                onPressed: () {warningAlert(context: context,label: "We are Sorry",content: "Sorry it is not Active right now ...");},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
