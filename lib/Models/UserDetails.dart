

import 'package:flutter/cupertino.dart';

class  UserDetails {
  final String id;
  final String user;
  final String name;
  // final String skin;
  final String bio;
  final String channel;
  final String followers;
  final String slinkshots;

  UserDetails(
      {@required this.id,
        @required this.user,
        @required this.name,
        // @required this.skin,
        @required this.bio,
        @required this.channel,
        @required this.followers,
        @required this.slinkshots,
        });

  factory  UserDetails.fromJson(Map<String, dynamic> data) =>  UserDetails(
      id: data["_id"],
    user: data["user"],
      name: data["name"],
      // skin: data["skin"],
    bio: data["bio"],
    channel: data["channel"],
    followers: data["followers"],
    slinkshots: data["slinkshots"]
     );

  Map<String, dynamic> toJson() => <String, dynamic>{
    '_id': id,
    'user': user,
    'name': name,
    // 'skin': skin,
    'bio': bio,
    'channel': channel,
    'followers': followers,
    'slinkshots': slinkshots,
  };
}
