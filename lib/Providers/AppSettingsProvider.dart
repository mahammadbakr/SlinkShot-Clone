import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slinkshot_clone/Helper/SlinkShotHttp.dart';

class AppSettingsProvider extends ChangeNotifier {

  final String editWalletForUserDetailsUrl =
      "https://slinkshotclone.herokuapp.com/api/editWalletForUserDetailsById";

  bool isFirstTime=true;

  void setSecondTime() {
    isFirstTime = false;
    notifyListeners();
  }
  int tabHome;
  int tabLogin;

   void setHomeTab(int tab) {
    tabHome = tab;
    notifyListeners();
  }

  int getHomeTab() {
    if (tabHome == null) {
      tabHome = 2;
    }
    return tabHome;
  }


  bool isWheelAvailable=false;
  void setSpinFalse() {
    isWheelAvailable=false;
    notifyListeners();
  }

  void setSpinTrue() {
    isWheelAvailable=true;
    notifyListeners();
  }

  void addSpinGift({String id, int price}) {
    var response =  postHTTP(url: editWalletForUserDetailsUrl, body: {
      "_id":id,
      "wallet":price
    });
    if (response == null) {
    }
    // print(response);

  }


  void checkAvailablity() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('spin', DateTime.now().day.toString());

  }



}
