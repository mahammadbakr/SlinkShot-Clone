import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slinkshot_clone/Constants/AppIcons.dart';
import 'package:slinkshot_clone/Constants/ColorConstants.dart';

class HomeScreen extends StatefulWidget {


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 1;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Skin',
      style: optionStyle,
    ),
    Text(
      'Index 1: Search',
      style: optionStyle,
    ),
    Text(
      'Index 2: Home',
      style: optionStyle,
    ),
    Text(
      'Index 3: Profile',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PaletteColors.secondBackground,
        centerTitle: false,
        title: Image.asset(AppIcons.title,height: 44,),
        leading: SizedBox.shrink(),
      ),
      body: Column(
        children: [
          Center(
            child: Text("home screen"),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 40,
        items:  <BottomNavigationBarItem>[
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
            icon:  ImageIcon(
              AssetImage(AppIcons.camera),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon:  ImageIcon(
              AssetImage(AppIcons.personGirl),
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
