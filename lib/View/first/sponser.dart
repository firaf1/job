import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:techino_app/Model/random_ad.dart';
import 'package:techino_app/Controller/ad_controller.dart';
import 'package:techino_app/intro/utilities/styles.dart';

class Sponser extends StatefulWidget {
  List<RandomAd> ads = [];

  Sponser({required this.ads});

  @override
  _SponserState createState() => _SponserState();
}

class _SponserState extends State<Sponser> {
  final CarouselController _controller = CarouselController();

  AdController adController = new AdController();

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
    print('${widget.ads.length} ad length');
    return Container(
      height: 120,
      width: MediaQuery.of(context).size.width,
      child: CarouselSlider(
        carouselController: _controller,
        options: CarouselOptions(
          scrollDirection: Axis.horizontal,
          autoPlay: true,
          // enlargeCenterPage: true,
          // enlargeStrategy: CenterPageEnlargeStrategy.height,
        ),
        items: widget.ads
            .map(
              (item) => Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: Color(int.parse(item.colors)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15, top: 10, right: 15),
                      child: Text(
                        " ${item.title} ",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
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
                                    "${item.slogan}",
                                    style: TextStyle(
                                      color: Color(0xFFd5d5d5),
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
                            ),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: item.imagePath,
                              placeholder: (context, url) => Center(
                                  child: CircularProgressIndicator(
                                      color: primary.color)),
                                      errorWidget: (context, url, error) => Icon(Icons.error, color:Colors.red),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
