import 'package:flutter/material.dart';
import 'package:techino_app/mainScreen.dart';
import 'package:techino_app/intro/utilities/styles.dart';

class Tab_Bar extends StatefulWidget {
  const Tab_Bar({Key? key}) : super(key: key);

  @override
  _Tab_BarState createState() => _Tab_BarState();
}

class _Tab_BarState extends State<Tab_Bar> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(left: 15, top: 10),
        color: Colors.white,
        height: 40,
        child: TabBar(
          unselectedLabelColor: Color(0xFF6a6a6a),
          indicator: BoxDecoration(
            color: secondary.color,
            borderRadius: BorderRadius.circular(8),
          ),
          isScrollable: true,
          controller: tabController,
          labelPadding: EdgeInsets.only(left: 20, right: 20),
          labelColor: primary.color,
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
    );
  }
}
