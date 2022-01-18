import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:techino_app/Controller/Job_controller.dart';
import 'package:http/http.dart' as http;
import 'package:techino_app/Model/Jobs.dart';
import 'package:techino_app/Model/Jobs_category.dart';
import 'package:techino_app/View/jobs/Job_lists.dart';

import 'package:techino_app/intro/utilities/styles.dart';
import 'package:techino_app/server_error.dart';

class Main_Jobs_Screen extends StatefulWidget {
  const Main_Jobs_Screen({Key? key}) : super(key: key);

  @override
  _Main_Jobs_ScreenState createState() => _Main_Jobs_ScreenState();
}

class _Main_Jobs_ScreenState extends State<Main_Jobs_Screen> {
  JobContorller jobContorller = new JobContorller();
  late var Active_bar = -1;

  // JobContorller jobcontroller = Get.put(JobContorller());
  @override
  void initState() {
    jobContorller.isinitialized++;

    jobContorller.fetchJobsCategory().then((value) {
      setState(() {
        jobContorller.isLoading = false;
        // jobContorller.jobs_category.addAll(jobContorller.jobs_category);
      });
    });
    try {
      jobContorller.fetchJobs().then((value) {
        setState(() {
          jobContorller.isLoading = false;
          // jobContorller.jobs_category.addAll(jobContorller.jobs_category);
        });
      });
    } catch (e) {
      print('error in main job category fetching');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary.color,
      body: jobContorller.isServerError
          ? ServerError()
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    height: 35,
                    width: (MediaQuery.of(context).size.width) - 20,
                    decoration: BoxDecoration(),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: jobContorller.jobs_category.length,
                        itemBuilder: (BuildContext context, int index) {
                          return index == 0
                              ? Row(
                                  children: [
                                    Container(
                                      height: 30,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            jobContorller.isLoaded = false;
                                            Active_bar = -1;
                                          });
                                          jobContorller
                                              .fetchJobs()
                                              .then((value) {
                                            setState(() {
                                              jobContorller.isLoaded = true;
                                              Active_bar = -1;
                                            });
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 5),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Active_bar == -1
                                                ? Color(0xFF1313bb)
                                                : primary.color,
                                          ),
                                          child: Column(
                                            children: [
                                              Text(
                                                'All',
                                                style: TextStyle(
                                                  color: Active_bar == -1
                                                      ? Colors.white
                                                      : Color(0xFF8888e1),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 30,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            jobContorller.isLoaded = false;
                                          });
                                          jobContorller
                                              .fetchJobs(
                                                  category: jobContorller
                                                      .jobs_category[index].id)
                                              .then((value) => setState(() {
                                                    jobContorller.isLoaded =
                                                        true;

                                                    // jobContorller.jobs_category.addAll(jobContorller.jobs_category);
                                                    Active_bar = index;
                                                  }));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 5),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Active_bar == index
                                                ? Color(0xFF1313bb)
                                                : primary.color,
                                          ),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 7),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    jobContorller
                                                        .jobs_category[index]
                                                        .name,
                                                    style: TextStyle(
                                                      color: Active_bar == index
                                                          ? Colors.white
                                                          : Color(0xFF8888e1),
                                                    ),
                                                  ),
                                                  jobContorller
                                                              .jobs_category[
                                                                  index]
                                                              .totalJobs !=
                                                          0
                                                      ? Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 3),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      5),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        7),
                                                            color: Colors.red,
                                                          ),
                                                          child: Text(
                                                            jobContorller
                                                                .jobs_category[
                                                                    index]
                                                                .totalJobs
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 13),
                                                          ),
                                                        )
                                                      : Container(),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              : Row(
                                  children: [
                                    Container(
                                      height: 30,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            jobContorller.isLoaded = false;
                                          });
                                          jobContorller
                                              .fetchJobs(
                                                  category: jobContorller
                                                      .jobs_category[index].id)
                                              .then((value) => setState(() {
                                                    jobContorller.isLoaded =
                                                        true;

                                                    // jobContorller.jobs_category.addAll(jobContorller.jobs_category);
                                                    Active_bar = index;
                                                  }));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 5),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Active_bar == index
                                                ? Color(0xFF1313bb)
                                                : primary.color,
                                          ),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 7),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    jobContorller
                                                        .jobs_category[index]
                                                        .name,
                                                    style: TextStyle(
                                                      color: Active_bar == index
                                                          ? Colors.white
                                                          : Color(0xFF8888e1),
                                                    ),
                                                  ),
                                                  jobContorller
                                                              .jobs_category[
                                                                  index]
                                                              .totalJobs !=
                                                          0
                                                      ? Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      5),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        7),
                                                            color: Colors.red,
                                                          ),
                                                          child: Text(
                                                            jobContorller
                                                                .jobs_category[
                                                                    index]
                                                                .totalJobs
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 13),
                                                          ),
                                                        )
                                                      : Container(),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                );
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    padding: EdgeInsets.only(top: 4),
                    height: (MediaQuery.of(context).size.height) - 165,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25),
                      ),
                    ),
                    child: jobContorller.isLoaded == false
                        ? SpinKitDoubleBounce(
                            color: primary.color,
                          )
                        : jobContorller.jobs_list.length == 0
                            ? Container(
                                height: double.infinity,
                                width: double.infinity,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 20),
                                      height: 350,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/search.gif'),
                                          )),
                                    ),
                                    Text(
                                      'Jobs is Not Found!',
                                      style: TextStyle(
                                        color: primary.color,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                              )
                            : JobsList(jobs_list: jobContorller.jobs_list),
                  )
                ],
              ),
            ),
    );
  }
}
