import 'package:flutter/material.dart';
import 'package:techino_app/intro/utilities/styles.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 25),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            padding: EdgeInsets.only(bottom: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color(0xFFdcf1ff),
                    spreadRadius: 10,
                    blurRadius: 10,
                    offset: Offset(0, 0.5))
              ],
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: primary.color,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  height: 50,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "accounting_setting".tr(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Divider(indent: 20, endIndent: 20),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 13),
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.notifications_on_rounded,
                            color: primary.color,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text(
                              "notification".tr(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: primary.color,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                      )
                    ],
                  ),
                ),
                Divider(indent: 20, endIndent: 20),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.settings,
                            color: primary.color,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text(
                              "privacy_setting".tr(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: primary.color,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                      )
                    ],
                  ),
                ),
                Divider(indent: 20, endIndent: 20),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.event_note_sharp,
                            color: primary.color,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text(
                              "term_and_condition".tr(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: primary.color,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Center(
              child: Text(
                "more_option".tr(),
                style: TextStyle(
                  fontSize: 18,
                  color: primary.color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color(0xFFdcf1ff),
                    spreadRadius: 10,
                    blurRadius: 10,
                    offset: Offset(0, 0.5))
              ],
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.language_rounded,
                            color: primary.color,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text(
                              "language".tr(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: primary.color,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                      )
                    ],
                  ),
                ),
                Divider(indent: 20, endIndent: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: primary.color,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text(
                              'Address',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: primary.color,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                      )
                    ],
                  ),
                ),
                Divider(indent: 20, endIndent: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: primary.color,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text(
                              "about_us".tr(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: primary.color,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                      )
                    ],
                  ),
                ),
                Divider(indent: 20, endIndent: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: primary.color,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text(
                              "Contact_us".tr(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: primary.color,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                      )
                    ],
                  ),
                ),
                Divider(indent: 20, endIndent: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.help_outline_outlined,
                            color: primary.color,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text(
                              "help".tr(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: primary.color,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                      )
                    ],
                  ),
                ),
                Divider(indent: 20, endIndent: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.logout,
                            color: primary.color,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text(
                              "logout".tr(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: primary.color,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
