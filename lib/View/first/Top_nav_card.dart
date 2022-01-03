import 'package:flutter/material.dart';
import 'package:techino_app/intro/utilities/styles.dart';

class Top_Card extends StatelessWidget {
  const Top_Card({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          height: 160,
          child: Align(
            alignment: AlignmentDirectional.topEnd,
            child: Container(
              padding: EdgeInsets.only(left: 30),
              height: 130,
              width: double.infinity,
              decoration: BoxDecoration(
                color: primary.color,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Container(
                margin: EdgeInsets.only(top: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "Welcome ...",
                        style: TextStyle(
                          color: secondary.color,
                          // fontFamily: rob,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.5,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        "What do you want to  find today ?",
                        style: TextStyle(
                          color: Color(0xFFcbc5be),
                          fontSize: 18.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 15,
          child: Container(
            padding: EdgeInsets.only(left: 10),
            margin: EdgeInsets.only(top: 0),
            height: 45,
            width: MediaQuery.of(context).size.width / 1.2,
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 0,
                  color: Color(0xFFcfd4d7),
                  offset: Offset(5, 5),
                  blurRadius: 20,
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.search,
                  color: primary.color,
                ),
                border: InputBorder.none,
                hintText: "Search...",
              ),
            ),
          ),
        )
      ],
    );
  }
}
