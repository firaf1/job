import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techino_app/Controller/user_controller.dart';
import 'package:techino_app/View/Profile/category_update.dart';
import 'package:techino_app/View/Profile/email_update.dart';

import 'package:techino_app/View/Profile/update_profile.dart';
import 'package:techino_app/intro/utilities/styles.dart';
import 'package:http/http.dart' as http;
import 'package:techino_app/mainScreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool profilePictureLoading = false;

  late var token = "";
  String imagePath = "";
  UserController userController = new UserController();
  addToSharedPre(response) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('image_path', response['image_path']);
      userController.imagePath = response['image_path'];
      imagePath = response['image_path'];
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height - 140),
        backgroundColor: Colors.cyan,
        behavior: SnackBarBehavior.floating,
        content: Container(
          height: 30,
          width: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.verified_sharp, color: Colors.white, size: 30),
              Container(width: 20),
              Text('Successfully Updated '),
            ],
          ),
        ),
      ),
    );
    setState(() {
      profilePictureLoading = false;
    });
    // Navigator.pushReplacement(
    //     context, new MaterialPageRoute(builder: (context) => new MainScreen()));
    // print(prefs.getString('token'));
  }

  void initState() {
    userController.getSharedPrefs().then((value) {
      setState(() {
        token = userController.accessToken;
        imagePath = userController.imagePath;
      });
    });

    // TODO: implement initState
    super.initState();
  }

  List<PlatformFile>? _files;
  imageUpload() async {
    setState(() {
      profilePictureLoading = true;
    });
    _files = (await FilePicker.platform.pickFiles(
            type: FileType.any, allowMultiple: false, allowedExtensions: null))!
        .files;
    _uploadFile();
    print('Loaded file path is : ${_files!.first.path}');
  }

  void _uploadFile() async {
    //TODO replace the url bellow with you ipv4 address in ipconfig
    var uri = Uri.parse('$url/update-profile-picture');
    var request = http.MultipartRequest('POST', uri);
    request.headers.addAll({"Authorization": "Bearer $token"});
    request.files.add(await http.MultipartFile.fromPath(
      'picture',
      _files!.first.path.toString(),
    ));

    var response = await request.send();
    if (response.statusCode == 200) {
      var responsed = await http.Response.fromStream(response);
      final responseData = json.decode(responsed.body);
      addToSharedPre(responseData);
    } else {
      setState(() {
        profilePictureLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
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
                              margin:
                                  EdgeInsets.only(top: 35, left: 35, right: 35),
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
                                    margin:EdgeInsets.only(top:10),
                                    child: ClipRRect(
                                      
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: CachedNetworkImage(
                                        height: 100,
                                        width: 120,
                                        fit: BoxFit.cover,
                                        imageUrl: imagePath,
                                        placeholder: (context, url) => Center(
                                            child: CircularProgressIndicator(
                                                color: primary.color)),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error, color: Colors.red),
                                      ),
                                      // child: Text(imagePath),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      userController.name,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.work,
                                          size: 17,
                                          color: primary.color,
                                        ),
                                        Text(
                                          " ${userController.job}",
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.phone,
                                          size: 17,
                                          color: primary.color,
                                        ),
                                        Text(
                                         userController.phoneNumber,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.mail,
                                          size: 17,
                                          color: primary.color,
                                        ),
                                        Text(
                                         userController.email,
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
                                  title: 'Update Full Name',
                                  update: 'fullName'),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          margin: EdgeInsets.only(top: 10, left: 35, right: 35),
                          height: 60,
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
                          height: 60,
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
                        onTap: () async {
                          imageUpload();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          margin: EdgeInsets.only(top: 10, left: 35, right: 35),
                          height: 60,
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
                              builder: (BuildContext conte) => CategoryUpdate(),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          margin: EdgeInsets.only(top: 10, left: 35, right: 35),
                          height: 60,
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
                              builder: (BuildContext conte) => EmailUpdate())
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          margin: EdgeInsets.only(top: 10, left: 35, right: 35),
                          height: 60,
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
                                  title: 'Change Phone Number',
                                  update: 'phoneNumber'),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          margin: EdgeInsets.only(
                              top: 10, left: 35, bottom: 30, right: 35),
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
              ),
            ],
          ),
          profilePictureLoading == true
              ? Container(
                  child: Container(
                    padding: EdgeInsets.only(bottom: 80),
                    height: MediaQuery.of(context).size.height + 150,
                    width: MediaQuery.of(context).size.width,
                    color: Color.fromRGBO(0, 0, 151, 0.8),
                    child: Container(
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 4,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Text(
                                'Please Wait . . .',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
