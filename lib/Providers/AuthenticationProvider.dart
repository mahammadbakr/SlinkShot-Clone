import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slinkshot_clone/Helper/SlinkShotHttp.dart';
import 'package:slinkshot_clone/Models/Skin.dart';
import 'package:slinkshot_clone/Models/SlinkShot.dart';
import 'package:slinkshot_clone/Models/User.dart';
import 'package:slinkshot_clone/Models/UserDetails.dart';

class AuthenticationProvider extends ChangeNotifier {
  User myUser;
  UserDetails myUserDetails;
  Skin mySkin;

  List<dynamic> mySlinkSHotsList = [];

  bool isLoggedIn = false;
  final String registerUrl =
      "https://slinkshotclone.herokuapp.com/api/auth/register";
  final String loginUrl = "https://slinkshotclone.herokuapp.com/api/auth/login";
  final String checkUrl = "https://slinkshotclone.herokuapp.com/api/auth/check";
  final String getUserDetailsByIdUrl =
      "https://slinkshotclone.herokuapp.com/api/getUserDetailsById";

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
    print(response);

    if (response["message"] == "registered successfully") {
      return true;
    }
    return false;
  }

  Future<bool> login({String username, String password}) async {
    var response = await postHTTP(
        url: loginUrl, body: {"username": username, "password": password});
    if (response == null) {}
    print(response);

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
    print(response);

    if (response["success"]) {
      print(response["info"]["_id"]);
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
    print(response);

    if (response["status"] == 200) {
      myUserDetails = UserDetails.fromJson(response["userDetails"]);
      mySkin=Skin.fromJson(myUserDetails.skin);
      mySlinkSHotsList =
          response["userDetails"]["slinkshots"].map((data) => SlinkShot.fromJson(data)).toList();
      notifyListeners();
      return true;
    }
    return false;
  }



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
