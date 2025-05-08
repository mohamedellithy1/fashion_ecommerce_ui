class ProductModel {
  final String name;
  final String image;
  final int price;
  final String description;

  ProductModel({
    required this.name,
    required this.image,
    required this.price,
    required this.description,
  });

  static List<ProductModel> porducts = [
    ProductModel(
      name: "October",
      image: "assets/product/product1.png",
      price: 100,
      description: "reversible angora cardigan",
    ),
    ProductModel(
      name: "October",
      image: "assets/product/product2.png",
      price: 200,
      description: "reversible angora cardigan",
    ),
    ProductModel(
      name: "October",
      image: "assets/product/product3.png",
      price: 170,
      description: "reversible angora cardigan",
    ),
    ProductModel(
      name: "October",
      image: "assets/product/product4.png",
      price: 120,
      description: "reversible angora cardigan",
    ),
    ProductModel(
      name: "October",
      image: "assets/product/product5.png",
      price: 90,
      description: "reversible angora cardigan",
    ),
    ProductModel(
      name: "October",
      image: "assets/product/product6.png",
      price: 480,
      description: "reversible angora cardigan",
    ),
  ];
}
