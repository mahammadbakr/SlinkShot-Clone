import 'package:flutter/cupertino.dart';
import 'package:slinkshot_clone/Constants/AppIcons.dart';
import 'package:slinkshot_clone/Constants/AppTextStyle.dart';
import 'package:slinkshot_clone/Constants/ColorConstants.dart';
import 'package:slinkshot_clone/Models/Skin.dart';

class SkinWidget extends StatelessWidget {

  final BuildContext mContext;
  final Skin skin;
  final Color bgColor;


  SkinWidget({this.mContext, this.skin, this.bgColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(mContext, '/skinDetails', arguments: skin);
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
                            skin.image,
                          ),
                        ),
                      ]),
                ),
              ],
            ),
          ),
          Text(skin.name,
              style: AppTextStyle.regularTitle16)
        ],
      ),
    );
  }
}
