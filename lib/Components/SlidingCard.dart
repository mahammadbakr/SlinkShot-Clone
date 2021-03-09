import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:slinkshot_clone/Models/SlinkShot.dart';
import 'package:slinkshot_clone/Models/UserDetails.dart';
import 'package:slinkshot_clone/Providers/AuthenticationProvider.dart';
import 'package:slinkshot_clone/Providers/OtherProvider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:slinkshot_clone/Components/MainButton.dart';
import 'package:slinkshot_clone/Constants/AppIcons.dart';
import 'package:slinkshot_clone/Constants/AppTextStyle.dart';
import 'package:slinkshot_clone/Constants/ColorConstants.dart';

class SlidingCard extends StatefulWidget {
  final SlinkShot slinkShot;
  final double offset;

  SlidingCard({
    Key key,
    @required this.slinkShot,
    @required this.offset,
  }) : super(key: key);

  @override
  _SlidingCardState createState() => _SlidingCardState();
}

class _SlidingCardState extends State<SlidingCard> {
  bool _isPlayerReady = false;

  YoutubePlayerController _controller;
  YoutubeMetaData _videoMetaData;
  PlayerState _playerState;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.slinkShot.videoUrl.split("v=")[1],
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
      ),
    )..addListener(listener);

    _playerState = PlayerState.unknown;
    _videoMetaData = const YoutubeMetaData();
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double gauss = math.exp(-(math.pow((widget.offset.abs() - 0.5), 2) / 0.08));
    OtherProvider provider = Provider.of<OtherProvider>(context, listen: false);
    provider.addViewForSlinkshot(
        id: widget.slinkShot.id, viewNumber: widget.slinkShot.viewNumber + 1);
    String image = provider
        .getSkinsById(widget.slinkShot.userDetails["skin"].toString())
        .image;

    return Transform.translate(
      offset: Offset(-32 * gauss * widget.offset.sign, 0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Card(
          margin: EdgeInsets.only(left: 8, right: 8, bottom: 24),
          elevation: 8,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                child: Container(
                    child: YoutubePlayerBuilder(
                        player: YoutubePlayer(
                          topActions: [
                            FullScreenButton(
                              controller: _controller,
                              color: Colors.black,
                            ),
                          ],
                          progressColors: ProgressBarColors(
                              playedColor: PaletteColors.mainAppColor,
                              bufferedColor: PaletteColors.yellowColorApp),
                          controller: _controller,
                          showVideoProgressIndicator: true,
                          bottomActions: [
                            CurrentPosition(),
                            ProgressBar(isExpanded: true),
                          ],
                        ),
                        builder: (context, player) {
                          return player;
                        })),
              ),
              SizedBox(
                height: 6,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, "/userDetails",
                        arguments:widget.slinkShot.userDetails),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      child: Row(
                        children: [
                          FadeInImage.assetNetwork(
                            placeholder: AppIcons.imageLoading,
                            width: 20,
                            height: 20,
                            image: image,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            widget.slinkShot.user["username"],
                            style: AppTextStyle.regularTitle14
                                .copyWith(color: PaletteColors.blueColorApp),
                          ),
                        ],
                      ),
                    ),
                  )),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Transform.translate(
                        offset: Offset(8 * widget.offset, 0),
                        child: Row(
                          children: [
                            Text(widget.slinkShot.name,
                                style: TextStyle(fontSize: 20)),
                            SizedBox(
                              width: 8,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: PaletteColors.blackAppColor
                                      .withOpacity(0.7)),
                              child: Row(
                                children: [
                                  Transform.translate(
                                    offset: Offset(32 * widget.offset, 0),
                                    child: Text(
                                        widget.slinkShot.viewNumber.toString(),
                                        style: AppTextStyle.regularTitle16
                                            .copyWith(
                                                color: PaletteColors
                                                    .mainBackground)),
                                  ),
                                  Image.asset(
                                    AppIcons.eye,
                                    width: 30,
                                    height: 12,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      SingleChildScrollView(
                        child: Transform.translate(
                          offset: Offset(32 * widget.offset, 0),
                          child: Text(
                            widget.slinkShot.description,
                            textAlign: TextAlign.justify,
                            maxLines: 15,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.thinTitle18,
                          ),
                        ),
                      ),
                      Spacer(),
                      Row(
                        children: <Widget>[
                          MainButton(
                            label: "Share",
                            color: PaletteColors.blackAppColor.withOpacity(0.7),
                            icon: AppIcons.share,
                            onPressed: (){},
                          ),
                          Spacer(),
                          Text(widget.slinkShot.like.toString(),
                              style: AppTextStyle.regularTitle16.copyWith(
                                  color: PaletteColors.blackAppColor)),
                          SizedBox(
                            width: 4,
                          ),
                          Image.asset(
                            AppIcons.love,
                            width: 30,
                            height: 30,
                          ),
                          SizedBox(width: 16),
                          Image.asset(
                            AppIcons.comment,
                            width: 30,
                            height: 30,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
