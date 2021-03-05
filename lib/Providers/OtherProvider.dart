import 'package:flutter/material.dart';
import 'package:slinkshot_clone/Helper/SlinkShotHttp.dart';
import 'package:slinkshot_clone/Models/Skin.dart';
import 'package:slinkshot_clone/Models/SlinkShot.dart';

class OtherProvider extends ChangeNotifier {
   final String getAllSkinsUrl="https://slinkshotclone.herokuapp.com/api/getAllSkins";
   final String getAllSlinkshotsUrl="https://slinkshotclone.herokuapp.com/api/getAllSlinkShots";

   List<dynamic> skinsList = [];
   List<dynamic> slinkshotsList = [];

   Future<void> getAllSkins() async {
     var response = await postHTTP(url: getAllSkinsUrl, body: {});
     if (response == null) {}
     print(response);
     skinsList =
         response["skins"].map((data) => Skin.fromJson(data)).toList();
     notifyListeners();
   }

   Future<void> getAllSlinkshots() async {
     var response = await postHTTP(url: getAllSlinkshotsUrl, body: {});
     if (response == null) {}
     print(response);
     slinkshotsList =
         response["slinkShots"].map((data) => SlinkShot.fromJson(data)).toList();
     notifyListeners();
   }

   Skin getSkinsById(String id)  {
     Skin skin =skinsList.firstWhere((element) => element.id == id);
     return skin;
   }



}
