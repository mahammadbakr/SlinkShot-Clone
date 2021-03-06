import 'package:flutter/cupertino.dart';

class UserDetails {
  final String id;
  final Map<String, dynamic> user;
  final String name;
  final Map<String, dynamic> skin;
  final String bio;
  final String channel;
  final int wallet;
  final List<dynamic> followers;
  final List<dynamic> skins;
  final List<dynamic> slinkshots;

  UserDetails({
    @required this.id,
    @required this.user,
    @required this.name,
    @required this.skin,
    @required this.bio,
    @required this.channel,
    @required this.wallet,
    @required this.followers,
    @required this.skins,
    @required this.slinkshots,
  });

  factory UserDetails.fromJson(Map<String, dynamic> data) => UserDetails(
      id: data["_id"],
      user: data["user"] ,
      name: data["name"],
      skin: data["skin"],
      bio: data["bio"],
      channel: data["channel"],
      wallet: data["wallet"],
      followers: data["followers"],
      skins: data["skins"],
      slinkshots: data["slinkshots"]);

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'user': user,
        'name': name,
        'skin': skin,
        'bio': bio,
        'channel': channel,
        'wallet': wallet,
        'followers': followers,
        'skins': skins,
        'slinkshots': slinkshots,
      };
}
