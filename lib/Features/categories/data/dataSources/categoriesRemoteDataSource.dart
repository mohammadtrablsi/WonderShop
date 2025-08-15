
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/api_service.dart';
import '../../domain/entites/categoriesEntity.dart';
import '../models/categoriesModel.dart';





abstract class CategoriesRemoteDataSource {
  Future<List<CategoriesEntity>> viewCategories();
}

class CategoriesRemoteDataSourceImpl extends CategoriesRemoteDataSource {
  final ApiService apiService;

  CategoriesRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<CategoriesEntity>> viewCategories() async {
    final response = await apiService.get(endPoint: '/products/categories');

    final List<CategoriesEntity> entities = (response as List)
        .map((categoryName) => CategoriesModel.fromString(categoryName))
        .toList();

    return entities;
  }


}
