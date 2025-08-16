import '../../../../core/utils/apiService.dart';
import '../../domain/entites/productsEntity.dart';
import '../models/productsModel.dart';



abstract class ProductsRemoteDataSource {
  Future<List<ProductsEntity>> viewProducts();
}

class ProductsRemoteDataSourceImpl extends ProductsRemoteDataSource {
  final ApiService apiService;

  ProductsRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<ProductsEntity>> viewProducts() async {
    final response = await apiService.get(endPoint: '/products');

    final List<ProductsEntity> entities = (response as List)
        .map((categoryName) => ProductsModel.fromJson(categoryName))
        .toList();

    return entities;
  }


}
