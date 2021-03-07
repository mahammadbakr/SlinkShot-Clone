import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slinkshot_clone/Components/GradientBorder.dart';
import 'package:slinkshot_clone/Constants/AppIcons.dart';
import 'package:slinkshot_clone/Constants/AppTextStyle.dart';
import 'package:slinkshot_clone/Constants/ColorConstants.dart';

import 'package:slinkshot_clone/Providers/OtherProvider.dart';

class SkinTab extends StatelessWidget {
  // final words = Provider.of<Language>(context).words;

  @override
  Widget build(BuildContext context) {
    // final words = Provider.of<OtherProvider>(context,listen:false ).getAllSkins();

    return Consumer<OtherProvider>(builder: (_, providerState, __) {
      return providerState.skinsList.isEmpty
          ? Center(child: Image.asset(AppIcons.loading,scale: 2, ))
          : GridView.builder(
              padding: EdgeInsets.all(12),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 2.4 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: providerState.skinsList.length,
              itemBuilder: (BuildContext ctx, index) {
                return GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(ctx, '/skinDetails', arguments: providerState.skinsList[index]);
                  },
                  child: Column(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            Center(
                              child: Image.asset(
                                AppIcons.logoBackground,
                                width: 130,
                                height: 130,
                                color: PaletteColors.blueColorApp,
                              ),
                            ),
                            Center(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: FadeInImage.assetNetwork(
                                        placeholder: AppIcons.imageLoading,
                                        width: 90,
                                        height: 90,
                                        image:
                                        providerState.skinsList[index].image,
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                      ),
                      Text(providerState.skinsList[index].name,
                          style: AppTextStyle.regularTitle16)
                    ],
                  ),
                );
              });
    });
  }
}
