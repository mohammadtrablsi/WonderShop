import 'package:wonder_shop/Features/products/domain/entites/productsEntity.dart';

class ProductsModel extends ProductsEntity{
  final Rating ratingObj;
  int id;
  String title;
  num price;
  String description;
  String category;
  String image;
   ProductsModel(
      {required this.id,
        required this.title,
        required this.price,
        required this.description,
        required this.category,
        required this.image,
        required this.ratingObj}):super(id: id,title: title,price: price,description: description,image: image,rating: ratingObj.rate ?? 0,  );

  factory ProductsModel.fromJson(Map<String, dynamic> json) =>ProductsModel(
      id : json['id'],
      title : json['title'],
      price : json['price'],
  description : json['description'],
  category : json['category'],
  image : json['image'],
  ratingObj: json['rating'] != null
  ? Rating.fromJson(json['rating'])
      : Rating(rate: 0, count: 0),

  );
  }


class Rating {
  num? rate;
  int? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['count'] = this.count;
    return data;
  }
}