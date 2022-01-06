import 'package:flutter/material.dart';
import 'package:techino_app/intro/utilities/styles.dart';

class UpdateProfile extends StatefulWidget {
  var title, update;
  UpdateProfile({this.title, this.update});

  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, top: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: primary.color,
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                      ),
                      // color: Colors.red,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25),
                  child: Text(
                    widget.title,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: primary.color,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 45, left: 35, right: 35),
              height: 250,
              width: MediaQuery.of(context).size.width - 70,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFFf3f3f3),
                    offset: Offset(0, 0.5),
                    spreadRadius: 5,
                    blurRadius: 8,
                  )
                ],
              ),
              child: widget.update == 'fullName'
                  ? Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 15),
                          decoration: BoxDecoration(
                            color: Color(0xFFf2f2f2),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              focusColor: primary.color,
                              prefixIcon: Icon(
                                Icons.account_circle_sharp,
                                color: primary.color,
                              ),
                              hintText: 'Firaol Biru',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          margin: EdgeInsets.only(top: 15, left: 35, right: 35),
                          width: MediaQuery.of(context).size.width - 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: primary.color,
                          ),
                          child: Center(
                              child: Text(
                            'Change Name',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      ],
                    )
                  : widget.update == 'email'
                      ? Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 15),
                              decoration: BoxDecoration(
                                color: Color(0xFFf2f2f2),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  focusColor: primary.color,
                                  prefixIcon: Icon(
                                    Icons.mail,
                                    color: primary.color,
                                  ),
                                  hintText: 'feraolbiru@gmail.com',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              margin:
                                  EdgeInsets.only(top: 15, left: 35, right: 35),
                              width: MediaQuery.of(context).size.width - 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: primary.color,
                              ),
                              child: Center(
                                  child: Text(
                                'Change Email',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                            ),
                          ],
                        )
                      : widget.update == 'phoneNumber'
                          ? Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 15),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFf2f2f2),
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      focusColor: primary.color,
                                      prefixIcon: Icon(
                                        Icons.call,
                                        color: primary.color,
                                      ),
                                      hintText: '+251936258910',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  margin: EdgeInsets.only(
                                      top: 15, left: 35, right: 35),
                                  width: MediaQuery.of(context).size.width - 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: primary.color,
                                  ),
                                  child: Center(
                                      child: Text(
                                    'Change Phone',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                                ),
                              ],
                            )
                          : Text('hello'),
            )
          ],
        ),
      ),
    );
  }
}
