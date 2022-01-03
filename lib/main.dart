import 'package:flutter/material.dart';
 
import 'package:techino_app/mainScreen.dart';
// import 'package:techino_app/first/mainScreen.dart';

void main() {
//   to hide only bottom bar:
  // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
 // to hide only status bar:
  // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  // to hide both:
// SystemChrome.setEnabledSystemUIOverlays ([]);
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
