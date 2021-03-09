import 'package:flutter/cupertino.dart';
import 'package:slinkshot_clone/Constants/AppIcons.dart';
import 'package:slinkshot_clone/Constants/ColorConstants.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 4,vertical: 2),
          decoration: BoxDecoration(
              color: PaletteColors.mainAppColor,
              borderRadius: BorderRadius.circular(12)),
          child: Image.asset(
            AppIcons.loading,
            scale: 2,
            color: PaletteColors.blueColorApp,
          ),
        ));
  }
}
