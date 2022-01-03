import 'dart:convert';

import 'package:jiffy/jiffy.dart';

class Jobs {
  late var description;
  late String categoryName;
  late String address;
  late String title;
  late String salary;
  late String companyName;
  late String imagePath;
  late String createdAt;

  Jobs({
    required this.description,
    required this.categoryName,
    required this.address,
    required this.salary,
    required this.title,
    required this.companyName,
    required this.createdAt,
    required this.imagePath,
  });

  Jobs.fromJson(Map<String, dynamic> data) {
    description = data['description'];
    categoryName = data['category_name'];
    address = data['address'];
    salary = data['salary'];
    companyName = data['company_name'];
    title = data['title'];
    imagePath = data['company_image'];
    var parsedDate = DateTime.parse(data['created_at']);
    createdAt = (Jiffy(parsedDate).fromNow()).toString();
  }
}
