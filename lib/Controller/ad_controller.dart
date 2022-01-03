import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:techino_app/Model/random_ad.dart';
import 'package:techino_app/intro/utilities/styles.dart';

class AdController {
  List<RandomAd> ad = [];
  fetchAds() async {
    var request = await http.get(Uri.parse("$url/random-ads"));
    List<RandomAd> temp = [];
    if (request.statusCode == 200) {
      var response = json.decode(request.body);
      print(response);
      for (var food1 in response) {
        temp.add(RandomAd.fromJson(food1));
      }

      ad.addAll(temp);
    } else {
      print("Fail ");
    }
  }
}
