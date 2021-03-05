

import 'package:flutter/cupertino.dart';

class  Skin {
  final String id;
  final String name;
  final String image;
  final int price;
  final DateTime createdDate;

  Skin(
      {@required this.id,
        @required this.name,
        @required this.image,
        @required this.price,
        @required this.createdDate
        });

  factory  Skin.fromJson(Map<String, dynamic> data) =>  Skin(
      id: data["_id"],
    name: data["name"],
    image: data["image"],
    price: data["price"],
    createdDate: DateTime.parse(data["createdDate"]),
     );

  Map<String, dynamic> toJson() => <String, dynamic>{
    '_id': id,
    'name': name,
    'image': image,
    'price': price,
    'createdDate': createdDate,
  };
}
