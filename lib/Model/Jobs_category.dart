class JobsCategory {
  late int id;
  late String name;
  late String imagePath;
  late int totalJobs;
  JobsCategory({
    required this.name,
    required this.imagePath,
    required this.totalJobs,
  });

  JobsCategory.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    imagePath = data['image_path'];
    totalJobs = data['total_jobs'];
  }
}
