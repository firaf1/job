import 'package:flutter/material.dart';
import 'package:techino_app/intro/utilities/styles.dart';

class JobCategory extends StatefulWidget {
  const JobCategory({Key? key}) : super(key: key);

  @override
  _JobCategoryState createState() => _JobCategoryState();
}

class _JobCategoryState extends State<JobCategory> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10, left: 15, bottom: 8),
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          decoration: BoxDecoration(
            color: Color(0xFFf9ebda),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            "Jobs Categories ",
            style: TextStyle(
              color: primary.color,
              fontSize: 18,
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
              itemCount: 8,
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
                            image: AssetImage('assets/images/677379.jpg'),
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
                              'Accounting And Finance',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              '41 jobs'.toLowerCase(),
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
