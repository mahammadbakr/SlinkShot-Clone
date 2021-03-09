import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slinkshot_clone/Components/SkinWidget.dart';
import 'package:slinkshot_clone/Constants/AppIcons.dart';
import 'package:slinkshot_clone/Constants/AppTextStyle.dart';
import 'package:slinkshot_clone/Constants/ColorConstants.dart';
import 'package:slinkshot_clone/Providers/OtherProvider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SearchTab extends StatefulWidget {
  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  bool isSlink = true;

  Widget getYoutubeVideo(vidId) => YoutubePlayerBuilder(
      player: YoutubePlayer(
        progressColors: ProgressBarColors(
            playedColor: PaletteColors.mainAppColor,
            bufferedColor: PaletteColors.yellowColorApp),
        controller: YoutubePlayerController(
          initialVideoId: vidId,
          flags: YoutubePlayerFlags(
            mute: false,
            autoPlay: false,
          ),
        ),
        showVideoProgressIndicator: true,
        bottomActions: [
          CurrentPosition(),
          ProgressBar(isExpanded: true),
        ],
      ),
      builder: (context, player) {
        return player;
      });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Consumer<OtherProvider>(
          builder: (_, providerState, __) => CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Write here',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          suffixIcon: ImageIcon(
                            AssetImage(AppIcons.search),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Searching for "),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSlink = true;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 5),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 5),
                                decoration: new BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: isSlink
                                      ? PaletteColors.secondBackground
                                      : PaletteColors.mainBackground,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 10,
                                        color: Colors.black26,
                                        offset: Offset(0, 1.2))
                                  ],
                                ),
                                child: Text(
                                  "SlinkShots",
                                  style: AppTextStyle.regularTitle14.copyWith(
                                      color: PaletteColors.blackAppColor),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSlink = false;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 5),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 5),
                                decoration: new BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: !isSlink
                                      ? PaletteColors.secondBackground
                                      : PaletteColors.mainBackground,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 10,
                                        color: Colors.black26,
                                        offset: Offset(0, 1.2))
                                  ],
                                ),
                                child: Text(
                                  "Skins",
                                  style: AppTextStyle.regularTitle14.copyWith(
                                      color: PaletteColors.blackAppColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              isSlink
                  ? SliverPadding(
                      padding: EdgeInsets.all(12),
                      sliver: providerState.skinsList.isEmpty
                          ? Center(
                              child: Image.asset(
                              AppIcons.loading,
                              scale: 2,
                            ))
                          : SliverList(
                              delegate: SliverChildListDelegate([
                              Column(
                                children: [
                                  Container(
                                    child: ListView.builder(
                                        itemCount:
                                            providerState.slinkshotsList.length,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Container(
                                            margin: EdgeInsets.all(8),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 80,
                                            decoration: new BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              color: PaletteColors
                                                  .secondBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                    blurRadius: 10,
                                                    color: Colors.black26,
                                                    offset: Offset(0, 1.2))
                                              ],
                                            ),
                                            child: Row(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  child: Container(
                                                      height: 80,
                                                      width: 140,
                                                      child: getYoutubeVideo(
                                                          "etqi9VQVr8A")),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        providerState
                                                            .slinkshotsList[
                                                                index]
                                                            .name,
                                                        style: AppTextStyle
                                                            .boldTitle18,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 4),
                                                        child: Text(
                                                          smallSentence(
                                                              providerState
                                                                  .slinkshotsList[
                                                                      index]
                                                                  .description),
                                                          maxLines: 1,
                                                          softWrap: false,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: AppTextStyle
                                                              .regularTitle12,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(3.0),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                                providerState
                                                                    .slinkshotsList[
                                                                        index]
                                                                    .like
                                                                    .toString(),
                                                                style: AppTextStyle
                                                                    .regularTitle12
                                                                    .copyWith(
                                                                        color: PaletteColors
                                                                            .blackAppColor)),
                                                            SizedBox(
                                                              width: 4,
                                                            ),
                                                            Image.asset(
                                                              AppIcons.love,
                                                              width: 22,
                                                              height: 22,
                                                            ),
                                                            SizedBox(
                                                              width: 15,
                                                            ),
                                                            Text("0",
                                                                style: AppTextStyle
                                                                    .regularTitle12
                                                                    .copyWith(
                                                                        color: PaletteColors
                                                                            .blackAppColor)),
                                                            SizedBox(
                                                              width: 4,
                                                            ),
                                                            Image.asset(
                                                              AppIcons.comment,
                                                              width: 22,
                                                              height: 22,
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                  ),
                                ],
                              )
                            ])),
                    )
                  : SliverPadding(
                      padding: EdgeInsets.all(8),
                      sliver: SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2.2 / 2,
                          mainAxisSpacing: 1,
                          crossAxisSpacing: 1,
                        ),
                        delegate: SliverChildBuilderDelegate(
                            (context, index) => SkinWidget(
                                  mContext: context,
                                  skin: providerState.skinsList[index],
                                  bgColor: PaletteColors.secondBackground,
                                  onPressed: () => Navigator.pushNamed(
                                      context, '/skinDetails',
                                      arguments:
                                          providerState.skinsList[index]),
                                ),
                            childCount: providerState.skinsList.length),
                      ),
                    )
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          right: 15,
          child: Row(
            children: [
              FloatingActionButton(
                  mini: true,
                  backgroundColor: PaletteColors.mainAppColor,
                  child: ImageIcon(
                    AssetImage(
                      AppIcons.filter,
                    ),
                    color: PaletteColors.mainBackground,
                  ),
                  onPressed: () async {}),
            ],
          ),
        ),
      ],
    );
  }

  String smallSentence(String bigSentence) {
    if (bigSentence.length < 30) {
      if (bigSentence.length < 20) {
        if (bigSentence.length < 10) {
          return "...";
        }
        return bigSentence.substring(0, 10) + '...';
      }
      return bigSentence.substring(0, 19) + '...';
    } else {
      return bigSentence.substring(0, 30) + '..';
    }
  }
}
