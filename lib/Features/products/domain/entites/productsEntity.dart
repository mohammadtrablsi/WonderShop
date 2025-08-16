class ProductsEntity {
  late final int id;
  late final String title;
  late final num price;
  late final String description;
  late final String image;
  late final num rating;
  ProductsEntity(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.image,
      required this.rating});
}
