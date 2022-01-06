import 'package:flutter/material.dart';
import 'package:techino_app/View/Profile/update_profile.dart';
import 'package:techino_app/intro/utilities/styles.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      height: MediaQuery.of(context).size.height,
      color: Color(0xFFFf3f3f3),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              child: Stack(
                alignment: AlignmentDirectional.topStart,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: primary.color,
                      // borderRadius: BorderRadius.only(
                      //   bottomLeft: Radius.circular(15),
                      //   bottomRight: Radius.circular(15),
                      // ),
                    ),
                    height: 150,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 35, left: 35, right: 35),
                    height: 300,
                    width: MediaQuery.of(context).size.width - 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFdddddd),
                          offset: Offset(0, 0.5),
                          spreadRadius: 5,
                          blurRadius: 8,
                        )
                      ],
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          width: 120,
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/my.jpg',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            'Firaol Biru',
                            style: TextStyle(
                              color: primary.color,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.work,
                                size: 17,
                                color: primary.color,
                              ),
                              Text(
                                ' Accounting',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: primary.color,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.phone,
                                size: 17,
                                color: primary.color,
                              ),
                              Text(
                                ' +251936258910',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: primary.color,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.mail,
                                size: 17,
                                color: primary.color,
                              ),
                              Text(
                                ' feraolbiru@gmail.com',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: primary.color,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Change List
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext conte) => UpdateProfile(
                        title: 'Update Full Name', update: 'fullName'),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.only(top: 10, left: 35, right: 35),
                height: 50,
                width: MediaQuery.of(context).size.width - 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFd7d7d7),
                      offset: Offset(0, 0.5),
                      spreadRadius: 5,
                      blurRadius: 8,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Change Full Name',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: primary.color,
                        ),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios_outlined,
                        color: primary.color),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext conte) => UpdateProfile(
                        title: 'Update Password', update: 'password'),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.only(top: 10, left: 35, right: 35),
                height: 50,
                width: MediaQuery.of(context).size.width - 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFd7d7d7),
                      offset: Offset(0, 0.5),
                      spreadRadius: 5,
                      blurRadius: 8,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Change Password',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: primary.color,
                        ),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios_outlined,
                        color: primary.color),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext conte) => UpdateProfile(
                        title: 'Change Profile Picture',
                        update: 'profilePicture'),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.only(top: 10, left: 35, right: 35),
                height: 50,
                width: MediaQuery.of(context).size.width - 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFd7d7d7),
                      offset: Offset(0, 0.5),
                      spreadRadius: 5,
                      blurRadius: 8,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Change Profile Picture',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: primary.color,
                        ),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios_outlined,
                        color: primary.color),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext conte) => UpdateProfile(
                        title: 'Update Full Name', update: 'fullName'),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.only(top: 10, left: 35, right: 35),
                height: 50,
                width: MediaQuery.of(context).size.width - 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFd7d7d7),
                      offset: Offset(0, 0.5),
                      spreadRadius: 5,
                      blurRadius: 8,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Change Job Category',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: primary.color,
                        ),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios_outlined,
                        color: primary.color),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext conte) =>
                        UpdateProfile(title: 'Change Email', update: 'email'),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.only(top: 10, left: 35, right: 35),
                height: 50,
                width: MediaQuery.of(context).size.width - 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFd7d7d7),
                      offset: Offset(0, 0.5),
                      spreadRadius: 5,
                      blurRadius: 8,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Change Email',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: primary.color,
                        ),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios_outlined,
                        color: primary.color),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext conte) => UpdateProfile(
                        title: 'Change Phone Number', update: 'phoneNumber'),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.only(top: 10, left: 35, right: 35),
                height: 50,
                width: MediaQuery.of(context).size.width - 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFd7d7d7),
                      offset: Offset(0, 0.5),
                      spreadRadius: 5,
                      blurRadius: 8,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Change Phone Number',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: primary.color,
                        ),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios_outlined,
                        color: primary.color),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
