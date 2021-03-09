import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slinkshot_clone/Constants/AppIcons.dart';
import 'package:slinkshot_clone/Constants/ColorConstants.dart';
import 'package:slinkshot_clone/Providers/AppSettingsProvider.dart';
import 'package:slinkshot_clone/Providers/AuthenticationProvider.dart';
import 'package:slinkshot_clone/Screens/HomeScreen/Tabs/SlinkShotTab.dart';
import 'package:slinkshot_clone/Screens/HomeScreen/Tabs/ProfileTab.dart';
import 'package:slinkshot_clone/Screens/HomeScreen/Tabs/SearchTab.dart';
import 'package:slinkshot_clone/Screens/HomeScreen/Tabs/SkinTab.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

   GlobalKey<ScaffoldState> _scaffoldKey ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scaffoldKey = new  GlobalKey<ScaffoldState>();

  }
  @override
  Widget build(BuildContext context) {
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    final settingsProvider =
        Provider.of<AppSettingsProvider>(context, listen: false);


    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: PaletteColors.secondBackground,
        centerTitle: true,
        title: Image.asset(
          AppIcons.title,
          height: 44,
        ),
        leading: SizedBox.shrink(),
      ),
      body: Consumer<AppSettingsProvider>(
          builder: (_, homeState, __) =>
              homeState.getHomeTab().toString() == "0"
                  ? SkinTab()
                  : homeState.getHomeTab().toString() == "1"
                      ? SearchTab()
                      : homeState.getHomeTab().toString() == "2"
                          ? SlinkShotTab()
                          : ProfileTab()),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 40,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(AppIcons.skin1),
            ),
            label: 'Skin',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(AppIcons.search),
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(AppIcons.camera),
            ),
            label: 'SlinkShot',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(AppIcons.personGirl),
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: settingsProvider.getHomeTab(),
        onTap: (index) {
          setState(() {
            settingsProvider.setHomeTab(index);
            print(index);
          });
        },
      ),
    );
  }
}
