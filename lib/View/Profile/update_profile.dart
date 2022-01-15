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

String phoneNumberMessage = "";
String phoneNumber = "";
String phoneNumber1 = "";
bool phoneLoading = false;
String password = "", oldPassword = "", confirmPassword = "";
String passwordMessage = "",
    oldPasswordMessage = "",
    confirmPasswordMessage = "";
bool isShow2 = true;
bool isShow = true;
bool isShow3 = true;
bool passwordLoading = false;

class _UpdateProfileState extends State<UpdateProfile> {
  GlobalKey<FormState> globalkey = GlobalKey();
  bool nameLoading = false;
  updatePre(key, value) async {
    if (key == 'name') {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        prefs.setString('name', name).then((value) {
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

  updatePre11(email1) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userController.phoneNumber = email1;
      prefs.setString('phoneNumber', email1).then((value) {
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
              padding: EdgeInsets.all(10),
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
                            try {
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
                            } catch (e) {
                              setState(() {
                                nameLoading = false;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  margin: EdgeInsets.only(
                                      bottom:
                                          MediaQuery.of(context).size.height -
                                              140),
                                  backgroundColor: Colors.red,
                                  behavior: SnackBarBehavior.floating,
                                  content: Container(
                                    height: 30,
                                    width: 50,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.verified_sharp,
                                            color: Colors.white, size: 30),
                                        Container(width: 20),
                                        Text('Something went wrong!'),
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
                            }
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
                                  ? CircularProgressIndicator(
                                      color: Colors.white)
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
                  : widget.update == 'phoneNumber'
                      ? Column(
                          children: [
                            Container(
                              child: Text(phoneNumberMessage,
                                  style: TextStyle(color: Colors.red)),
                            ),
                            phoneNumberMessage != ""
                                ? Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 15),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 3, color: Colors.red),
                                      color: Color(0xFFf2f2f2),
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: TextFormField(
                                      onChanged: (value) {
                                        phoneNumber1 = value;
                                      },
                                      decoration: InputDecoration(
                                        focusColor: primary.color,
                                        prefixIcon: Icon(
                                          Icons.call,
                                          color: Colors.red,
                                        ),
                                        hintText: userController.phoneNumber,
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  )
                                : Container(
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
                                      onChanged: (value) {
                                        phoneNumber1 = value;
                                      },
                                      decoration: InputDecoration(
                                        focusColor: primary.color,
                                        prefixIcon: Icon(
                                          Icons.call,
                                          color: primary.color,
                                        ),
                                        hintText: userController.phoneNumber,
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                            GestureDetector(
                              onTap: () {
                                try {
                                  setState(() {
                                    phoneLoading = true;
                                  });
                                  var data = {
                                    'phone_number': phoneNumber1,
                                  };

                                  http
                                      .post(
                                    Uri.parse('$url/update-phone'),
                                    body: jsonEncode(data),
                                    headers: _setHeaders(),
                                  )
                                      .then((value) {
                                    setState(() {
                                      phoneNumberMessage = "";
                                    });
                                    if (value.statusCode != 200) {
                                      final response = json.decode(value.body);

                                      Map<String, dynamic> error_list =
                                          response;

                                      error_list.keys.forEach((element) {
                                        print(element);
                                        if (element == 'phone_number') {
                                          phoneNumberMessage =
                                              response['phone_number'][0];
                                        }
                                      });
                                      setState(() {
                                        phoneLoading = false;
                                      });
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          margin: EdgeInsets.only(bottom: 10),
                                          backgroundColor: Colors.red,
                                          behavior: SnackBarBehavior.floating,
                                          content: Container(
                                            width: 50,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(Icons.close,
                                                    color: Colors.white,
                                                    size: 30),
                                                Text('Something is went wrong'),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    } else if (value.statusCode == 200) {
                                      setState(() {
                                        phoneLoading = false;
                                      });
                                      updatePre11(phoneNumber1);
                                    }
                                  });
                                } catch (e) {
                                  setState(() {
                                    phoneLoading = false;
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      margin: EdgeInsets.only(bottom: 10),
                                      backgroundColor: Colors.red,
                                      behavior: SnackBarBehavior.floating,
                                      content: Container(
                                        width: 50,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.close,
                                                color: Colors.white, size: 30),
                                            Text('Something went wrong'),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                height: 50,
                                margin: EdgeInsets.only(
                                    top: 15, left: 35, right: 35),
                                width: MediaQuery.of(context).size.width - 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: primary.color,
                                ),
                                child: Center(
                                    child: phoneLoading
                                        ? CircularProgressIndicator(
                                            color: Colors.white)
                                        : Text(
                                            'Change Phone',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )),
                              ),
                            ),
                          ],
                        )
                      : widget.update == "password"
                          ? Column(
                              children: [
                                oldPasswordMessage != ""
                                    ? Container(
                                        child: Text(
                                          oldPasswordMessage,
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      )
                                    : Container(),
                                oldPasswordMessage != ""
                                    ? Container(
                                        margin: EdgeInsets.only(
                                            bottom: 12, top: 10),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 3, color: Colors.red),
                                          color: Color(0xFFf2f2f2),
                                          borderRadius:
                                              BorderRadius.circular(7),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        child: TextFormField(
                                          onChanged: (value) {
                                            oldPassword = value;
                                          },
                                          obscureText: isShow,
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.lock_outline_rounded,
                                              color: primary.color,
                                            ),
                                            suffixIcon: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  isShow = !isShow;
                                                });
                                              },
                                              child: Icon(
                                                isShow == true
                                                    ? Icons.remove_red_eye_sharp
                                                    : Icons.visibility_off,
                                                color: primary.color,
                                              ),
                                            ),
                                            hintText: 'Old Password',
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      )
                                    : Container(
                                        margin: EdgeInsets.only(
                                            bottom: 12, top: 10),
                                        decoration: BoxDecoration(
                                          color: Color(0xFFf2f2f2),
                                          borderRadius:
                                              BorderRadius.circular(7),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        child: TextFormField(
                                          onChanged: (value) {
                                            oldPassword = value;
                                          },
                                          obscureText: isShow,
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.lock_outline_rounded,
                                              color: primary.color,
                                            ),
                                            suffixIcon: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  isShow = !isShow;
                                                });
                                              },
                                              child: Icon(
                                                isShow == true
                                                    ? Icons.remove_red_eye_sharp
                                                    : Icons.visibility_off,
                                                color: primary.color,
                                              ),
                                            ),
                                            hintText: 'Old Password',
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                passwordMessage != ""
                                    ? Container(
                                        child: Text(
                                          passwordMessage,
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      )
                                    : Container(),
                                passwordMessage != ""
                                    ? Container(
                                        margin: EdgeInsets.only(
                                            bottom: 12, top: 10),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 3, color: Colors.red),
                                          color: Color(0xFFf2f2f2),
                                          borderRadius:
                                              BorderRadius.circular(7),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        child: TextFormField(
                                          onChanged: (value) {
                                            password = value;
                                          },
                                          obscureText: isShow3,
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.lock_outline_rounded,
                                              color: primary.color,
                                            ),
                                            suffixIcon: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  isShow3 = !isShow3;
                                                });
                                              },
                                              child: Icon(
                                                isShow == true
                                                    ? Icons.remove_red_eye_sharp
                                                    : Icons.visibility_off,
                                                color: primary.color,
                                              ),
                                            ),
                                            hintText: 'New Password',
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      )
                                    : Container(
                                        margin: EdgeInsets.only(
                                            bottom: 12, top: 10),
                                        decoration: BoxDecoration(
                                          color: Color(0xFFf2f2f2),
                                          borderRadius:
                                              BorderRadius.circular(7),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        child: TextFormField(
                                          onChanged: (value) {
                                            password = value;
                                          },
                                          obscureText: isShow3,
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.lock_outline_rounded,
                                              color: primary.color,
                                            ),
                                            suffixIcon: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  isShow3 = !isShow3;
                                                });
                                              },
                                              child: Icon(
                                                isShow3 == true
                                                    ? Icons.remove_red_eye_sharp
                                                    : Icons.visibility_off,
                                                color: primary.color,
                                              ),
                                            ),
                                            hintText: 'New Password',
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                confirmPasswordMessage != ""
                                    ? Container(
                                        child: Text(
                                          confirmPasswordMessage,
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      )
                                    : Container(),
                                confirmPasswordMessage != ""
                                    ? Container(
                                        margin:
                                            EdgeInsets.only(bottom: 9, top: 10),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 3, color: Colors.red),
                                          color: Color(0xFFf2f2f2),
                                          borderRadius:
                                              BorderRadius.circular(7),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        child: TextFormField(
                                          onChanged: (value) {
                                            confirmPassword = value;
                                          },
                                          obscureText: isShow2,
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.lock_outline_rounded,
                                              color: primary.color,
                                            ),
                                            suffixIcon: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  isShow2 = !isShow2;
                                                });
                                              },
                                              child: Icon(
                                                isShow2 == true
                                                    ? Icons.visibility
                                                    : Icons
                                                        .visibility_off_rounded,
                                                color: primary.color,
                                              ),
                                            ),
                                            hintText: 'Confirm  Password',
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      )
                                    : Container(
                                        margin:
                                            EdgeInsets.only(bottom: 9, top: 10),
                                        decoration: BoxDecoration(
                                          color: Color(0xFFf2f2f2),
                                          borderRadius:
                                              BorderRadius.circular(7),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        child: TextFormField(
                                          onChanged: (value) {
                                            confirmPassword = value;
                                          },
                                          obscureText: isShow2,
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.lock_outline_rounded,
                                              color: primary.color,
                                            ),
                                            suffixIcon: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  passwordMessage = "";
                                                  oldPasswordMessage = "";
                                                  confirmPasswordMessage = "";
                                                  isShow2 = !isShow2;
                                                });
                                              },
                                              child: Icon(
                                                isShow2 == true
                                                    ? Icons.visibility
                                                    : Icons
                                                        .visibility_off_rounded,
                                                color: primary.color,
                                              ),
                                            ),
                                            hintText: 'Confirm  Password',
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                GestureDetector(
                                  onTap: () {
                                    try {
                                      setState(() {
                                        passwordLoading = true;
                                      });
                                      var data = {
                                        'old_password': oldPassword,
                                        'password': password,
                                        'password_confirmation':
                                            confirmPassword,
                                      };

                                      http
                                          .post(
                                        Uri.parse('$url/update-password'),
                                        body: jsonEncode(data),
                                        headers: _setHeaders(),
                                      )
                                          .then((value) {
                                        if (value.statusCode == 200) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              margin: EdgeInsets.only(
                                                  bottom: MediaQuery.of(context)
                                                          .size
                                                          .height -
                                                      140),
                                              backgroundColor: Colors.cyan,
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              content: Container(
                                                height: 30,
                                                width: 50,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(Icons.verified_sharp,
                                                        color: Colors.white,
                                                        size: 30),
                                                    Container(width: 20),
                                                    Text(
                                                        'Successfully Updated!'),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                          Navigator.pop(context);
                                        } else if (value.statusCode == 422) {
                                          final response =
                                              json.decode(value.body);

                                          Map<String, dynamic> error_list =
                                              response;
                                          error_list.keys.forEach((element) {
                                            if (element == 'password') {
                                              passwordMessage =
                                                  response['password'][0];
                                            }
                                            if (element == 'old_password') {
                                              oldPasswordMessage =
                                                  response['old_password'][0];
                                            }
                                            if (element ==
                                                'password_confirmation') {
                                              confirmPasswordMessage = response[
                                                  'password_confirmation'][0];
                                            }
                                          });
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              margin: EdgeInsets.only(
                                                  bottom: MediaQuery.of(context)
                                                          .size
                                                          .height -
                                                      140),
                                              backgroundColor: Colors.red,
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              content: Container(
                                                height: 30,
                                                width: 50,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(Icons.close,
                                                        color: Colors.white,
                                                        size: 30),
                                                    Container(width: 20),
                                                    Text(
                                                        'Oops Something is went wrong...'),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        } else if (value.statusCode == 401) {
                                          oldPasswordMessage =
                                              "incorrect password";

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              margin: EdgeInsets.only(
                                                  bottom: MediaQuery.of(context)
                                                          .size
                                                          .height -
                                                      110),
                                              backgroundColor: Colors.red,
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              content: Container(
                                                height: 30,
                                                width: 50,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(Icons.close,
                                                        color: Colors.white,
                                                        size: 30),
                                                    Container(width: 20),
                                                    Text(
                                                        'Oops Something is went wrong...'),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        setState(() {
                                          passwordLoading = false;
                                        });
                                      });
                                    } catch (e) {
                                      setState(() {
                                        passwordLoading = false;
                                      });
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          margin: EdgeInsets.only(
                                              bottom: MediaQuery.of(context)
                                                      .size
                                                      .height -
                                                  110),
                                          backgroundColor: Colors.red,
                                          behavior: SnackBarBehavior.floating,
                                          content: Container(
                                            height: 30,
                                            width: 50,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(Icons.close,
                                                    color: Colors.white,
                                                    size: 30),
                                                Container(width: 20),
                                                Text(
                                                    'Oops Something is went wrong...'),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  child: Container(
                                    height: 50,
                                    margin: EdgeInsets.only(
                                        top: 15, left: 35, right: 35),
                                    width:
                                        MediaQuery.of(context).size.width - 70,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: primary.color,
                                    ),
                                    child: Center(
                                      child: passwordLoading == false
                                          ? Text(
                                              'Change Password',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          : CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Text('other'),
            )
          ],
        ),
      ),
    );
  }
}
