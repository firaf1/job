import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techino_app/Controller/Job_controller.dart';
import 'package:techino_app/Controller/user_controller.dart';
import 'package:techino_app/Model/Jobs_category.dart';
import 'package:techino_app/intro/utilities/styles.dart';
import 'package:http/http.dart' as http;
import 'package:techino_app/mainScreen.dart';

class CategoryUpdate extends StatefulWidget {
  const CategoryUpdate({Key? key}) : super(key: key);

  @override
  _CategoryUpdateState createState() => _CategoryUpdateState();
}

class _CategoryUpdateState extends State<CategoryUpdate> {
  late String toke = "";
  UserController userController = new UserController();
  bool categoryLoading = false;
  JobContorller jobContorller = new JobContorller();
  List<JobsCategory> jobsCategory = [];
  late String jobCategory = "";
  @override
  void initState() {
    userController.getSharedPrefs().then((value) {
      toke = userController.accessToken;
    });

    jobContorller.fetchJobsCategory().then((value) {
      if (this.mounted) {
        setState(() {
          jobsCategory = jobContorller.jobs_category;
        });
      }
    });
  }

  var jobCategoryMessage = "";
  late String _dropDownValue = "Select Your Job Category";

  updatePre(value, cate) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userController.job = cate;
      prefs.setString('job', cate).then((value) {
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

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${userController.accessToken}'
      };

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
                    "Update Job Category",
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
                  jobCategoryMessage != ""
                      ? Container(
                          margin: EdgeInsets.only(top: 6, bottom: 10),
                          child: Text(
                            jobCategoryMessage,
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        )
                      : Container(),
                  jobCategoryMessage == ""
                      ? Container(
                          margin: EdgeInsets.symmetric(horizontal: 7),
                          height: 60,
                          decoration: BoxDecoration(),
                          child: Container(
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
                        )
                      : Container(
                          margin: EdgeInsets.symmetric(horizontal: 7),
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 3, color: Colors.red),
                          ),
                          child: Container(
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
                        ),
                  GestureDetector(
                    onTap: () {
                      print(toke);
                      setState(() {
                        categoryLoading = true;
                      });
                      var data = {'category_id': jobCategory};

                      http
                          .post(
                        Uri.parse('$url/update-job-category'),
                        body: jsonEncode(data),
                        headers: _setHeaders(),
                      )
                          .then((value) {
                        if (value.statusCode == 200) {
                          final response = json.decode(value.body);

                          updatePre(jobCategory, response['message']);
                          setState(() {
                            categoryLoading = false;
                          });
                        } else if (value.statusCode == 422) {
                          final response = json.decode(value.body);
                          jobCategoryMessage = response['category_id'][0];
                          setState(() {
                            categoryLoading = false;
                          });
                        }
                        setState(() {
                          categoryLoading = false;
                        });
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
                        child: categoryLoading
                            ? CircularProgressIndicator(color: Colors.white)
                            : Text(
                                'Change Job',
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
            ),
            Container(
              child: Text(
                jobCategoryMessage,
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
