import 'package:flutter/material.dart';
import 'package:slinkshot_clone/Helper/SlinkShotHttp.dart';

class AuthenticationProvider extends ChangeNotifier {
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



  Future<void> register(String username, String password) async {
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

  Future<void> login(String username, String password) async {
    var response = await postHTTP(url: registerUrl, body: {
      "username":username,
      "password":password,
    });
    if (response == null) {}
    print(response);

    if(response["message"]=="logged in successfully"){
      return true;
    }
    return false;
  }

}
