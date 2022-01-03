import 'dart:convert';

import 'package:techino_app/Model/Jobs.dart';
import 'package:http/http.dart' as http;
import 'package:techino_app/Model/Jobs_category.dart';
import 'package:techino_app/Model/companies.dart';
import 'package:techino_app/intro/utilities/styles.dart';

class JobContorller {
  bool isFirstLoaded = false;
  bool isfirst = true;

  bool isLoaded = false;

  // ignore: non_constant_identifier_names
  List<JobsCategory> jobs_category = [];
  List<JobsCategory> category_temp = [];
  List<Companies> companies_list = [];
  var count = 0;
  int isinitialized = 0;
  List<Jobs> jobs_list = [];
  List<Jobs> temp = [];
  bool isLoading = true;
  Future fetchJobsCategory() async {
    isLoading = true;
    var request = await http.get(Uri.parse("${url}/all-jobs-category"));
    print(request);
    if (request.statusCode == 200) {
      var response = json.decode(request.body);

      for (var food1 in response) {
        category_temp.add(JobsCategory.fromJson(food1));
      }

      jobs_category.addAll(category_temp);
    } else {}
    isLoading = false;
  }

  Future fetchJobs({category}) async {
    if (category == null) {
      isLoaded = false;
      jobs_list = [];
      temp = [];
      var request = await http.get(Uri.parse("$url/all-jobs"));
      // print(request);
      if (request.statusCode == 200) {
        var response = json.decode(request.body);

        for (var food1 in response) {
          temp.add(Jobs.fromJson(food1));
        }

        jobs_list.addAll(temp);
        isLoaded = true;
      } else {
        print("Fail ");
      }
    }
    if (category != null) {
      isLoaded = false;
      jobs_list = [];
      temp = [];
      try {
        if (category == -1) {
          var request = await http.get(Uri.parse("$url/latest-jobs"));
          if (request.statusCode == 200) {
            var response = json.decode(request.body);

            for (var food1 in response) {
              temp.add(Jobs.fromJson(food1));
            }

            jobs_list.addAll(temp);
            isLoaded = true;
          } else {
            print("Fail ");
          }
        } else {
          var request = await http.get(Uri.parse("$url/jobs/$category"));
          if (request.statusCode == 200) {
            var response = json.decode(request.body);

            for (var food1 in response) {
              temp.add(Jobs.fromJson(food1));
            }

            jobs_list.addAll(temp);
            isLoaded = true;
          } else {
            print("Fail ");
          }
        }
        // print(request);

      } catch (e) {
        print('error.......');
      }
    }
  }

  Future companiesFetch() async {
    isLoading = true;
    var request = await http.get(Uri.parse("${url}/Companies"));
    // print(request);
    if (request.statusCode == 200) {
      var response = json.decode(request.body);
      List<Companies> companies_temp = [];
      for (var food1 in response) {
        companies_temp.add(Companies.fromJson(food1));
      }

      companies_list.addAll(companies_temp);
    } else {}
    isLoading = false;
  }
}
