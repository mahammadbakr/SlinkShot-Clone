import 'package:flutter/material.dart';

class AppTextStyle with ChangeNotifier {
  static String _languageCode = 'kr';

  void setLanguageCode (String value) {
    _languageCode = value;
    notifyListeners();
  }

  static TextStyle regularTitle10 =
      TextStyle(fontSize:  10 );
  static TextStyle regularTitle12 =
      TextStyle(fontSize:  12 );
  static TextStyle regularTitle14 =
      TextStyle(fontSize:  14 );
  static TextStyle regularTitle16 =
      TextStyle(fontSize:  16 );
  static TextStyle regularTitle18 =
      TextStyle(fontSize:  18 );
  static TextStyle regularTitle20 =
      TextStyle(fontSize:  20 );
  static TextStyle regularTitle22 =
      TextStyle(fontSize:  22 );
  static TextStyle regularTitle24 =
      TextStyle(fontSize:  24 );
  static TextStyle regularTitle34 =
      TextStyle(fontSize:  34 );

  static TextStyle thinTitle10 = TextStyle(
      fontSize: 10 , fontWeight: FontWeight.w100);
  static TextStyle thinTitle12 = TextStyle(
      fontSize:12 , fontWeight: FontWeight.w100);
  static TextStyle thinTitle14 = TextStyle(
      fontSize:14 , fontWeight: FontWeight.w100);
  static TextStyle thinTitle16 = TextStyle(
      fontSize: 16 , fontWeight: FontWeight.w100);
  static TextStyle thinTitle18 = TextStyle(
      fontSize: 18 , fontWeight: FontWeight.w100);
  static TextStyle thinTitle20 = TextStyle(
      fontSize: 20 , fontWeight: FontWeight.w100);
  static TextStyle thinTitle22 = TextStyle(
      fontSize:22 , fontWeight: FontWeight.w100);
  static TextStyle thinTitle24 = TextStyle(
      fontSize:24 , fontWeight: FontWeight.w100);
  static TextStyle thinTitle34 = TextStyle(
      fontSize: 34 , fontWeight: FontWeight.w100);

  static TextStyle lightTitle10 = TextStyle(
      fontSize: 10 , fontWeight: FontWeight.w200);
  static TextStyle lightTitle12 = TextStyle(
      fontSize: 12 , fontWeight: FontWeight.w200);
  static TextStyle lightTitle14 = TextStyle(
      fontSize:14 , fontWeight: FontWeight.w200);
  static TextStyle lightTitle16 = TextStyle(
      fontSize:16 , fontWeight: FontWeight.w200);
  static TextStyle lightTitle18 = TextStyle(
      fontSize:18 , fontWeight: FontWeight.w200);
  static TextStyle lightTitle20 = TextStyle(
      fontSize:20 , fontWeight: FontWeight.w200);
  static TextStyle lightTitle22 = TextStyle(
      fontSize: 22 , fontWeight: FontWeight.w200);
  static TextStyle lightTitle24 = TextStyle(
      fontSize:24 , fontWeight: FontWeight.w200);
  static TextStyle lightTitle34 = TextStyle(
      fontSize:34 , fontWeight: FontWeight.w200);

  static TextStyle mediumTitle10 = TextStyle(
      fontSize:10 , fontWeight: FontWeight.w300);
  static TextStyle mediumTitle12 = TextStyle(
      fontSize: 12 , fontWeight: FontWeight.w300);
  static TextStyle mediumTitle14 = TextStyle(
      fontSize:14 , fontWeight: FontWeight.w300);
  static TextStyle mediumTitle16 = TextStyle(
      fontSize:16 , fontWeight: FontWeight.w300);
  static TextStyle mediumTitle18 = TextStyle(
      fontSize:18 , fontWeight: FontWeight.w300);
  static TextStyle mediumTitle20 = TextStyle(
      fontSize:20 , fontWeight: FontWeight.w300);
  static TextStyle mediumTitle22 = TextStyle(
      fontSize:22 , fontWeight: FontWeight.w300);
  static TextStyle mediumTitle24 = TextStyle(
      fontSize:24 , fontWeight: FontWeight.w300);
  static TextStyle mediumTitle34 = TextStyle(
      fontSize:34 , fontWeight: FontWeight.w300);

  static TextStyle semiBoldTitle10 = TextStyle(
      fontSize:10 , fontWeight: FontWeight.w400);
  static TextStyle semiBoldTitle12 = TextStyle(
      fontSize:12 , fontWeight: FontWeight.w400);
  static TextStyle semiBoldTitle14 = TextStyle(
      fontSize:14 , fontWeight: FontWeight.w400);
  static TextStyle semiBoldTitle16 = TextStyle(
      fontSize: 16 , fontWeight: FontWeight.w400);
  static TextStyle semiBoldTitle20 = TextStyle(
      fontSize:18 , fontWeight: FontWeight.w400);
  static TextStyle semiBoldTitle18 = TextStyle(
      fontSize:20 , fontWeight: FontWeight.w400);
  static TextStyle semiBoldTitle22 = TextStyle(
      fontSize:22 , fontWeight: FontWeight.w400);
  static TextStyle semiBoldTitle24 = TextStyle(
      fontSize:24 , fontWeight: FontWeight.w400);
  static TextStyle semiBoldTitle34 = TextStyle(
      fontSize: 34 , fontWeight: FontWeight.w400);

  static TextStyle boldTitle10 = TextStyle(
      fontSize: 10 , fontWeight: FontWeight.bold);
  static TextStyle boldTitle12 = TextStyle(
      fontSize: 12, fontWeight: FontWeight.bold);
  static TextStyle boldTitle14 = TextStyle(
      fontSize: 14 , fontWeight: FontWeight.bold);
  static TextStyle boldTitle16 = TextStyle(
      fontSize: 16, fontWeight: FontWeight.bold);
  static TextStyle boldTitle20 = TextStyle(
      fontSize:18 , fontWeight: FontWeight.bold);
  static TextStyle boldTitle18 = TextStyle(
      fontSize:20 , fontWeight: FontWeight.bold);
  static TextStyle boldTitle22 = TextStyle(
      fontSize: 22 , fontWeight: FontWeight.bold);
  static TextStyle boldTitle24 = TextStyle(
      fontSize: 24 , fontWeight: FontWeight.bold);
  static TextStyle boldTitle34 = TextStyle(
      fontSize: 34 , fontWeight: FontWeight.bold);
}
