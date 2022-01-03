import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:techino_app/Controller/Job_controller.dart';
import 'package:http/http.dart' as http;
import 'package:techino_app/Model/Jobs.dart';
import 'package:techino_app/Model/Jobs_category.dart';
import 'package:techino_app/View/jobs/Job_lists.dart';

import 'package:techino_app/intro/utilities/styles.dart';

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

    jobContorller.fetchJobsCategory();
    jobContorller.fetchJobs().then((value) => setState(() {
          jobContorller.isLoading = false;
          // jobContorller.jobs_category.addAll(jobContorller.jobs_category);
        }));
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf1f1f1),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(157, 157, 157, 1),
                    offset: Offset(0, 0.5),
                    spreadRadius: 5,
                    blurRadius: 8,
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                )),
            width: double.infinity,
            height: 40,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: jobContorller.jobs_category.length,
                itemBuilder: (BuildContext context, int index) {
                  return index == 0
                      ? Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  jobContorller.isLoaded = false;
                                  Active_bar = -1;
                                });
                                jobContorller.fetchJobs();
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                margin: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Active_bar == -1
                                      ? secondary.color
                                      : Color.fromRGBO(255, 255, 255, 0),
                                ),
                                child: Center(
                                  child: Text(
                                    "All",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Active_bar == -1
                                          ? primary.color
                                          : Colors.black38,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  jobContorller.isLoaded = false;
                                });
                                jobContorller
                                    .fetchJobs(
                                        category: jobContorller
                                            .jobs_category[index].id)
                                    .then((value) => setState(() {
                                          jobContorller.isLoaded = true;

                                          // jobContorller.jobs_category.addAll(jobContorller.jobs_category);
                                          Active_bar = index;
                                        }));
                              },
                              child: Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    margin: EdgeInsets.symmetric(),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: Active_bar == index
                                          ? secondary.color
                                          : Color.fromRGBO(255, 255, 255, 0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        jobContorller.jobs_category[index].name,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Active_bar == index
                                              ? primary.color
                                              : Colors.black38,
                                        ),
                                      ),
                                    ),
                                  ),
                                  jobContorller
                                              .jobs_category[index].totalJobs !=
                                          0
                                      ? Container(
                                          margin: EdgeInsets.only(left: 10),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            color: Colors.red,
                                          ),
                                          child: Text(
                                            jobContorller
                                                .jobs_category[index].totalJobs
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13),
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),
                            )
                          ],
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              jobContorller.isLoaded = false;
                            });
                            jobContorller
                                .fetchJobs(
                                    category:
                                        jobContorller.jobs_category[index].id)
                                .then((value) => setState(() {
                                      jobContorller.isLoaded = true;

                                      // jobContorller.jobs_category.addAll(jobContorller.jobs_category);
                                      Active_bar = index;
                                    }));
                          },
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                margin: EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Active_bar == index
                                      ? secondary.color
                                      : Color.fromRGBO(255, 255, 255, 0),
                                ),
                                child: Center(
                                  child: Text(
                                    jobContorller.jobs_category[index].name,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Active_bar == index
                                          ? primary.color
                                          : Colors.black38,
                                    ),
                                  ),
                                ),
                              ),
                              jobContorller.jobs_category[index].totalJobs != 0
                                  ? Container(
                                      margin: EdgeInsets.only(left: 10),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: Colors.red,
                                      ),
                                      child: Text(
                                        jobContorller
                                            .jobs_category[index].totalJobs
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 13),
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        );
                  // ignore: dead_code
                }),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.37,
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
                              margin: EdgeInsets.only(top: 15),
                              height: 350,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/search.gif'),
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
    );
  }
}
