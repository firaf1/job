import 'package:flutter/material.dart';
import 'package:techino_app/Controller/Job_controller.dart';
import 'package:techino_app/Model/Jobs_category.dart';
import 'package:techino_app/Model/companies.dart';
import 'package:techino_app/View/first/jobCategory.dart';
import 'package:techino_app/intro/utilities/styles.dart';

class CompaniesList extends StatefulWidget {
  List<Companies> comp_list = [];
  List<JobsCategory> cat_list = [];
  CompaniesList({required this.comp_list, required this.cat_list});

  @override
  _CompaniesListState createState() => _CompaniesListState();
}

class _CompaniesListState extends State<CompaniesList>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.only(left: 15, top: 10),
            color: Colors.white,
            height: 40,
            child: TabBar(
              unselectedLabelColor: Color(0xFF6a6a6a),
              indicator: BoxDecoration(
                color: secondary.color,
                borderRadius: BorderRadius.circular(8),
              ),
              isScrollable: true,
              controller: tabController,
              labelPadding: EdgeInsets.only(left: 20, right: 20),
              labelColor: primary.color,
              tabs: [
                Container(
                  height: 30,
                  child: Tab(
                    child: Text(
                      'Companies',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // text: 'IT',
                  ),
                ),
                Container(
                  child: Tab(
                    text: 'Categories',
                  ),
                ),
              ],
            ),
          ),
        ),

//Horzontal Scrol View

        Container(
          margin: EdgeInsets.only(bottom: 20, top: 10),
          decoration: BoxDecoration(),
          height: 230,
          child: TabBarView(
            controller: tabController,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                ),
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.comp_list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFbacdcb),
                              blurRadius: 5,
                              spreadRadius: 3,
                              offset: Offset(0, 0.5),
                            )
                          ],
                        ),
                        margin: EdgeInsets.only(
                            left: 10, right: 10, top: 10, bottom: 10),
                        width: 220,
                        height: 250,
                        padding: EdgeInsets.only(left: 10, top: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: AlignmentDirectional.topEnd,
                              children: [
                                Container(
                                  height: 130,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xFFbacdcb),
                                        blurRadius: 3,
                                        spreadRadius: 2,
                                        offset: Offset(0, 0.5),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        widget.comp_list[index].imagePath,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 30,
                                  width: 30,
                                  margin: EdgeInsets.only(right: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: IconButton(
                                    focusColor: Colors.red,
                                    icon: Icon(Icons.favorite),
                                    color: Colors.red,
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                widget.comp_list[index].name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10, top: 5),
                              child: Text(
                                "${widget.comp_list[index].totalJobs} Jobs",
                                style: TextStyle(
                                  color: Color(0xFFbacdcb),
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ));
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                ),
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.comp_list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFbacdcb),
                              blurRadius: 5,
                              spreadRadius: 3,
                              offset: Offset(0, 0.5),
                            )
                          ],
                        ),
                        margin: EdgeInsets.only(
                            left: 10, right: 10, top: 10, bottom: 10),
                        width: 220,
                        height: 250,
                        padding: EdgeInsets.only(left: 10, top: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: AlignmentDirectional.topEnd,
                              children: [
                                Container(
                                  height: 130,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xFFbacdcb),
                                        blurRadius: 3,
                                        spreadRadius: 2,
                                        offset: Offset(0, 0.5),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        widget.cat_list[index].imagePath,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 30,
                                  width: 30,
                                  margin: EdgeInsets.only(right: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: IconButton(
                                    focusColor: Colors.red,
                                    icon: Icon(Icons.favorite),
                                    color: Colors.red,
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                widget.comp_list[index].name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10, top: 5),
                              child: Text(
                                "${widget.comp_list[index].totalJobs} Jobs",
                                style: TextStyle(
                                  color: Color(0xFFbacdcb),
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ));
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
