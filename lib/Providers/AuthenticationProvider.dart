import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slinkshot_clone/Helper/SlinkShotHttp.dart';
import 'package:slinkshot_clone/Models/Skin.dart';
import 'package:slinkshot_clone/Models/SlinkShot.dart';
import 'package:slinkshot_clone/Models/User.dart';
import 'package:slinkshot_clone/Models/UserDetails.dart';
import 'package:collection/collection.dart';

class AuthenticationProvider extends ChangeNotifier {
  User myUser;
  UserDetails myUserDetails;
  Skin mySkin;

  List<dynamic> mySlinkSHotsList = [];
  List<dynamic> mySkinList = [];

  bool isLoggedIn = false;
  final String registerUrl =
      "https://slinkshotclone.herokuapp.com/api/auth/register";
  final String loginUrl = "https://slinkshotclone.herokuapp.com/api/auth/login";
  final String checkUrl = "https://slinkshotclone.herokuapp.com/api/auth/check";
  final String getUserDetailsByIdUrl =
      "https://slinkshotclone.herokuapp.com/api/getUserDetailsById";
  final String updateUserDetailsUrl =
      "https://slinkshotclone.herokuapp.com/api/updateUserDetailsById";
  final String addSkinForUserDetailsUrl =
      "https://slinkshotclone.herokuapp.com/api/newSkinForUserDetails";
  final String addUserDetailsUrl =
      "https://slinkshotclone.herokuapp.com/api/newUserDetails";
  final String editWalletForUserDetailsUrl =
      "https://slinkshotclone.herokuapp.com/api/editWalletForUserDetailsById";


  void setLoginTrue() {
    isLoggedIn = true;
    notifyListeners();
  }

  void setLoginFalse() {
    isLoggedIn = false;
    notifyListeners();
  }

  Future<bool> register({String username, String password}) async {
    var response = await postHTTP(url: registerUrl, body: {
      "username": username,
      "password": password,
    });
    if (response == null) {}
    // print(response);
    if (response["message"] == "registered successfully") {
      await addUserDetails(username: username,user:response["id"] );

      return true;
    }
    return false;
  }

  Future<bool> addUserDetails({String username,String user}) async {
    var response = await postHTTP(url: addUserDetailsUrl, body: {
      "user":user,
      "name":username,
      "wallet":400,
      "skin":"6042989fd233470015e4e30b",
      "bio":"Your Description Here - Dummy Text ...",
      "followers":[],
      "skins":[],
      "slinkshots":[]
    });
    if (response == null) {}
    // print(response);

    if (response["message"] == "registered successfully") {
      return true;
    }
    return false;
  }


  Future<bool> login({String username, String password}) async {
    var response = await postHTTP(
        url: loginUrl, body: {"username": username, "password": password});
    if (response == null) {}
    // print(response);

    if (response["message"] == "logged in successfully") {
      if (!await checkToken(token: response["token"], username: username)) {
        return false;
      }

      if (!await getUserDetailsById()) {
        return false;
      }

      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> checkToken({String token, String username}) async {
    var response = await getHTTP(url: checkUrl, header: {
      "x-access-token": token,
    });
    if (response == null) {}
    // print(response);

    if (response["success"]) {
      // print(response["info"]["_id"]);
      myUser = new User(
          id: response["info"]["_id"], username: username, token: token);

      notifyListeners();
      return true;
    }
    print("falseee");

    return false;
  }


  Future<bool> getUserDetailsById() async {
    var response = await postHTTP(url: getUserDetailsByIdUrl, body: {
      "userId": myUser.id,
    });
    if (response == null) {
      return false;
    }
    // print(response);

    if (response["status"] == 200) {
      myUserDetails = UserDetails.fromJson(response["userDetails"]);
      mySkin=Skin.fromJson(myUserDetails.skin);
      mySlinkSHotsList =
          response["userDetails"]["slinkshots"].map((data) => SlinkShot.fromJson(data)).toList();
      mySkinList =
          response["userDetails"]["skins"].map((data) => Skin.fromJson(data)).toList();
      notifyListeners();
      return true;
    }
    return false;
  }

  bool isSkinListContains(Skin skin){
    if(mySkinList.isEmpty){
      return false;
    }

    for (Skin e in mySkinList) {
      if (e.id == skin.id) return true;
    }
    return false;

  }


  Future<bool> updateUserDetails(
      {String id,String name, Map<String,dynamic> user, int wallet, Map<String,dynamic> skin, String bio, String channel, List<dynamic> followers, List<dynamic> slinkshots}) async {
    var response = await postHTTP(url: updateUserDetailsUrl, body: {
      "_id":id,
      "name":name,
      "user":user,
      "wallet":wallet,
      "skin":skin,
      "bio":bio,
      "channel":channel,
      "followers":followers,
      "slinkshots":slinkshots
    });
    if (response == null) {
      return false;
    }
    print(response);

    return true;
  }

  Future<bool> addSkinForUserDetails(
      {String id, String skin}) async {
    var response = await postHTTP(url: addSkinForUserDetailsUrl, body: {
      "_id":id,
      "skin":skin
    });
    if (response == null) {
      return false;
    }
    print(response);

    return true;
  }


  Future<bool> editWalletForUserDetails(
      {String id, int wallet}) async {
    var response = await postHTTP(url: editWalletForUserDetailsUrl, body: {
      "_id":id,
      "wallet":wallet
    });
    if (response == null) {
      return false;
    }
    print("edittt wallet: $response");

    return true;
  }




  //save in to shared prefrences


  Future<void> addUserToSharedPreferences(
      {User user, UserDetails userDetails}) async {
    myUser = user;
    myUserDetails = userDetails;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('user', json.encode(user));
    sharedPreferences.setString('user-details', json.encode(user));
    notifyListeners();
    print("added");
  }

  Future<void> getAllFavoritesSharedPreferences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final userData = sharedPreferences.getString('user');
    if (userData == null) {
      myUser = null;
      return;
    }
    try {
      myUser = jsonDecode(userData) ?? null;
    } catch (error) {
      print(error);
    }

    final userDetailsData = sharedPreferences.getString('user-details');
    if (userDetailsData == null) {
      myUserDetails = null;
      return;
    }
    try {
      myUserDetails = jsonDecode(userDetailsData) ?? null;
    } catch (error) {
      print(error);
    }
    notifyListeners();
  }
}
