import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:techino_app/Auth/Login/login.dart';

import 'package:techino_app/intro/utilities/styles.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  GlobalKey<FormState> globalkey = GlobalKey();
  bool isShow = true;
  late String fullNameErrorMessage = "",
      emailMessage = "",
      passwordMessage = "",
      passwordConfirmMessage = "",
      phoneNumberMessage = "",
      jobCategoryMessage = "",
      addressMessage = "";

  late String message;
  bool isShow2 = true;
  List<String> jobs = [
    'Accounting',
    'Software',
    'Doctor',
    'Something else'
  ]; // Option 2
  late String _dropDownValue = "Select Your Job Category";
  late String fullName, email, jobCategory, password, phoneNumber, address;
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
                        // color: Colors.red,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25),
                    child: Text(
                      'Create Your  Account',
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
              SizedBox(
                height: 8,
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
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: globalkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          color: Color(0xFFf2f2f2),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              setState(
                                () {
                                  fullNameErrorMessage =
                                      "Full Name cannot be empty";
                                },
                              );
                            } else {
                              fullNameErrorMessage = "";
                            }
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.account_circle_sharp,
                              color: primary.color,
                            ),
                            hintText: 'Full Name',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          fullNameErrorMessage,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 3, top: 3),
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
                              setState(() {});
                              phoneNumberMessage =
                                  "Phone Number cannot be empty";
                            } else
                              phoneNumberMessage = "";
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.add_ic_call,
                              color: primary.color,
                            ),
                            hintText: 'Phone Number',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      
                      Container(
                        child: Text(
                          phoneNumberMessage,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 3, top: 3),
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
                              setState(() {});
                              emailMessage = "Email cannot be empty";
                            } else
                              emailMessage = "";
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email,
                              color: primary.color,
                            ),
                            hintText: 'email',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          emailMessage,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        margin: EdgeInsets.only(bottom: 3, top: 3),
                        decoration: BoxDecoration(
                          color: Color(0xFFf2f2f2),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: DropdownButtonFormField(
                          decoration:
                              InputDecoration(enabledBorder: InputBorder.none),
                          // ignore: unnecessary_null_comparison
                          hint: _dropDownValue == null
                              ? Text('Dropdown')
                              : Text(
                                  _dropDownValue,
                                  style: TextStyle(color: primary.color),
                                ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: primary.color),
                          items: jobs.map(
                            (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          validator: (vakye) {},
                          onChanged: (val) {
                            setState(
                              () {
                                _dropDownValue = val.toString();
                                jobCategory = _dropDownValue;
                              },
                            );
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 3, top: 10),
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
                              setState(() {
                                addressMessage = "Address  cannot be empty";
                              });
                            } else {}
                          },
                          onChanged: (value) {
                            print(value);
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.location_on_sharp,
                              color: primary.color,
                            ),
                            hintText: 'Address',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          addressMessage,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
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
                          onChanged: (value) {
                            password = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              setState(() {
                                passwordMessage = "Password  cannot be empty";
                              });
                            } else {
                              return passwordMessage = "";
                            }
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
                            hintText: 'Password',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          passwordMessage,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 9, top: 10),
                        decoration: BoxDecoration(
                          color: Color(0xFFf2f2f2),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty ) {
                              if(password .isEmpty)
                              if (value.isEmpty) {
                                setState(() {
                                  passwordConfirmMessage =
                                      "Confirm Password cannot be empty";
                                });
                              } else {
                                setState(() {
                                  passwordConfirmMessage =
                                      "Password is not confirmed";
                                });
                              }
                            } else {}
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
                                    : Icons.visibility_off_rounded,
                                color: primary.color,
                              ),
                            ),
                            hintText: 'Confirm  Password',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          passwordConfirmMessage,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20, bottom: 5),
                        child: Row(
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
                            Text('I Agree to terms and privacy policy'),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (globalkey.currentState!.validate()) {
                            globalkey.currentState!.save();
                            if (fullNameErrorMessage == "" &&
                                phoneNumberMessage == "" &&
                                emailMessage == "" &&
                                addressMessage == "" &&
                                passwordMessage == "" &&
                                passwordConfirmMessage == "") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                            }
                          }
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: primary.color,
                          ),
                          child: Center(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Already have an account?',
                                style: TextStyle(
                                  fontSize: 15,
                                )),
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) => Login(),
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 8),
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                    color: primary.color,
                                    fontWeight: FontWeight.bold,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
