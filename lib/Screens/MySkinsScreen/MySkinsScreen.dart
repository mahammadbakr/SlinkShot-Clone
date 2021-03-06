import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slinkshot_clone/Components/LoadingWidget.dart';
import 'package:slinkshot_clone/Components/SkinWidget.dart';
import 'package:slinkshot_clone/Components/StaticFunctions.dart';
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
              child: Consumer<AuthenticationProvider>(
                  builder: (_, providerState, __) {
                String id = providerState.myUserDetails.skin["_id"];
                return providerState.mySkinList.isEmpty
                    ? LoadingWidget()
                    : GridView.builder(
                        padding: EdgeInsets.all(12),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 2.4 / 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                        itemCount: providerState.mySkinList.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: id ==
                                      providerState.mySkinList[index].id
                                          .toString()
                                  ? PaletteColors.blueColorApp.withOpacity(0.2)
                                  : PaletteColors.mainBackground,
                            ),
                            child: SkinWidget(
                                mContext: ctx,
                                skin: providerState.mySkinList[index],
                                bgColor: PaletteColors.blueColorApp,
                                onPressed: () {
                                  askingAlert(
                                      context: context,
                                      label: "Your Profile",
                                      content:
                                          "Do you want make it your profile show?",
                                      labelBtn: "Yes",
                                      onClickBtn: () {});
                                }),
                          );
                        });
              }),
            ),
          ],
        ),
      ),
    );
  }
}
