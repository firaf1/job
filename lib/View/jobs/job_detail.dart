import 'package:flutter/material.dart';
import 'package:techino_app/Model/Jobs.dart';
import 'package:techino_app/intro/utilities/styles.dart';

class JobDetail extends StatefulWidget {
  List<Jobs> jobs_list = [];
  var title,
      description,
      salary,
      address,
      category,
      date,
      imagePath,
      companyName;
  JobDetail(
      {required this.title,
      required this.description,
      required this.salary,
      required this.address,
      required this.category,
      required this.companyName,
      required this.imagePath,
      required this.date});

  @override
  _JobDetailState createState() => _JobDetailState();
}

@override
void initState() {
  print('initialized');
}

class _JobDetailState extends State<JobDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFefefef),
      appBar: AppBar(
        backgroundColor: primary.color,
        title: Text(widget.companyName),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(157, 157, 157, 1),
                      offset: Offset(0, 0.5),
                      spreadRadius: 5,
                      blurRadius: 8,
                    )
                  ],
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      width: 120,
                      height: 90,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xfffe1e1e1),
                            offset: Offset(0, 0.5),
                            spreadRadius: 5,
                            blurRadius: 8,
                          )
                        ],
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(widget.imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          width: 182,
                          child: Text(
                            widget.category,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                          ),
                        ),
                        Container(
                          child: Text(
                            widget.address,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black38,
                            ),
                          ),
                        ),
                        // Container(
                        //   child: Text(
                        //     widget.address,
                        //     style: TextStyle(
                        //       fontSize: 10,
                        //       color: Colors.black45,
                        //     ),
                        //   ),
                        // )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 10,
                  left: 10,
                ),
                child: Text(
                  'Description About job',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xfffe1e1e1),
                      offset: Offset(0, 0.5),
                      spreadRadius: 5,
                      blurRadius: 8,
                    )
                  ],
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          width: 34,
                          height: 34,
                          decoration: BoxDecoration(
                            color: primary.color,
                            borderRadius: BorderRadius.circular(17),
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 7),
                          child: Text(
                            widget.title,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 10, left: 20, right: 20, bottom: 20),
                      height: 1,
                      color: Colors.black54,
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text(
                                  "Date",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                child: Text(widget.date),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                          height: 1,
                          color: Color(0xFFFededed),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text(
                                  "Salary",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                child: Text('${widget.salary} -ETB'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 10, right: 10),
                      child: Text(widget.description),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
