import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slinkshot_clone/Helper/SlinkShotHttp.dart';
import 'package:slinkshot_clone/Models/User.dart';
import 'package:slinkshot_clone/Models/UserDetails.dart';

class AuthenticationProvider extends ChangeNotifier {

  User myUser;
  UserDetails myUserDetails;

  bool isLoggedIn = false;
  final String registerUrl = "https://slinkshotclone.herokuapp.com/api/auth/register";
  final String loginUrl = "https://slinkshotclone.herokuapp.com/api/auth/login";

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
      "username":username,
      "password":password,
    });
    if (response == null) {}
    print(response);

    if(response["message"]=="registered successfully"){

      return true;
    }
    return false;
  }

  Future<bool> login({String username, String password}) async {
    var response = await postHTTP(url: loginUrl, body: {
      "username":username,
      "password":password
    });
    if (response == null) {}
    print(response);

    if(response["message"]=="logged in successfully"){
      print("trueee");
        isLoggedIn=true;
        notifyListeners();
      return true;
    }
    print("falseee");

    return false;
  }




  Future<void> addUserToSharedPreferences({User user, UserDetails userDetails}) async {
    myUser=user;
    myUserDetails=userDetails;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(
        'user', json.encode(user));
    sharedPreferences.setString(
        'user-details', json.encode(user));
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
