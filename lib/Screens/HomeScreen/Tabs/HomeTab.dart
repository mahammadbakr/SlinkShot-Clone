import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slinkshot_clone/Components/MainButton.dart';
import 'package:slinkshot_clone/Components/SlidingCard.dart';
import 'package:slinkshot_clone/Constants/AppIcons.dart';
import 'package:slinkshot_clone/Constants/AppTextStyle.dart';
import 'package:slinkshot_clone/Constants/ColorConstants.dart';
import 'package:slinkshot_clone/Models/SlinkShot.dart';
import 'package:slinkshot_clone/Providers/OtherProvider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeTab extends StatelessWidget {
  PageController controller = PageController();
  var currentPageValue = 0.0;
  double pageOffset = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<OtherProvider>(builder: (_, providerState, __) {
      print("length${providerState.slinkshotsList.length}");
      return providerState.slinkshotsList.isEmpty
          ? Center(
              child: Image.asset(
              AppIcons.loading,
              scale: 2,
            ))
          : Stack(
              children: [
                PageView.builder(
                  controller: controller,
                  itemBuilder: (BuildContext ctx, index) {
                    return SlidingCard(
                      slinkShot: providerState.slinkshotsList[index],
                      offset: pageOffset,
                    );
                  },
                  itemCount: providerState.slinkshotsList.length,
                  scrollDirection: Axis.vertical,
                ),
                Positioned(
                  bottom: 10,
                  right: 15,
                  child: Row(
                    children: [
                      FloatingActionButton(
                          mini: true,
                          backgroundColor: PaletteColors.mainAppColor,
                          child: Icon(
                            Icons.add,
                            color: PaletteColors.mainBackground,
                          ),
                          onPressed: () async {}),
                    ],
                  ),
                ),
              ],
            );
    });
  }
}
