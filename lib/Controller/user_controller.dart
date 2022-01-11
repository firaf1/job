import 'package:shared_preferences/shared_preferences.dart';

class UserController {
  String name = "";
  String job = "";
  String address = "";
  String phoneNumber = "";
  String email = "";
  String imagePath = "";
  late int totalJobs;
  String accessToken = "";

  bool token = false;
  Future<Null> getSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    SharedPreferences prefs1 = await SharedPreferences.getInstance();

    token = prefs1.containsKey('token');
    if (token) {
      job = prefs.getString("job").toString();
      name = prefs.getString("name").toString();
      accessToken = prefs.getString("token").toString();
      address = prefs.getString("address").toString();
      phoneNumber = prefs.getString("phoneNumber").toString();
      email = prefs.getString("email").toString();
      imagePath = prefs.getString("image_path").toString();
      totalJobs = prefs.getInt("total_jobs")!.toInt();
      print(accessToken);
    }
  }

  // isLogedIn() async {
  //   SharedPreferences prefs1 = await SharedPreferences.getInstance();

  //   prefs1 = await SharedPreferences.getInstance();

  //   token = prefs1.containsKey('token');

  //   return token;
  // }

  updatePre(key, value) async {
    if (key == 'name') {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('name', name).then((value) {});
    }
  }
}
