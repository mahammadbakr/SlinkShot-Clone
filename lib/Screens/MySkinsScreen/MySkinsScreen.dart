import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slinkshot_clone/Components/SkinWidget.dart';
import 'package:slinkshot_clone/Constants/AppIcons.dart';
import 'package:slinkshot_clone/Constants/ColorConstants.dart';
import 'package:slinkshot_clone/Providers/AuthenticationProvider.dart';

class MySkinsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
                )),
            Expanded(
              flex: 20,
              child: Consumer<AuthenticationProvider>(builder: (_, providerState, __) {
                return providerState.mySkinList.isEmpty
                    ? Center(child: Image.asset(AppIcons.loading,scale: 2, ))
                    : GridView.builder(
                    padding: EdgeInsets.all(12),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 2.4 / 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20),
                    itemCount: providerState.mySkinList.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return SkinWidget(mContext:ctx,skin:providerState.mySkinList[index],bgColor:PaletteColors.blueColorApp );
                    });
              }),
            ),
          ],
        ),
      ),
    );
  }
}
