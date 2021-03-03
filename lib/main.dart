import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'Constants/ColorConstants.dart';
import 'Helper/connectivity_status.dart';
import 'Providers/AuthProvider.dart';
import 'Screens/HomeScreen/HomeScreen.dart';
import 'Screens/SplashScreen/SplashScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  runApp(Providers());
}

class Providers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
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
          title: 'Slikon Shot Clone',
          initialRoute: '/',
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => SplashScreen(),
            '/home': (context) => HomeScreen(),
          },
    );
  }
}