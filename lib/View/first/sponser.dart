import 'dart:math';
import 'package:flutter/material.dart';
import 'package:techino_app/Model/random_ad.dart';

class Sponser extends StatelessWidget {
  List<RandomAd> ads = [];
  Sponser({required this.ads});
  List<Color> colors = [
    Color(0xFFF5B7B1),
    Color(0xFFD2B4DE),
    Color(0xFFABEBC6),
    Color(0xFFFAD7A0),
  ];
  List<Color> textColor = [
    Color(0xFFEC7063),
    Color(0xFF6C3483),
    Color(0xFF17A589),
    Color(0xFFD68910),
  ];
  Random random = new Random();
  @override
  Widget build(BuildContext context) {
    int num1 = random.nextInt(3);
    return Container(
      width: double.infinity,
      height: 140,
      child: ListView.builder(
          itemCount: ads.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(
                left: (MediaQuery.of(context).size.width -
                        (MediaQuery.of(context).size.width / 1.1)) /
                    2,
                right: (MediaQuery.of(context).size.width -
                        (MediaQuery.of(context).size.width / 1.1)) /
                    2,
              ),
              height: 120,
              decoration: BoxDecoration(
                color: colors[num1],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15, top: 10, right: 15),
                    child: Text(
                      ads[index].title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: textColor[num1],
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  ads[index].slogan,
                                  style: TextStyle(
                                    color: Color(0xFF9f9f9f),
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 18),
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  'Details',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 80,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                ads[index].imagePath,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
