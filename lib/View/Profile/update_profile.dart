import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techino_app/Controller/ad_controller.dart';
import 'package:techino_app/Controller/user_controller.dart';
import 'package:techino_app/View/Profile/profile.dart';
import 'package:techino_app/intro/utilities/styles.dart';
import 'package:http/http.dart' as http;
import 'package:techino_app/mainScreen.dart';

class UpdateProfile extends StatefulWidget {
  var title, update;

  UpdateProfile({this.title, this.update});

  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  bool nameLoading = false;
  updatePre(key, value) async {
    if (key == 'name') {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        prefs.setString('name', name).then((value) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height - 150),
              backgroundColor: Colors.cyan,
              behavior: SnackBarBehavior.floating,
              content: Container(
                height: 30,
                width: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.verified_sharp, color: Colors.white, size: 30),
                    Container(width: 20),
                    Text('Successfully Updated!'),
                  ],
                ),
              ),
            ),
          );
          Navigator.pushReplacement(context,
              new MaterialPageRoute(builder: (context) => new MainScreen()));
        });
      });
    }
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${userController.accessToken}'
      };

  UserController userController = new UserController();
  late String name = "", email = "", phoneNumber = "", address = "", job = "";

  bool isNameLoading = false;
  @override
  void initState() {
    userController.getSharedPrefs().then((value) {
      setState(() {
        name = userController.name;
        email = userController.email;
        phoneNumber = userController.phoneNumber;
        address = userController.address;
        job = userController.job;
      });
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, top: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: primary.color,
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                      ),
                      // color: Colors.red,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25),
                  child: Text(
                    widget.title,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: primary.color,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 45, left: 35, right: 35),
              height: 250,
              width: MediaQuery.of(context).size.width - 70,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFFf3f3f3),
                    offset: Offset(0, 0.5),
                    spreadRadius: 5,
                    blurRadius: 8,
                  )
                ],
              ),
              child: widget.update == 'fullName'
                  ? Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 15),
                          decoration: BoxDecoration(
                            color: Color(0xFFf2f2f2),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              focusColor: primary.color,
                              prefixIcon: Icon(
                                Icons.account_circle_sharp,
                                color: primary.color,
                              ),
                              hintText: name,
                              border: InputBorder.none,
                            ),
                            onChanged: (value) {
                              name = value;
                            },
                          ),
                        ),
                        InkWell(
                          onTap: () {
                           setState(() {
                              nameLoading = true;
                           });
                            var data = {'name': name};
                            print(userController.accessToken);
                            http
                                .post(
                              Uri.parse('$url/update-name'),
                              body: jsonEncode(data),
                              headers: _setHeaders(),
                            )
                                .then((value) {
                              if (value.statusCode == 200) {
                                updatePre('name', name);
                              }
                             setState(() {
                                nameLoading = false;
                             });
                            });
                          },
                          child: Container(
                            height: 50,
                            margin:
                                EdgeInsets.only(top: 15, left: 35, right: 35),
                            width: MediaQuery.of(context).size.width - 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: primary.color,
                            ),
                            child: Center(
                              child: nameLoading
                                  ? CircularProgressIndicator(color:Colors.white)
                                  : Text(
                                      'Change Name',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : widget.update == 'email'
                      ? Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 15),
                              decoration: BoxDecoration(
                                color: Color(0xFFf2f2f2),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  focusColor: primary.color,
                                  prefixIcon: Icon(
                                    Icons.mail,
                                    color: primary.color,
                                  ),
                                  hintText: 'feraolbiru@gmail.com',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              margin:
                                  EdgeInsets.only(top: 15, left: 35, right: 35),
                              width: MediaQuery.of(context).size.width - 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: primary.color,
                              ),
                              child: Center(
                                  child: Text(
                                'Change Email',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                            ),
                          ],
                        )
                      : widget.update == 'phoneNumber'
                          ? Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 15),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFf2f2f2),
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      focusColor: primary.color,
                                      prefixIcon: Icon(
                                        Icons.call,
                                        color: primary.color,
                                      ),
                                      hintText: '+251936258910',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  margin: EdgeInsets.only(
                                      top: 15, left: 35, right: 35),
                                  width: MediaQuery.of(context).size.width - 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: primary.color,
                                  ),
                                  child: Center(
                                      child: Text(
                                    'Change Phone',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                                ),
                              ],
                            )
                          : Text('hello'),
            )
          ],
        ),
      ),
    );
  }
}
