

import 'package:flutter/cupertino.dart';

class  SlinkShot {
  final String id;
  final String name;
  final String user;
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
        @required this.description,
        @required this.videoUrl,
        @required this.like,
        @required this.viewNumber,
        @required this.createdDate
        });

  factory  SlinkShot.fromJson(Map<String, dynamic> data) =>  SlinkShot(
      id: data["_id"]?? "null",
    name: data["name"] ?? "null",
    user: data["user"],
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
    'description': description,
    'videoUrl': videoUrl,
    'like': like,
    'viewNumber': viewNumber,
    'createdDate': createdDate,
  };
}
