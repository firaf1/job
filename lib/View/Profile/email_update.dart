import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techino_app/Controller/user_controller.dart';
import 'package:techino_app/intro/utilities/styles.dart';
import 'package:http/http.dart' as http;
import 'package:techino_app/mainScreen.dart';

class EmailUpdate extends StatefulWidget {
  @override
  _EmailUpdateState createState() => _EmailUpdateState();
}

class _EmailUpdateState extends State<EmailUpdate> {
  String preEmail = "";
  bool isShow = true;
  UserController userController = new UserController();

  void initState() {
    userController.getSharedPrefs().then((value) {
      setState(() {
        preEmail = userController.email;
      });
    });

    // TODO: implement initState
    super.initState();
  }

  String passwordMessage = "";
  String emailMessage = "";
  String password = "";
  String email = "";
  bool isLoading = false;
  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${userController.accessToken}'
      };
  updatePre(email1) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userController.email = email1;
      prefs.setString('email', email1).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height - 140),
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
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext cotext) => MainScreen(
              index: 2,
            ),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    "Update Email",
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
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
              padding: EdgeInsets.only(bottom: 30, top: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black87,
                      offset: Offset(0.5, 0.5),
                      blurRadius: 5,
                    )
                  ]),
              child: Column(
                children: [
                  passwordMessage != ""
                      ? Container(
                          child: Text(
                            passwordMessage,
                            style: TextStyle(color: Colors.red),
                          ),
                        )
                      : SizedBox(
                          height: 13,
                        ),
                  passwordMessage != ""
                      ? Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            border: Border.all(width: 3, color: Colors.red),
                            color: Color(0xFFf2f2f2),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: TextFormField(
                            obscureText: isShow,
                            onChanged: (value) {
                              password = value;
                            },
                            decoration: InputDecoration(
                              focusColor: primary.color,
                              prefixIcon: Icon(
                                Icons.lock_outline_rounded,
                                color:Colors.red,
                              ),
                              suffix: GestureDetector(
                                onTap: () {
                                  setState(
                                    () {
                                      this.isShow = !this.isShow;
                                    },
                                  );
                                },
                                child: Icon(
                                  this.isShow == true
                                      ? Icons.visibility
                                      : Icons.visibility_off_rounded,
                                  color: Colors.red,
                                ),
                              ),
                              hintText: 'password',
                              border: InputBorder.none,
                            ),
                          ),
                        )
                      : Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            color: Color(0xFFf2f2f2),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: TextFormField(
                            obscureText: isShow,
                            onChanged: (value) {
                              password = value;
                            },
                            decoration: InputDecoration(
                              focusColor: primary.color,
                              prefixIcon: Icon(
                                Icons.lock_outline_rounded,
                                color: primary.color,
                              ),
                              suffix: GestureDetector(
                                onTap: () {
                                  setState(
                                    () {
                                      this.isShow = !this.isShow;
                                    },
                                  );
                                },
                                child: Icon(
                                  this.isShow == true
                                      ? Icons.visibility
                                      : Icons.visibility_off_rounded,
                                  color: primary.color,
                                ),
                              ),
                              hintText: 'password',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                  emailMessage != ""
                      ? Container(
                          child: Text(
                            emailMessage,
                            style: TextStyle(color: Colors.red),
                          ),
                        )
                      : SizedBox(
                          height: 13,
                        ),
                  emailMessage != ""
                      ? Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            border: Border.all(width: 3, color: Colors.red),
                            color: Color(0xFFf2f2f2),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: TextFormField(
                            onChanged: (value) {
                              email = value;
                            },
                            decoration: InputDecoration(

                              focusColor: primary.color,
                              
                              prefixIcon: Icon(
                                Icons.mail,
                                color: Colors.red,
                              ),
                              hintText: userController.email,
                              border: InputBorder.none,
                            ),
                          ),
                        )
                      : Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            color: Color(0xFFf2f2f2),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: TextFormField(
                            onChanged: (value) {
                              email = value;
                            },
                            decoration: InputDecoration(
                              focusColor: primary.color,
                              prefixIcon: Icon(
                                Icons.mail,
                                color: primary.color,
                              ),
                              hintText: userController.email,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isLoading = true;
                      });
                      var data = {
                        'password': password,
                        'email': email,
                      };

                      http
                          .post(
                        Uri.parse('$url/update-email'),
                        body: jsonEncode(data),
                        headers: _setHeaders(),
                      )
                          .then((value) {
                        setState(() {
                          passwordMessage = "";
                          emailMessage = "";
                        });
                        if (value.statusCode != 200) {
                          final response = json.decode(value.body);

                          Map<String, dynamic> error_list = response;

                          error_list.keys.forEach((element) {
                            print(element);
                            if (element == 'password') {
                              passwordMessage = response['password'][0];
                            }
                            if (element == 'email') {
                              emailMessage = response['email'][0];
                            }
                          });
                          setState(() {
                            isLoading = false;
                          });
                        } else {
                          setState(() {
                            isLoading = false;
                          });
                          updatePre(email);
                        }
                      });
                    },
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.only(top: 15, left: 35, right: 35),
                      width: MediaQuery.of(context).size.width - 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: primary.color,
                      ),
                      child: Center(
                        child: isLoading
                            ? CircularProgressIndicator(color: Colors.white)
                            : Text(
                                'Change Email',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
