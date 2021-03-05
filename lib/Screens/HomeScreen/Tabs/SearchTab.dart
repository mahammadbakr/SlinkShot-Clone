import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slinkshot_clone/Constants/AppIcons.dart';
import 'package:slinkshot_clone/Constants/ColorConstants.dart';

class SearchTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
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
        ),
        Positioned(
          bottom: 10,
          right: 15,
          child: Row(
            children: [
              FloatingActionButton(
                  mini: true,
                  backgroundColor: PaletteColors.mainAppColor,
                  child:  ImageIcon(

                    AssetImage(AppIcons.filter,),
                    color: PaletteColors.mainBackground,
                  ),
                  onPressed: () async {

                  }),
            ],
          ),
        ),

      ],
    );
  }
}
