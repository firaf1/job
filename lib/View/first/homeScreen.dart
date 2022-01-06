import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:techino_app/Controller/Job_controller.dart';
import 'package:techino_app/Controller/ad_controller.dart';
import 'package:techino_app/View/first/Category_And_Companies_List.dart';

import 'package:techino_app/View/first/sponser.dart';
import 'package:techino_app/View/jobs/Job_lists.dart';
import 'package:techino_app/intro/utilities/styles.dart';
import 'package:techino_app/server_error.dart';

import 'Top_nav_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  JobContorller jobContorller = new JobContorller();
  AdController adController = new AdController();
  bool serverError = false;
  @override
  void initState() {
    adController.fetchAds().then((value) => setState(() {
          print(adController.ad.length);
        }));
    jobContorller.fetchJobsCategory();
    jobContorller.fetchJobs(category: -1).then((value) => setState(() {
          print(adController.ad.length);
        }));
    jobContorller.companiesFetch().then((value) => setState(() {
          jobContorller.isLoading = false;
          print('${jobContorller.isServerError} print');
          // jobContorller.jobs_category.addAll(jobContorller.jobs_category);
          // print(jobContorller.jobs_category.length);
        }));
    print(adController.ad.length);
  }

  Future onRefreshWidget() async {
    adController.fetchAds();

    jobContorller.fetchJobsCategory();
    jobContorller.companiesFetch().then((value) => setState(() {
          jobContorller.isLoading = false;
          // jobContorller.jobs_category.addAll(jobContorller.jobs_category);
          // print(jobContorller.jobs_category.length);
        }));
  }

  @override
  Widget build(BuildContext context) {
    return jobContorller.isLoading
        ? SpinKitThreeBounce(color: primary.color)
        : jobContorller.isServerError
            ? ServerError()
            : RefreshIndicator(
                onRefresh: () => onRefreshWidget(),
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Top_Card(),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            'Sponsors',
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Sponser(
                          ads: adController.ad,
                        ),

                        //Ad Card

                        CompaniesList(
                            comp_list: jobContorller.companies_list,
                            cat_list: jobContorller.jobs_category),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(top: 10, left: 15, bottom: 8),
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 20),
                              decoration: BoxDecoration(
                                color: secondary.color,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                "Jobs You May Be Interested",
                                style: TextStyle(
                                  color: primary.color,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            Container(
                              // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                              margin: EdgeInsets.only(bottom: 15),
                              padding: EdgeInsets.symmetric(
                                horizontal: 5,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xFFeeeef5),
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFFFf3f3f3),
                                    offset: Offset(0, 0.5),
                                    spreadRadius: 5,
                                    blurRadius: 8,
                                  )
                                ],
                              ),
                              height: MediaQuery.of(context).size.height / 1.4,
                              width: double.infinity,
                              child:
                                  JobsList(jobs_list: jobContorller.jobs_list),
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
