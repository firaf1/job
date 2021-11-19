import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:techino_app/first/jobCategory.dart';
import 'package:techino_app/intro/utilities/styles.dart';

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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      // statusBarIconBrightness: Brightness.dark,
      // systemNavigationBarColor: Colors.blue, // navigation bar color
      statusBarColor: Color(0xFFff8a00), // status bar color
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
            icon: Icon(Icons.apps),
            title: Text('Home'),
            activeColor: Colors.red,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.people),
            title: Text('Users'),
            activeColor: Colors.purpleAccent,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.message),
            title: Text(
              'Messages test for mes teset test test ',
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
        leading: IconButton(
          icon:
              Icon(Icons.menu, color: Color(0xFFFFFFFF)), // set your color here
          onPressed: () {},
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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    height: 140,
                    child: Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: Container(
                        padding: EdgeInsets.only(left: 30),
                        height: 120,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: primary.color,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 12),
                              child: Text(
                                "Welcome ...",
                                style: TextStyle(
                                  color: Color(0xFF000000),
                                  // fontFamily: rob,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.5,
                                ),
                              ),
                            ),
                            Text(
                              "What do you want to  find today ?",
                              style: TextStyle(
                                color: Color(0xFFcbc5be),
                                fontSize: 18.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      margin: EdgeInsets.only(top: 0),
                      height: 45,
                      width: MediaQuery.of(context).size.width / 1.2,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 0,
                            color: Color(0xFFcfd4d7),
                            offset: Offset(5, 5),
                            blurRadius: 20,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.search,
                            color: primary.color,
                          ),
                          border: InputBorder.none,
                          hintText: "Search...",
                        ),
                      ),
                    ),
                  )
                ],
              ),
              //Ad Card
              Container(
                margin: EdgeInsets.only(
                    left: (MediaQuery.of(context).size.width -
                            (MediaQuery.of(context).size.width / 1.1)) /
                        2),
                height: 120,
                width: MediaQuery.of(context).size.width / 1.1,
                decoration: BoxDecoration(
                  color: Color(0xFFffdae6),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "25% Discount",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 2),
                            child: Text(
                              "Buy one, to get the second",
                              style: TextStyle(
                                color: Color(0xFF9f9f9f),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'Details',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 150,
                      width: 120,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/coffee.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 15, top: 10),
                  color: Colors.white,
                  height: 40,
                  child: TabBar(
                    unselectedLabelColor: Color(0xFF6a6a6a),
                    indicator: BoxDecoration(
                      color: Color(0xFFf9ebda),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    isScrollable: true,
                    controller: tabController,
                    labelPadding: EdgeInsets.only(left: 20, right: 20),
                    labelColor: Color(0xFFff8a00),
                    tabs: [
                      Container(
                        height: 30,
                        child: Tab(
                          child: Text(
                            'Recently',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // text: 'IT',
                        ),
                      ),
                      Container(
                        child: Tab(
                          text: 'Popular',
                        ),
                      ),
                      Container(
                        child: Tab(
                          text: 'Company',
                        ),
                      ),
                    ],
                  ),
                ),
              ),

//Horzontal Scrol View

              Container(
                margin: EdgeInsets.only(bottom: 20, top: 10),
                decoration: BoxDecoration(),
                height: 230,
                child: TabBarView(
                  controller: tabController,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      height: 230,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: entries.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFFbacdcb),
                                    blurRadius: 5,
                                    spreadRadius: 3,
                                    offset: Offset(0, 0.5),
                                  )
                                ],
                              ),
                              margin: EdgeInsets.only(
                                  left: 10, right: 10, top: 10, bottom: 10),
                              width: 220,
                              height: 240,
                              padding: EdgeInsets.only(left: 10, top: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 130,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'assets/images/677379.jpg',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      'Awash Bank',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      'Accounting',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10, top: 5),
                                    child: Text(
                                      '2500 bir',
                                      style: TextStyle(
                                        color: Color(0xFFbacdcb),
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ));
                        },
                      ),
                    ),
                    Container(
                      height: 80,
                      color: Colors.orange,
                      child: Text('About Health'),
                    ),
                    Container(
                      height: 80,
                      color: Colors.red,
                      child: Text('About Technology'),
                    ),
                  ],
                ),
              ),
              JobCategory(),
            ],
          ),
        ),
      ),
    );
  }
}
