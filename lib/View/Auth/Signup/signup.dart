import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:techino_app/Controller/Job_controller.dart';
import 'package:techino_app/Controller/user_controller.dart';
import 'package:techino_app/Model/Jobs_category.dart';

import 'package:techino_app/View/Auth/Login/login.dart';
import 'package:techino_app/Model/user.dart';
import 'package:http/http.dart' as http;
import 'package:techino_app/View/first/jobCategory.dart';
import 'package:techino_app/intro/utilities/styles.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  JobContorller jobContorller = new JobContorller();
  List<JobsCategory> jobsCategory = [];
  @override
  void initState() {
    jobContorller.fetchJobsCategory().then((value) {
      if (this.mounted) {
        setState(() {
          jobsCategory = jobContorller.jobs_category;
        });
      }
    });
  }

  GlobalKey<FormState> globalkey = GlobalKey();
  bool rememberMe = false;
  bool isShow = true;
  bool isLoading = false;
  late String fullNameErrorMessage = "",
      emailMessage = "",
      passwordMessage = "",
      passwordConfirmMessage = "",
      phoneNumberMessage = "",
      jobCategoryMessage = "",
      addressMessage = "";

  late String message;
  bool isShow2 = true;
  List<JobCategory> jobs = [];
  late String _dropDownValue = "Select Your Job Category";
  late String fullName = "",
      email = "",
      jobCategory = "",
      password = "",
      phoneNumber = "",
      address = "",
      passwordConfirm = "";
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      // systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Colors.white, // status bar color
    ));
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
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
                              onChanged: (value) {
                                print(jobContorller.jobs_category.length);
                                this.fullName = value;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  setState(
                                    () {
                                      fullNameErrorMessage =
                                          "Full Name cannot be empty";
                                    },
                                  );
                                } else {
                                  setState(() {
                                    fullNameErrorMessage = "";
                                  });
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
                              onChanged: (value) {
                                this.phoneNumber = value;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  setState(() {});
                                  phoneNumberMessage =
                                      "Phone Number cannot be empty";
                                } else
                                  setState(() {
                                    phoneNumberMessage = "";
                                  });
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
                              onChanged: (value) {
                                this.email = value;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  setState(() {});
                                  emailMessage = "Email cannot be empty";
                                } else
                                  setState(() {
                                    emailMessage = "";
                                  });
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
                          if (emailMessage != "")
                            Container(
                              child: Text(
                                emailMessage,
                                style: TextStyle(color: Colors.red),
                              ),
                            )
                          else
                            SizedBox(height: 7),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            margin: EdgeInsets.only(bottom: 3, top: 3),
                            decoration: BoxDecoration(
                              color: Color(0xFFf2f2f2),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                  enabledBorder: InputBorder.none),

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
                              items: jobsCategory.map(
                                (val) {
                                  return DropdownMenuItem<String>(
                                    value: val.id.toString(),
                                    child: Text(val.name),
                                  );
                                },
                              ).toList(),
                              validator: (value) {
                                if (value == null) {
                                  setState(() {
                                    jobCategoryMessage =
                                        "Job Category  cannot be empty";
                                  });
                                } else {
                                  setState(() {
                                    jobCategoryMessage = "";
                                  });
                                }
                              },
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
                            child: Text(
                              jobCategoryMessage,
                              style: TextStyle(color: Colors.red),
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
                              onChanged: (value) {
                                this.address = value;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  setState(() {
                                    addressMessage = "Address  cannot be empty";
                                  });
                                } else {
                                  setState(() {
                                    addressMessage = "";
                                  });
                                }
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
                                this.password = value;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  setState(() {
                                    passwordMessage =
                                        "Password  cannot be empty";
                                  });
                                } else {
                                  setState(() {
                                    passwordMessage = "";
                                  });
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
                              onChanged: (value) {
                                this.passwordConfirm = value;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  if (value.isEmpty) {
                                    setState(() {
                                      passwordConfirmMessage =
                                          "Confirm Password cannot be empty";
                                    });
                                  }
                                } else {
                                  setState(() {
                                    passwordConfirmMessage = "";
                                  });
                                }
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
                              FocusScope.of(context).unfocus();
                              globalkey.currentState!.validate();

                              if (this.fullName.isNotEmpty &&
                                  this.email.isNotEmpty &&
                                  this.jobCategory.isNotEmpty &&
                                  this.password.isNotEmpty &&
                                  this.address.isNotEmpty &&
                                  this.phoneNumber.isNotEmpty) {
                                globalkey.currentState!.save();
                                setState(() {
                                  this.isLoading = true;
                                });
                                final userStore = User(
                                    fullName: this.fullName,
                                    email: this.email,
                                    jobCategory: this.jobCategory,
                                    password: this.password,
                                    phoneNumber: this.phoneNumber,
                                    passwordconfirmation: this.passwordConfirm,
                                    address: this.address);
                                void store(User userStore) {
                                  http.post(Uri.parse("$url/user-store"),
                                      body: {
                                        'address': userStore.address,
                                        'password_confirmation':
                                            userStore.passwordconfirmation,
                                        'fullName': userStore.fullName,
                                        'email': userStore.email,
                                        'phoneNumber': userStore.phoneNumber,
                                        'password': userStore.password,
                                        'jobCategory': userStore.jobCategory,
                                      }).then((value) {
                                    // print(value.body);
                                    if (value.statusCode == 422) {
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
                                                Text(
                                                    'Oops Something is went wrong...'),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                      final response = json.decode(value.body);

                                      Map<String, dynamic> error_list =
                                          response;
                                      error_list.keys.forEach((element) {
                                        print(element);
                                        if (element == 'email') {
                                          this.emailMessage =
                                              response['email'][0];
                                        }
                                        if (element == 'fullName') {
                                          this.fullNameErrorMessage =
                                              response['fullName'][0];
                                        }

                                        if (element == 'address') {
                                          this.address = response['address'][0];
                                        }
                                        if (element == 'phoneNumber') {
                                          this.phoneNumberMessage =
                                              response['phoneNumber'][0];
                                        }
                                        if (element == 'jobCategory') {
                                          this.jobCategoryMessage =
                                              response['jobCategory'][0];
                                        }
                                        if (element == 'password') {
                                          this.passwordConfirmMessage =
                                              response['password'][0];
                                        }
                                      });

                                      setState(() {
                                        this.isLoading = false;
                                      });
                                    } else if (value.statusCode == 200) {
                                      setState(() {
                                        this.isLoading = false;
                                      });
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          margin: EdgeInsets.only(bottom: 10),
                                          backgroundColor: Color(0xFF000080),
                                          behavior: SnackBarBehavior.floating,
                                          content: Container(
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
                                                    'Successfully Registered '),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    } else {
                                      setState(() {
                                        this.isLoading = false;
                                      });
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          margin: EdgeInsets.only(
                                              left: 10,
                                              right: 10,
                                              bottom: MediaQuery.of(context)
                                                      .size
                                                      .height -
                                                  50),
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
                                                Text(
                                                    'Oops Something is went wrong...'),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                  });
                                }

                                store(userStore);
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
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 18),
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
                                        builder: (BuildContext context) =>
                                            Login(),
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
              this.isLoading == true
                  ? Container(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 80),
                        height: MediaQuery.of(context).size.height + 150,
                        width: MediaQuery.of(context).size.width,
                        color: Color.fromRGBO(0, 0, 151, 0.8),
                        child: Container(
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 4,
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    'Please Wait . . .',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
