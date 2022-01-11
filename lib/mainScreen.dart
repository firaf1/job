import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:techino_app/Controller/user_controller.dart';
import 'package:techino_app/View/Auth/Login/login.dart';
import 'package:techino_app/View/Profile/profile.dart';
import 'package:techino_app/View/first/homeScreen.dart';
import 'package:techino_app/intro/utilities/styles.dart';
import 'package:techino_app/View/jobs/main_jobs_screen.dart';
import 'package:techino_app/View/setting/setting.dart';

UserController userController = new UserController();

class MainScreen extends StatefulWidget {
  int index;
  MainScreen({this.index = 0});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  bool token = false;
  int _currentIndex = 0;
  @override
  void initState() {
    userController.getSharedPrefs().then((value) {
      setState(() {
        token = userController.token;
        _currentIndex = widget.index;
      });
    });

    // TODO: implement initState
    super.initState();
  }

  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[0xFFfbefee, 0xFFe5f1f1, 0xFFfff7e5];

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
          child: !token
              ? Icon(
                  Icons.person_add_alt,
                  size: 30,
                  color: Colors.white,
                )
              : Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 5, color: Color.fromRGBO(005, 108, 200, 0.3)),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10000.0),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: userController.imagePath,
                      placeholder: (context, url) => Center(
                          child:
                              CircularProgressIndicator(color: primary.color)),
                      errorWidget: (context, url, error) =>
                          Icon(Icons.error, color: Colors.red),
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
