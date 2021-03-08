import 'package:flutter/material.dart';
import 'package:slinkshot_clone/Helper/SlinkShotHttp.dart';
import 'package:slinkshot_clone/Models/Skin.dart';
import 'package:slinkshot_clone/Models/SlinkShot.dart';

class OtherProvider extends ChangeNotifier {
  final String getAllSkinsUrl =
      "https://slinkshotclone.herokuapp.com/api/getAllSkins";
  final String getAllSlinkshotsUrl =
      "https://slinkshotclone.herokuapp.com/api/getAllSlinkShots";
  final String addSlinkshotUrl =
      "https://slinkshotclone.herokuapp.com/api/newSlinkShot";
  final String updateSlinkshotUrl =
      "https://slinkshotclone.herokuapp.com/api/updateSlinkShotById";

  List<dynamic> skinsList = [];
  List<dynamic> slinkshotsList = [];

  Future<void> getAllSkins() async {
    var response = await postHTTP(url: getAllSkinsUrl, body: {});
    if (response == null) {}
    // print(response);
    skinsList = response["skins"].map((data) => Skin.fromJson(data)).toList();
    notifyListeners();
  }

  Future<void> getAllSlinkshots() async {
    var response = await postHTTP(url: getAllSlinkshotsUrl, body: {});
    if (response == null) {}
    // print(response);
    slinkshotsList =
        response["slinkShots"].map((data) => SlinkShot.fromJson(data)).toList();
    notifyListeners();
  }

  Skin getSkinsById(String id) {
    Skin skin = skinsList.firstWhere((element) => element.id == id);
    return skin;
  }

  Future<bool> addSlinkshot(
      {String name,
      String user,
      String userDetails,
      String description,
      String videoUrl}) async {
    var response = await postHTTP(url: addSlinkshotUrl, body: {
      "name": name,
      "user": user,
      "userDetails": userDetails,
      "description": description,
      "videoUrl": videoUrl
    });
    if (response == null) {
      return false;
    }
    print(response);

    return true;
  }

  Future<bool> updateSlinkshot(
      {String id,
      String name,
        Map<String,dynamic> user,
        Map<String,dynamic> userDetails,
      String description,
      String videoUrl,
      int like,
      int viewNumber}) async {
    var response = await postHTTP(url: updateSlinkshotUrl, body: {
      "_id": id,
      "name": name,
      "user": user,
      "userDetails": userDetails,
      "description": description,
      "videoUrl": videoUrl,
      "like": 12,
      "viewNumber": 122
    });
    if (response == null) {
      return false;
    }
    print(response);

    return true;
  }
}
