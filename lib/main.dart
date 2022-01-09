import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techino_app/Controller/user_controller.dart';
import 'package:techino_app/mainScreen.dart';
import 'package:techino_app/no_connection.dart';
import 'package:techino_app/server_error.dart';
// import 'package:techino_app/first/mainScreen.dart';

Future<void> main() async {
  UserController userController = new UserController();
  userController.getSharedPrefs();
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String login = prefs.getString("token1").toString();
  print("login:" + login.toString());

//   to hide only bottom bar:
  // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
  // to hide only status bar:
  // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  // to hide both:
// SystemChrome.setEnabledSystemUIOverlays ([]);

  // runApp(MaterialApp(home: login == "" ? NoConnection() : ServerError()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarIconB rightness: Brightness.light,
    //   systemNavigationBarColor: primary.color, // navigation bar color
    //   statusBarColor: primary.color, // status bar color
    // ));
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
      // home: Login(),
    );
  }
}

class MyApp1 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarIconB rightness: Brightness.light,
    //   systemNavigationBarColor: primary.color, // navigation bar color
    //   statusBarColor: primary.color, // status bar color
    // ));
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NoConnection(),
      // home: Login(),
    );
  }
}
