class Companies {
  late String name;
  late String imagePath;
  late int totalJobs;
  Companies({
    required this.name,
    required this.imagePath,
    required this.totalJobs,
  });
  Companies.fromJson(Map<String, dynamic> map) {
    name = map['name'];
    imagePath = map['image_path'];
    totalJobs = map['total_jobs'];
  }
}
