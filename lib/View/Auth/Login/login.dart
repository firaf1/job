import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:techino_app/View/Auth/Signup/signup.dart';
import 'package:techino_app/intro/utilities/styles.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  GlobalKey<FormState> globalkey = GlobalKey();
  late bool rememberMe;
  bool isLoading = false;
  late String password = "";
  late String userName = "";
  bool isHide = true;
  String passwordErrorMessage = "";
  String emailErrorMessage = "";
  @override
  void initState() {
    setState(() {
      rememberMe = true;
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Colors.white, // status bar color
    ));

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
                          Container(
                            child: Text(
                              emailErrorMessage,
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          emailErrorMessage.isEmpty
                              ? Container(
                                  margin: EdgeInsets.only(bottom: 12, top: 10),
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
                                  margin: EdgeInsets.only(bottom: 12, top: 10),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFf2f2f2),
                                    border:
                                        Border.all(width: 2, color: Colors.red),
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
                            child: Text(
                              passwordErrorMessage,
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          this.passwordErrorMessage.isEmpty
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
                                    globalkey.currentState!.validate();
                                    if (userName.isNotEmpty &&
                                        password.isNotEmpty) {
                                      setState(() {
                                        this.isLoading = true;
                                      });
                                      print(this.isLoading);
                                      http.post(Uri.parse("$url/login-request"),
                                          body: {
                                            'email': userName,
                                            'password': password,
                                          }).then((value) {
                                        print(value.body);
                                        setState(() {
                                          this.isLoading = false;
                                        });
                                        print(this.isLoading);
                                      });
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
