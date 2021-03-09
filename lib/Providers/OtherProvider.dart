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
  final String addViewForSlinkshotUrl =
      "https://slinkshotclone.herokuapp.com/api/addViewForSlinkShotById";
  final String addLikeForSlinkshotUrl =
      "https://slinkshotclone.herokuapp.com/api/addLikeForSlinkShotById";

  List<dynamic> skinsList = [];
  List<dynamic> slinkshotsList = [];
  List<dynamic> searchedSkinsList = [];
  List<dynamic> searchedSlinkshotsList = [];

  Future<void> getAllSkins() async {
    var response = await postHTTP(url: getAllSkinsUrl, body: {});
    if (response == null) {}
    // print(response);
    skinsList = response["skins"].map((data) => Skin.fromJson(data)).toList();
    searchedSkinsList = skinsList;
    notifyListeners();
  }

  Future<void> getAllSlinkshots() async {
    var response = await postHTTP(url: getAllSlinkshotsUrl, body: {});
    if (response == null) {}
    // print(response);
    slinkshotsList =
        response["slinkShots"].map((data) => SlinkShot.fromJson(data)).toList();
    searchedSlinkshotsList = slinkshotsList;
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
      Map<String, dynamic> user,
      Map<String, dynamic> userDetails,
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

  void addViewForSlinkshot({String id, int viewNumber}) async {
    var response = await postHTTP(
        url: addViewForSlinkshotUrl,
        body: {"_id": id, "viewNumber": viewNumber});
    if (response == null) {
      print("response is nulll");
    }
    // print(response);
  }

  void addLikeForSlinkshot({String id, int like}) async {
    var response = await postHTTP(
        url: addLikeForSlinkshotUrl, body: {"_id": id, "like": like});
    if (response == null) {
      print("response is nulll");
    }
    // print(response);
  }

  void searchForSlinkShots({String text}) {
    if (text == "" || text == null) {
      searchedSlinkshotsList = slinkshotsList;
    } else {
      var list = searchedSlinkshotsList.where((b) {
        return b.name.contains(text);
      }).toList();

      if(list.isEmpty){
        searchedSlinkshotsList = slinkshotsList;
        notifyListeners();
      }else{
        searchedSlinkshotsList=list;
      }

    }

    notifyListeners();
  }

  void searchForSkins({String text}) {
    if (text == "" || text == null) {
      searchedSkinsList = skinsList;
    } else {

     var  list = searchedSkinsList.where((b) {
        return b.name.contains(text);
      }).toList();
     if(list.isEmpty){
       searchedSkinsList = skinsList;
       notifyListeners();
     }else{
       searchedSkinsList=list;
     }

    }

    notifyListeners();
  }
}
