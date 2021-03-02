import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:slinkshot_clone/Constants/ColorConstants.dart';

import 'connectivity_status.dart';

class NetworkSensitive extends StatelessWidget {
  final Widget child;

  const NetworkSensitive({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var connectionStatus = Provider.of<ConnectivityStatus>(context);
    if (connectionStatus == ConnectivityStatus.Offline)
      return Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'you are currently offline',
                style: TextStyle(
                  color: PaletteColors.redColorApp.withOpacity(0.7),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 2),
              Text(
                'please check your internet connection',
                style: TextStyle(
                  color: PaletteColors.darkRedColorApp,
                  fontSize: 12,
                ),
              ),
              FlatButton.icon(
                onPressed: () {},
                textColor: PaletteColors.darkRedColorApp,
                label: Text(
                  'retry',
                  style: TextStyle(fontSize: 12),
                ),
                icon: Icon(Icons.refresh, color: PaletteColors.darkRedColorApp),
              )
            ],
          ),
        ),
      );

    return child;
  }
}
