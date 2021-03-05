import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Language with ChangeNotifier {

  // language dir
  String languageDirection;

  // language code
  String languageCode;

  void setLanguage(code, direction) async {
    languageCode = code;
    languageDirection = direction;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('languageCode', languageCode);
    sharedPreferences.setString('languageDirection', direction);
    notifyListeners();
  }

  Future<void> getLanguageDataInLocal() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    languageCode = sharedPreferences.getString('languageCode') ?? 'en';
    languageDirection =
        sharedPreferences.getString('languageDirection') ?? 'ltr';
    notifyListeners();
  }

  Map<String, dynamic> get words => _words[languageCode];

  // language words
  Map _words = {
    'en': {

    },
    'it': {

    },
  };
}
