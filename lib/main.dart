import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:techino_app/first/mainScreen.dart';
import 'package:techino_app/intro/screens/onboarding_screen.dart';

void main() {
//   to hide only bottom bar:
  // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);

// to hide only status bar:
  // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
    // systemNavigationBarColor: Colors.blue, // navigation bar color
    statusBarColor: Color(0xFFf9ebda), // status bar color
  ));

// to hide both:
// SystemChrome.setEnabledSystemUIOverlays ([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}
