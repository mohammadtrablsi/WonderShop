class ProductDetailsEntity {
  late final int id;
  late final String title;
  late final num price;
  late final String description;
  late final String image;
  late final String category;
  late final num rating;
  ProductDetailsEntity(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.image,
      required this.category,
      required this.rating});
}
