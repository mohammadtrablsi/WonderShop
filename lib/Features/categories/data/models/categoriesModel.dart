// data/models/categories_model.dart
import '../../domain/entites/categoriesEntity.dart';

class CategoriesModel extends CategoriesEntity {
  CategoriesModel({required String name}) : super(name: name);

  factory CategoriesModel.fromString(String name) {
    return CategoriesModel(name: name);
  }

}
