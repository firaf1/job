class RandomAd {
  late int id;
  late String title;
  late String slogan;
  late String imagePath;
  late int randomColor;

  RandomAd(
      {required this.id,
      required this.title,
      required this.slogan,
      required this.randomColor,
      required this.imagePath});
  RandomAd.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    title = data['title'];
    slogan = data['slogan'];
    imagePath = data['image_path'];
    randomColor = data['random_color'];
  }
}
