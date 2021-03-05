import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slinkshot_clone/Constants/AppIcons.dart';

class SearchTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(12),
      children: [
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Search for peoples, skins and videos',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12)
            ),
            suffixIcon: ImageIcon(
              AssetImage(AppIcons.search),
            ),
          ),
        ),
      ],
    );
  }
}
