import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinning_wheel/flutter_spinning_wheel.dart';
import 'package:provider/provider.dart';
import 'package:slinkshot_clone/Components/StaticFunctions.dart';
import 'package:slinkshot_clone/Constants/AppIcons.dart';
import 'package:slinkshot_clone/Constants/AppTextStyle.dart';
import 'package:slinkshot_clone/Constants/ColorConstants.dart';
import 'package:slinkshot_clone/Providers/AppSettingsProvider.dart';
import 'package:slinkshot_clone/Providers/AuthenticationProvider.dart';

class SpinWheelScreen extends StatelessWidget {
  final StreamController _dividerController = StreamController<int>();

  bool isFirst=true;
  dispose() {
    _dividerController.close();
  }

  final Map<int, String> labels = {
    1: '1000',
    2: '400',
    3: '800',
    4: '7000',
    5: '5000',
    6: '300',
    7: '2000',
    8: '100',
  };

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthenticationProvider>(context, listen: false);

    return Scaffold(
      appBar:
      AppBar(backgroundColor: PaletteColors.mainAppColor, elevation: 0.0),
      backgroundColor: PaletteColors.mainAppColor,
      body: Consumer<AppSettingsProvider>(
        builder: (_, providerState, __) {
          providerState.checkAvailablity();
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                !providerState.isWheelAvailable
                    ? SpinningWheel(
                  Image.asset('assets/spin/roulette-8-300.png'),
                  width: 310,
                  height: 310,
                  initialSpinAngle: _generateRandomAngle(),
                  spinResistance: 0.6,
                  canInteractWhileSpinning: true,
                  dividers: 8,
                  onUpdate: _dividerController.add,
                  onEnd: (gift) {
                    Timer(Duration(seconds: 2), () {
                      if(isFirst) {
                        providerState.addSpinGift(id: auth.myUserDetails.id,
                            price: auth.myUserDetails.wallet +
                                int.parse(labels[gift]));
                        warningAlert(context: context,
                            label: "Congrats",
                            content: "Congrats you got ${int.parse(
                                labels[gift])} Slink Coins !");
                        providerState.setSpinFalse();
                        Navigator.pop(context);

                      }
                      isFirst=false;
                    }
                    );

                  },
                  secondaryImage:
                  Image.asset('assets/spin/roulette-center-300.png'),
                  secondaryImageHeight: 110,
                  secondaryImageWidth: 110,
                )
                    : Center(
                  child: Text(
                    " You Already Finished your Spin ! \n Come Back Later ...",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.boldTitle18
                        .copyWith(color: PaletteColors.blackAppColor),
                  ),
                ),
                SizedBox(height: 30),
                StreamBuilder(
                  stream: _dividerController.stream,
                  builder: (context, snapshot) {
                    return
                    RouletteScore
                    (
                    snapshot
                    .
                    data
                    );
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }

  double _generateRandomAngle() => Random().nextDouble() * pi * 2;
}

class RouletteScore extends StatelessWidget {
  final int selected;

  final Map<int, String> labels = {
    1: '1000',
    2: '400',
    3: '800',
    4: '7000',
    5: '5000',
    6: '300',
    7: '2000',
    8: '100',
  };

  RouletteScore(this.selected);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          AppIcons.slinkCoin,
          width: 22,
          height: 22,
        ),
        Text('${labels[selected]}',
            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 24.0)),
      ],
    );
  }
}
