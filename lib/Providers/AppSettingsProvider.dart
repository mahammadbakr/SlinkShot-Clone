import 'package:flutter/material.dart';

class AppSettingsProvider extends ChangeNotifier {
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


}
