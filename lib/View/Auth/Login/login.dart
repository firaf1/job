import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:techino_app/View/Auth/Signup/signup.dart';
import 'package:techino_app/intro/utilities/styles.dart';
import 'package:http/http.dart' as http;
import 'package:techino_app/mainScreen.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  GlobalKey<FormState> globalkey = GlobalKey();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late bool rememberMe;
  bool isLoading = false;
  late String password = "";
  late String userName = "";
  late bool isWrongCredential = false;
  bool isHide = true;
  String passwordErrorMessage = "";
  String emailErrorMessage = "";
  @override
  void initState() {
    setState(() {
      rememberMe = true;
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.white, // navigation bar color
        statusBarColor: Colors.white, // status bar color
      ));
    });
    // TODO: implement initState
    super.initState();
  }

  addToSharedPre(response) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('token', response['token']);
      prefs.setString('job', response['job']);
      prefs.setString('address', response['address']);
      prefs.setString('phoneNumber', response['phoneNumber']);
      prefs.setString('email', response['email']);
      prefs.setString('name', response['name']);
      prefs.setString('image_path', response['image_path']);
      prefs.setInt('total_jobs', response['total_jobs']);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height - 140),
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
              Text('Successfully Loged in '),
            ],
          ),
        ),
      ),
    );
    Navigator.pushReplacement(
        context, new MaterialPageRoute(builder: (context) => new MainScreen()));
    // print(prefs.getString('token'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25),
                    child: Text(
                      'Login To Your Account',
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
              Column(
                children: [
                  Container(
                    height: 200,
                    width: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/login.gif'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(7),
                    padding: EdgeInsets.all(15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 15,
                          spreadRadius: 5,
                          offset: Offset(0.1, 5),
                        )
                      ],
                    ),
                    child: Form(
                      key: globalkey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          this.isWrongCredential
                              ? Center(
                                  child: Container(
                                    child: Text(
                                      "The provided credentials is incorrect",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                )
                              : Container(
                                  child: Text(
                                    emailErrorMessage,
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                          emailErrorMessage.isEmpty &&
                                  this.isWrongCredential == false
                              ? Container(
                                  margin: EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFf2f2f2),
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: TextFormField(
                                    style: TextStyle(color: primary.color),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        if (value.isEmpty) {
                                          setState(() {
                                            emailErrorMessage =
                                                " Email cannot be empty";
                                          });
                                        }
                                      } else {
                                        setState(() {
                                          emailErrorMessage = "";
                                        });
                                      }
                                    },
                                    onChanged: (value) {
                                      userName = value;
                                    },
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.account_circle_sharp,
                                        color: primary.color,
                                      ),
                                      hintText: 'Email',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                )
                              : Container(
                                  margin: EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFf2f2f2),
                                    border: Border.all(
                                      width: 2,
                                      color: Colors.red,
                                    ),
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: TextFormField(
                                    style: TextStyle(color: primary.color),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        if (value.isEmpty) {
                                          setState(() {
                                            emailErrorMessage =
                                                " Email cannot be empty";
                                          });
                                        }
                                      } else {
                                        setState(() {
                                          emailErrorMessage = "";
                                        });
                                      }
                                    },
                                    onChanged: (value) {
                                      userName = value;
                                    },
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.account_circle_sharp,
                                        color: Colors.red,
                                      ),
                                      hintText: 'Email',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                          Container(
                            margin: EdgeInsets.only(bottom: 1),
                            child: Text(
                              passwordErrorMessage,
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          this.passwordErrorMessage.isEmpty &&
                                  this.isWrongCredential == false
                              ? Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFFf2f2f2),
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        if (value.isEmpty) {
                                          setState(() {
                                            passwordErrorMessage =
                                                " password cannot be empty";
                                          });
                                        }
                                      } else {
                                        setState(() {
                                          passwordErrorMessage = "";
                                        });
                                      }
                                    },
                                    onChanged: (value) {
                                      password = value;
                                    },
                                    obscureText: this.isHide,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                          Icons.lock_outline_rounded,
                                          color: primary.color),
                                      suffix: GestureDetector(
                                        onTap: () {
                                          setState(
                                            () {
                                              this.isHide = !this.isHide;
                                            },
                                          );
                                        },
                                        child: Icon(
                                          this.isHide == true
                                              ? Icons.visibility
                                              : Icons.visibility_off_rounded,
                                          color: primary.color,
                                        ),
                                      ),
                                      hintText: 'Password',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(width: 2, color: Colors.red),
                                    color: Color(0xFFf2f2f2),
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        if (value.isEmpty) {
                                          setState(() {
                                            passwordErrorMessage =
                                                " password cannot be empty";
                                          });
                                        }
                                      } else {
                                        setState(() {
                                          passwordErrorMessage = "";
                                        });
                                      }
                                    },
                                    onChanged: (value) {
                                      password = value;
                                    },
                                    obscureText: this.isHide,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                          Icons.lock_outline_rounded,
                                          color: Colors.red),
                                      suffix: GestureDetector(
                                        onTap: () {
                                          setState(
                                            () {
                                              this.isHide = !this.isHide;
                                            },
                                          );
                                        },
                                        child: Icon(
                                          this.isHide == true
                                              ? Icons.visibility
                                              : Icons.visibility_off_rounded,
                                          color: Colors.red,
                                        ),
                                      ),
                                      hintText: 'Password',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      activeColor: primary.color,
                                      value: rememberMe,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          rememberMe = !rememberMe;
                                        });
                                      },
                                    ),
                                    SizedBox(height: 8),
                                    Text('Remember Me'),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 15),
                                  child: Text(
                                    'Forget Password ?',
                                    style: TextStyle(
                                      color: primary.color,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          this.isLoading == false
                              ? InkWell(
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                    globalkey.currentState!.validate();
                                    if (userName.isNotEmpty &&
                                        password.isNotEmpty) {
                                      setState(() {
                                        this.isLoading = true;
                                        this.isWrongCredential = false;
                                      });
                                      print(this.isLoading);
                                      http.post(Uri.parse("$url/login-request"),
                                          body: {
                                            'email': userName,
                                            'password': password,
                                          }).then((value) {
                                        setState(() {
                                          this.isLoading = false;
                                        });
                                        if (value.statusCode == 403) {
                                          this.userName = "";
                                          this.password = "";
                                          if (!this.isWrongCredential) {
                                            setState(() {
                                              this.isWrongCredential = true;
                                            });
                                          }
                                          setState(() {
                                            this.emailErrorMessage = "";
                                          });
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              margin:
                                                  EdgeInsets.only(bottom: 10),
                                              backgroundColor: Colors.red,
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              content: Container(
                                                width: 50,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(Icons.close,
                                                        color: Colors.white,
                                                        size: 30),
                                                    Text(
                                                        'The provided credentials is incorrect...'),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        } else if (value.statusCode == 200) {
                                          final respons =
                                              json.decode(value.body);
                                          addToSharedPre(respons);
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              margin:
                                                  EdgeInsets.only(bottom: 10),
                                              backgroundColor: Colors.red,
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              content: Container(
                                                width: 50,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(Icons.close,
                                                        color: Colors.white,
                                                        size: 30),
                                                    Text('Server Error....'),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                      });
                                    } else {
                                      this.isWrongCredential = false;
                                    }
                                  },
                                  child: Container(
                                    height: 50,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: primary.color,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Sign in',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(
                                  height: 50,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Color.fromRGBO(0, 0, 150, 0.8),
                                  ),
                                  child: Center(
                                      child: CircularProgressIndicator(
                                          color: Colors.white)),
                                ),
                          Center(
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 18),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Already have not account?',
                                      style: TextStyle(
                                        fontSize: 15,
                                      )),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              Signup(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(left: 8),
                                      child: Text(
                                        "Sign Up",
                                        style: TextStyle(
                                          color: primary.color,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
