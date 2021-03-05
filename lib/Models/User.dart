

import 'package:flutter/cupertino.dart';

class  User {
  final String id;
  final String username;
  final String token;

  User(
      {@required this.id,
        @required this.username,
        @required this.token
        });

  factory  User.fromJson(Map<String, dynamic> data) =>  User(
      id: data["_id"],
    username: data["username"],
    token: data["token"],
     );

  Map<String, dynamic> toJson() => <String, dynamic>{
    '_id': id,
    'username': username,
    'token': token,
  };
}
