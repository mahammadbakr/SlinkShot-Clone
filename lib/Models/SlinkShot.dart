

import 'package:flutter/cupertino.dart';

class  SlinkShot {
  final String id;
  final String name;
  final Map<String,dynamic> user;
  final Map<String,dynamic> userDetails;
  final String description;
  final String videoUrl;
  final int like;
  final int viewNumber;
  final DateTime createdDate;

  SlinkShot(
      {
        @required this.id,
        @required this.name,
        @required this.user,
        @required this.userDetails,
        @required this.description,
        @required this.videoUrl,
        @required this.like,
        @required this.viewNumber,
        @required this.createdDate
        });

  factory  SlinkShot.fromJson(Map<String, dynamic> data) =>  SlinkShot(
      id: data["_id"],
    name: data["name"] ,
    user: data["user"],
    userDetails: data["userDetails"],
    description: data["description"],
    videoUrl: data["videoUrl"],
    like: data["like"],
    viewNumber: data["viewNumber"],
    createdDate: DateTime.parse(data["createdDate"]),
     );

  Map<String, dynamic> toJson() => <String, dynamic>{
    '_id': id,
    'name': name,
    'user': user,
    'userDetails': userDetails,
    'description': description,
    'videoUrl': videoUrl,
    'like': like,
    'viewNumber': viewNumber,
    'createdDate': createdDate,
  };
}
