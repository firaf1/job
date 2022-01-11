import 'dart:convert';

import 'package:techino_app/Model/Jobs.dart';
import 'package:http/http.dart' as http;
import 'package:techino_app/Model/Jobs_category.dart';
import 'package:techino_app/Model/companies.dart';
import 'package:techino_app/intro/utilities/styles.dart';

class JobContorller {
  bool isFirstLoaded = false;
  bool isfirst = true;
  bool isServerError = false;
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
    try {
      isLoading = true;
      var request = await http.get(Uri.parse("${url}/all-jobs-category"));
      print(request);
      if (request.statusCode == 200) {
        var response = json.decode(request.body);

        for (var food1 in response) {
          category_temp.add(JobsCategory.fromJson(food1));
        }

        jobs_category.addAll(category_temp);
      } else {
        this.isServerError = true;
      }
      isLoading = false;
    } catch (e) {
      this.isServerError = true;
    }
  }

  Future fetchJobs({category}) async {
    if (category == null) {
      isLoaded = false;
      jobs_list = [];
      temp = [];
      try {
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
          this.isServerError = true;
          print("Fail if not 200 status conde ");
        }
      } catch (e) {
        this.isServerError = true;
        print('all-job try fail');
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
            this.isServerError = true;
            print("Fail if latest job");
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
            this.isServerError = true;
            print("Fail ifcategory");
          }
        }
        // print(request);

      } catch (e) {
         this.isServerError = true;
        print('error....... try job category');
      }
    }
  }

  Future companiesFetch() async {
    isLoading = true;
    try {
      var request = await http.get(Uri.parse("$url/Companies"));
      // print(request);
      if (request.statusCode == 200) {
        var response = json.decode(request.body);
        List<Companies> companiesTemp = [];
        for (var food1 in response) {
          companiesTemp.add(Companies.fromJson(food1));
        }

        companies_list.addAll(companiesTemp);
      } else {
        this.isServerError = true;
        print('if company not status code 200 ');
      }
    } catch (e) {
       this.isServerError = true;
      print('companies try fetching fail');
    }
    isLoading = false;
  }
}
