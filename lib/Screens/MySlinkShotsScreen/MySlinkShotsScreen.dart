import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slinkshot_clone/Components/SlidingCard.dart';
import 'package:slinkshot_clone/Constants/AppIcons.dart';
import 'package:slinkshot_clone/Constants/ColorConstants.dart';
import 'package:slinkshot_clone/Providers/AuthenticationProvider.dart';
import 'package:slinkshot_clone/Providers/OtherProvider.dart';

class MySlinkShotsScreen extends StatefulWidget {
  @override
  _MySlinkShotsScreenState createState() => _MySlinkShotsScreenState();
}

class _MySlinkShotsScreenState extends State<MySlinkShotsScreen> {

  PageController controller = PageController();
  var currentPageValue = 0.0;
  double pageOffset = 0;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Consumer<AuthenticationProvider>(builder: (_, providerState, __) {
          // print("length${providerState.slinkshotsList.length}");
          return providerState.mySlinkSHotsList.isEmpty
              ? Center(
              child: Image.asset(
                AppIcons.loading,
                scale: 2,
              ))
              : Stack(
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios,color: PaletteColors.blackAppColor,),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                  Expanded(
                    child: PageView.builder(
                      controller: controller,
                      itemBuilder: (BuildContext ctx, index) {
                        return SlidingCard(
                          slinkShot: providerState.mySlinkSHotsList[index],
                          offset: pageOffset,
                        );
                      },
                      itemCount: providerState.mySlinkSHotsList.length,
                      scrollDirection: Axis.vertical,
                    ),
                  ),
                ],
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
        }),
      ),
    );
  }
}


