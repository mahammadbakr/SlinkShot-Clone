import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slinkshot_clone/Components/GradientBorder.dart';
import 'package:slinkshot_clone/Constants/AppIcons.dart';
import 'package:slinkshot_clone/Constants/AppTextStyle.dart';
import 'package:slinkshot_clone/Constants/ColorConstants.dart';
import 'package:slinkshot_clone/Providers/OtherProvider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeTab extends StatelessWidget {
  PageController controller = PageController();
  var currentPageValue = 0.0;

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'aCmmng4KwlA',
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    // final slinkshots =
    //     Provider.of<OtherProvider>(context, listen: false).getAllSlinkshots();

    return Consumer<OtherProvider>(builder: (_, providerState, __) {
      print("length${providerState.slinkshotsList.length}");
      return providerState.slinkshotsList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Stack(
            children: [
              PageView.builder(
                  controller: controller,
                  itemBuilder: (BuildContext ctx, index) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GradientBorder(
                        strokeWidth: 2,
                        radius: 15,
                        gradient: LinearGradient(colors: [
                          PaletteColors.blackAppColor,
                          PaletteColors.mainAppColor
                        ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    AppIcons.personGirl,
                                    width: 50,
                                    height: 50,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    providerState.slinkshotsList[index].name.toString().toUpperCase(),
                                    style: AppTextStyle.regularTitle22,
                                  ),
                                ],
                              ),
                            ),

                            Container(
                                margin: EdgeInsets.all(5),
                                child: YoutubePlayerBuilder(

                                    player: YoutubePlayer(
                                      controller: _controller,
                                      showVideoProgressIndicator: true,
                                      bottomActions: [
                                        CurrentPosition(),
                                        ProgressBar(isExpanded: true),
                                      ],
                                    ),
                                    builder: (context, player) {
                                      return Column(
                                        children: [
                                          // some widgets
                                          player,
                                          //some other widgets
                                        ],
                                      );
                                    })),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    providerState.slinkshotsList[index].name,
                                    style: AppTextStyle.regularTitle22,
                                  ),

                                  Spacer(),
                                  Icon(Icons.sentiment_neutral),

                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                providerState.slinkshotsList[index].description,
                                style: AppTextStyle.regularTitle16,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Image.asset(
                                    AppIcons.unlove,
                                    width: 40,
                                    height: 40,
                                  ),
                                  SizedBox(width: 10,),
                                  Image.asset(
                                    AppIcons.share,
                                    width: 40,
                                    height: 40,
                                    color: PaletteColors.blackAppColor,
                                  ),
                                  Spacer(),
                                  Image.asset(
                                    AppIcons.comment,
                                    width: 40,
                                    height: 40,
                                  ),
                                ],
                              ),
                            )


                          ],
                        ),
                      ),
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
                        onPressed: () async {

                        }),
                  ],
                ),
              ),
            ],
          );
    });
  }
}
