class CoverModel {
  final String image;
  final String description;
  CoverModel({required this.image, required this.description});
  static List<CoverModel> cover = [
    CoverModel(
      image: "assets/cover/cover1.png",
      description: "Whait collection".toUpperCase(),
    ),
    CoverModel(
      image: "assets/cover/cover2.png",
      description: "Black collection".toUpperCase(),
    ),
    CoverModel(
      image: "assets/cover/cover3.png",
      description: "HAE BY HAEKIM".toUpperCase(),
    ),
  ];
}
