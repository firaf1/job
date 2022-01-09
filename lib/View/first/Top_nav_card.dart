import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techino_app/Controller/user_controller.dart';
import 'package:techino_app/intro/utilities/styles.dart';

class Top_Card extends StatefulWidget {
  @override
  _Top_CardState createState() => _Top_CardState();
}

class _Top_CardState extends State<Top_Card> {
  UserController userController = new UserController();
  bool token = false;
  @override
  void initState() {
    userController.getSharedPrefs().then((value) {
      setState(() {
        token = userController.token;
      });
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          height: 160,
          child: Align(
            alignment: AlignmentDirectional.topEnd,
            child: Container(
              padding: EdgeInsets.only(left: 30),
              height: 130,
              width: double.infinity,
              decoration: BoxDecoration(
                color: primary.color,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Container(
                margin: EdgeInsets.only(top: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    !token
                        ? Container(
                            child: Text(
                              "Welcome ...",
                              style: TextStyle(
                                color: secondary.color,
                                // fontFamily: rob,
                                fontWeight: FontWeight.bold,
                                fontSize: 25.5,
                              ),
                            ),
                          )
                        : Container(
                            child: Text(
                              "🖐 ${userController.name} ",
                              style: TextStyle(
                                color: secondary.color,
                                // fontFamily: rob,
                                fontWeight: FontWeight.bold,
                                fontSize: 25.5,
                              ),
                            ),
                          ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        "What do you want to  find today ?",
                        style: TextStyle(
                          color: Color(0xFFcbc5be),
                          fontSize: 18.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          child: Container(
            padding: EdgeInsets.only(left: 15, top: 2, bottom: 5),
            margin: EdgeInsets.only(top: 10),
            height: 55,
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
              style: TextStyle(
                color: primary.color,
                fontSize: 18,
              ),
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
    );
  }
}
