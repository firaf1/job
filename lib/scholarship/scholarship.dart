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
                margin: EdgeInsets.only(top: 10, bottom: 10),
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
                    }),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                padding: EdgeInsets.only(top: 10, bottom: 8),
                height: (MediaQuery.of(context).size.height) - 220,
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
                    return Stack(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(25),
                                  bottomLeft: Radius.circular(25),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: secondary.color,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(25),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 70,
                                          height: 110,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    "assets/images/my.jpg")),
                                            color: primary.color,
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(25),
                                              bottomLeft: Radius.circular(25),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          color: secondary.color,
                                          child: Text(
                                            'Ethiopia',
                                            style: TextStyle(
                                              color: primary.color,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(25),
                                          ),
                                          color: secondary.color,
                                        ),
                                        width: (MediaQuery.of(context)
                                                .size
                                                .width) -
                                            90,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 8),
                                        height: 110,
                                        child: Column(
                                          children: [
                                            Container(
                                              child: Text(
                                                "Some title about Scholarship",
                                                style: TextStyle(
                                                  color: primary.color,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              ),
                                            ),
                                            Text(
                                              "Whether you’re seeking college freshman scholarships or other forms of financial aid for you’re seeking college freshman scholarships or other forms of financial aid for college, Davenport is here for you.",
                                              style: TextStyle(
                                                  color: Colors.black45),
                                              maxLines: 3,
                                              overflow: TextOverflow.clip,
                                            ),
                                            Container(
                                              color: secondary.color,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal: 5,
                                                    ),
                                                    decoration: BoxDecoration(
                                                        color: Colors
                                                            .pink.shade100,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Text('today'),
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal: 5,
                                                    ),
                                                    decoration: BoxDecoration(
                                                        color: Colors.blue,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Text('Student',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white)),
                                                  ),
                                                ],
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
                          ],
                        ),
                      ],
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
