import 'package:flutter/material.dart';
import 'package:techino_app/Model/Jobs.dart';
import 'package:techino_app/intro/utilities/styles.dart';

class JobsList extends StatefulWidget {
  List<Jobs> jobs_list = [];
  JobsList({required this.jobs_list});

  @override
  _JobsListState createState() => _JobsListState();
}

class _JobsListState extends State<JobsList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: widget.jobs_list.length,
        itemBuilder: (BuildContext context, int index1) {
          return Container(
            margin: EdgeInsets.only(bottom: 5, top: 5, left: 10, right: 10),
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              // boxShadow: [
              //   BoxShadow(
              //     color: Color.fromRGBO(157, 157, 157, 1),
              //     offset: Offset(0, 0.5),
              //     spreadRadius: 5,
              //     blurRadius: 8,
              //   )
              // ],
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 7),
                          width: 65,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: primary.color,
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          margin: EdgeInsets.only(top: 13, left: 8),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  widget.jobs_list[index1].imagePath),
                              fit: BoxFit.cover,
                            ),
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 6, left: 10),
                      padding:
                          EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xFFf1f1f1),
                      ),
                      child: Text(
                        widget.jobs_list[index1].createdAt,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 150,
                        child: Text(
                          widget.jobs_list[index1].description,
                          // "description ",
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black45,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 2, right: 15),
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 3),
                            decoration: BoxDecoration(
                                color: secondary.color,
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              widget.jobs_list[index1].categoryName,
                              style: TextStyle(
                                color: primary.color,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 2),
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            decoration: BoxDecoration(
                                color: Colors.pink.shade100,
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              "${widget.jobs_list[index1].salary} -ETB",
                              style:
                                  TextStyle(color: primary.color, fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 6),
                            padding: EdgeInsets.symmetric(
                                vertical: 2, horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xFFf1f1f1),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on_rounded,
                                  color: primary.color,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.only(bottom: 3),
                                  child: Text(
                                    widget.jobs_list[index1].address,
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
