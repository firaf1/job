import 'package:flutter/material.dart';
import 'package:techino_app/Controller/Job_controller.dart';
import 'package:techino_app/intro/utilities/styles.dart';

class JobCategory extends StatefulWidget {
   

  @override
  _JobCategoryState createState() => _JobCategoryState();
}

class _JobCategoryState extends State<JobCategory> {
  late int num1;
  JobContorller jobContorller = new JobContorller();
  @override
  void initState() {
    jobContorller.fetchJobsCategory().then((value) => setState(() {
          jobContorller.isLoading = false;
          // jobContorller.jobs_category.addAll(jobContorller.jobs_category);
        
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10, left: 15, bottom: 8),
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          decoration: BoxDecoration(
            color: secondary.color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            "Jobs Categories ",
            style: TextStyle(
              color: primary.color,
              fontSize: 18,
              fontWeight: FontWeight.bold,
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
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          height: MediaQuery.of(context).size.height / 1.4,
          width: double.infinity,
          child: ListView.builder(
              itemCount: jobContorller.jobs_category.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  height: 90,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFbacdcb),
                        blurRadius: 5,
                        spreadRadius: 3,
                        offset: Offset(0, 0.5),
                      )
                    ],
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage('assets/images/jj.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5, top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              jobContorller.jobs_category[index].name,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              jobContorller.jobs_category[index].totalJobs
                                  .toString()
                                  .toLowerCase(),
                              style: TextStyle(
                                color: Color(0xFFbacdcb),
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 120,
                        width: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          color: secondary.color,
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: primary.color,
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
