

import 'package:flutter/cupertino.dart';

class  Skin {
  final String id;
  final String name;
  final String description;
  final String image;
  final int price;
  final DateTime createdDate;

  Skin(
      {@required this.id,
        @required this.name,
        @required this.description,
        @required this.image,
        @required this.price,
        @required this.createdDate
        });

  factory  Skin.fromJson(Map<String, dynamic> data) =>  Skin(
      id: data["_id"],
    name: data["name"],
    description: data["description"],
    image: data["image"],
    price: data["price"],
    createdDate: DateTime.parse(data["createdDate"]),
     );

  Map<String, dynamic> toJson() => <String, dynamic>{
    '_id': id,
    'name': name,
    'description': description,
    'image': image,
    'price': price,
    'createdDate': createdDate,
  };
}
