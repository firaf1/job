import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:techino_app/Auth/Signup/signup.dart';
import 'package:techino_app/intro/utilities/styles.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

late bool rememberMe;

class _LoginState extends State<Login> with TickerProviderStateMixin {
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
      // appBar: AppBar(
      //   leading: InkWell(
      //     child: Container(
      //       height: 10,
      //       width: 10,
      //       decoration: BoxDecoration(
      //         color: primary.color,
      //         borderRadius: BorderRadius.circular(11),
      //         // boxShadow: [
      //         //   BoxShadow(
      //         //     color: Colors.black,
      //         //     blurRadius: 5,
      //         //     spreadRadius: 5,
      //         //     offset: Offset(0.1, 5),
      //         //   )
      //         // ],
      //       ),
      //       child: Icon(
      //         Icons.arrow_back_rounded,
      //         color: Colors.white,
      //       ),
      //       // color: Colors.red,
      //     ),
      //   ),
      //   systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.red),
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   iconTheme: IconThemeData(
      //     color: Colors.black, //change your color here
      //   ),
      // ),
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
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.black,
                          //     blurRadius: 5,
                          //     spreadRadius: 5,
                          //     offset: Offset(0.1, 5),
                          //   )
                          // ],
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
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 12, top: 10),
                          decoration: BoxDecoration(
                            color: Color(0xFFf2f2f2),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.account_circle_sharp,
                                color: primary.color,
                              ),
                              hintText: 'User Name',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFf2f2f2),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock_outline_rounded,
                                color: primary.color,
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
                        Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: primary.color,
                          ),
                          child: Center(
                              child: Text(
                            'Sign in',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
