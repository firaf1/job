class RandomAd {
  late int id;
  late String title;
  late String slogan;
  late String imagePath;
  late int randomColor;
  late String colors;

  RandomAd(
      {required this.id,
      required this.colors,
      required this.title,
      required this.slogan,
      required this.randomColor,
      required this.imagePath});
  RandomAd.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    colors = data['colors'];
    title = data['title'];
    slogan = data['slogan'];
    imagePath = data['image_path'];
    randomColor = data['random_color'];
  }
}
