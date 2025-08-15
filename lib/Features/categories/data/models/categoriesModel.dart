// data/models/categories_model.dart
import '../../domain/entites/categoriesEntity.dart';

class CategoriesModel extends CategoriesEntity {
  CategoriesModel({required String name}) : super(name: name);

  /// Factory constructor for creating a CategoriesModel from a simple string
  factory CategoriesModel.fromString(String name) {
    return CategoriesModel(name: name);
  }

  /// Convert the model back to a simple string (for JSON serialization if needed)
  // String toJson() => name;
}
