import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slinkshot_clone/Components/GradientBorder.dart';
import 'package:slinkshot_clone/Components/SkinWidget.dart';
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
                return SkinWidget(mContext:ctx,skin:providerState.skinsList[index],bgColor:PaletteColors.blueColorApp );
              });
    });
  }
}
