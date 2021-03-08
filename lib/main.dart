
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:slinkshot_clone/Providers/AppSettingsProvider.dart';
import 'package:slinkshot_clone/Screens/EditProfileScreen/EditProfileScreen.dart';
import 'package:slinkshot_clone/Screens/MySkinsScreen/MySkinsScreen.dart';
import 'package:slinkshot_clone/Screens/MySlinkShotsScreen/MySlinkShotsScreen.dart';
import 'package:slinkshot_clone/Screens/SignInScreen/SignInScreen.dart';
import 'package:slinkshot_clone/Screens/SignUpScreen/SignUpScreen.dart';
import 'package:slinkshot_clone/Screens/SkinDetailsScreen/SkinDetailsScreen.dart';
import 'package:slinkshot_clone/Screens/SpinWheelScreen/SpinWheelScreen.dart';
import 'Constants/ColorConstants.dart';
import 'Helper/connectivity_status.dart';
import 'Providers/AuthenticationProvider.dart';
import 'Providers/OtherProvider.dart';
import 'Screens/AddSlinkShotScreen/AddSlinkShotScreen.dart';
import 'Screens/HomeScreen/HomeScreen.dart';
import 'Screens/SplashScreen/SplashScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  SystemChrome.setEnabledSystemUIOverlays([]);

  runApp(Providers());
}

class Providers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthenticationProvider>(
          create: (context) => AuthenticationProvider(),
        ),
        ChangeNotifierProvider<AppSettingsProvider>(
          create: (context) => AppSettingsProvider(),
        ),
        ChangeNotifierProvider<OtherProvider>(
          create: (context) => OtherProvider(),
        ),
      ],
      child: StreamProvider<ConnectivityStatus>(
          create: (context) =>
              ConnectivityService().connectionStatusControllerStream,
          child: MyApp()),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: PaletteColors.mainAppColor,
        primarySwatch: Colors.lightBlue,
        appBarTheme: AppBarTheme(
          elevation: 3,
        ),
        scaffoldBackgroundColor: PaletteColors.mainBackground,
      ),
      title: 'SlinkShot Clone',
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => HomeScreen(),
        '/signIn': (context) => SignInScreen(),
        '/signUp': (context) => SignUpScreen(),
        '/editProfile': (context) => EditProfileScreen(),
        '/skinDetails': (context) => SkinDetailsScreen(),
        '/mySlinkShots': (context) => MySlinkShotsScreen(),
        '/addSlinkShot': (context) => AddSlinkShotScreen(),
        '/mySkins': (context) => MySkinsScreen(),
        '/spinWheel': (context) => SpinWheelScreen(),
      },
    );
  }

}

