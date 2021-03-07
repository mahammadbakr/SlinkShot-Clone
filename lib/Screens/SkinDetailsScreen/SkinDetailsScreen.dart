import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slinkshot_clone/Components/MainButton.dart';
import 'package:slinkshot_clone/Constants/AppIcons.dart';
import 'package:slinkshot_clone/Constants/AppTextStyle.dart';
import 'package:slinkshot_clone/Constants/ColorConstants.dart';
import 'package:slinkshot_clone/Models/Skin.dart';

class SkinDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Skin skin = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: PaletteColors.secondBackground,
        //   centerTitle: true,
        //   title: Image.asset(
        //     AppIcons.title,
        //     height: 44,
        //   ),
        // ),
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
                      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: PaletteColors.buttonColor,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(AppIcons.slinkCoin,width: 22,height: 22,),
                          SizedBox(width: 4,),
                          Text(
                            skin.price.toString(),
                            style: AppTextStyle.regularTitle20
                                .copyWith(color: PaletteColors.mainBackground),
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
                        onPressed: () {},
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
