import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:techino_app/Model/random_ad.dart';
import 'package:techino_app/intro/utilities/styles.dart';

class AdController {
  List<RandomAd> ad = [];
  bool isServerError = false;
  fetchAds() async {
    ad = [];
    try {
      var request = await http.get(Uri.parse("$url/random-ads"));
      List<RandomAd> temp = [];

      if (request.statusCode == 200) {
        var response = json.decode(request.body);
        print(response);
        for (var food1 in response) {
          temp.add(RandomAd.fromJson(food1));
        }

        ad.addAll(temp);
        print('${ad.length} in controller');
      } else {
        this.isServerError = true;
        print("Fail ad if not 200");
      }
    } catch (e) {
      this.isServerError = true;
      print('ad try fail');
    }
  }
}
