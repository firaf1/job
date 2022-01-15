import 'package:flutter/material.dart';
import 'package:techino_app/intro/utilities/styles.dart';

class Scholarship extends StatefulWidget {
  const Scholarship({Key? key}) : super(key: key);

  @override
  _ScholarshipState createState() => _ScholarshipState();
}

class _ScholarshipState extends State<Scholarship> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primary.color,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  height: 90,
                  width: (MediaQuery.of(context).size.width) - 20,
                  decoration: BoxDecoration(),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Color(0xFF1313bb),
                                  borderRadius: BorderRadius.circular(15)),
                              height: 60,
                              width: 80,
                              child: Center(
                                child: Icon(Icons.account_balance,
                                    color: Colors.white),
                              ),
                            ),
                            Text(
                              'Student',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )
                          ],
                        );
                      })),
              Container(
                padding: EdgeInsets.only(top: 10),
                height: (MediaQuery.of(context).size.height) - 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                        ),
                        color: secondary.color,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: (MediaQuery.of(context).size.width) - 80,
                            padding: EdgeInsets.all(10),
                            height: 100,
                            child: Text(
                              "Whether you’re seeking college freshman scholarships or other forms of financial aid for you’re seeking college freshman scholarships or other forms of financial aid for college, Davenport is here for you.",
                              style: TextStyle(color: Colors.black45),
                              maxLines: 4,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                          Container(
                            width: 60,
                            height: 100,
                            decoration: BoxDecoration(
                              color: primary.color,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(25),
                              ),
                            ),
                            child: Icon(Icons.arrow_forward_ios_rounded,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
