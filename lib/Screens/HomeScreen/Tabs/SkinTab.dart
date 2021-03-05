import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:slinkshot_clone/Providers/OtherProvider.dart';

class SkinTab extends StatelessWidget {
  // final words = Provider.of<Language>(context).words;

  @override
  Widget build(BuildContext context) {
    // final words = Provider.of<OtherProvider>(context,listen:false ).getAllSkins();

    return Consumer<OtherProvider>(
        builder: (_, providerState, __) {
          return providerState.skinsList.isEmpty
            ? Center(child: CircularProgressIndicator())
            : GridView.builder(
            padding: EdgeInsets.all(12),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: providerState.skinsList.length,
                itemBuilder: (BuildContext ctx, index) {
                  return Container(
                    alignment: Alignment.center,
                    child: Text(providerState.skinsList[index].name),
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(15)),
                  );
                });
        });
  }
}

class SelectCard extends StatelessWidget {
  const SelectCard({Key key, this.str}) : super(key: key);
  final String str;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
        color: Colors.orange,
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child: Icon(Icons.seven_k,
                        size: 50.0, color: textStyle.color)),
                Text(str, style: textStyle),
              ]),
        ));
  }
}
