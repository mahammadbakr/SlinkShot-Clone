

import 'package:flutter/cupertino.dart';

class  UserDetails {
  final String id;
  final String user;
  final String name;
  final String image;
  final String bio;
  final String channel;
  final String followers;
  final String slinkshots;

  UserDetails(
      {@required this.id,
        @required this.user,
        @required this.name,
        @required this.image,
        @required this.bio,
        @required this.channel,
        @required this.followers,
        @required this.slinkshots,
        });

  factory  UserDetails.fromJson(Map<String, dynamic> data) =>  UserDetails(
      id: data["_id"],
    user: data["user"],
      name: data["name"],
    image: data["image"],
    bio: data["bio"],
    channel: data["channel"],
    followers: data["followers"],
    slinkshots: data["slinkshots"]
     );

  Map<String, dynamic> toJson() => <String, dynamic>{
    '_id': id,
    'user': user,
    'name': name,
    'image': image,
    'bio': bio,
    'channel': channel,
    'followers': followers,
    'slinkshots': slinkshots,
  };
}
