import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:techino_app/Auth/Login/login.dart';
import 'package:techino_app/Controller/Job_controller.dart';
import 'package:techino_app/Model/Jobs_category.dart';
import 'package:techino_app/View/Profile/profile.dart';

import 'package:techino_app/View/first/homeScreen.dart';

import 'package:techino_app/intro/utilities/styles.dart';
import 'package:techino_app/View/jobs/main_jobs_screen.dart';
import 'package:techino_app/View/setting/setting.dart';

import 'View/first/Top_nav_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[0xFFfbefee, 0xFFe5f1f1, 0xFFfff7e5];
  int _currentIndex = 0;

  int _counter = 0;
  var pages = [
    HomeScreen(),
    Main_Jobs_Screen(),
    ProfileScreen(),
    SettingScreen()
  ];
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: primary.color, // navigation bar color
      statusBarColor: primary.color, // status bar color
    ));
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: Colors.red,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.work_outline_rounded),
            title: Text('Jobs'),
            activeColor: Colors.purpleAccent,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.person_outline_rounded),
            title: Text(
              'Profile',
            ),
            activeColor: Colors.pink,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
            activeColor: Colors.blue,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      appBar: AppBar(
        brightness: Brightness.light,
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: primary.color),
        leading: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext conte) => Login(),
              ),
            );
          },
          child: Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              border: Border.all(
                  width: 4, color: Color.fromRGBO(255, 218, 230, 0.55)),
              color: Colors.red,
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/my.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        title: Text("Logo Here",
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.bold,
              fontSize: 25.5,
            )),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Color(0xFFFFFFFF),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite,
              color: Color(0xFFFFFFFF),
            ),
          ),
        ],
        backgroundColor: primary.color,
        elevation: 0.0,
      ),
      body: pages[_currentIndex],
    );
  }
}
