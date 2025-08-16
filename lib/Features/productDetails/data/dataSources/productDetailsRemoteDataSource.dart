import '../../../../core/utils/apiService.dart';
import '../../domain/entites/productDetailsEntity.dart';
import '../models/productDetailsModel.dart';


abstract class ProductDetailsRemoteDataSource {
  Future<ProductDetailsEntity> viewProductDetails(String productId);
}

class ProductDetailsRemoteDataSourceImpl extends ProductDetailsRemoteDataSource {
  final ApiService apiService;

  ProductDetailsRemoteDataSourceImpl(this.apiService);

  @override
  Future<ProductDetailsEntity> viewProductDetails(String productId) async {
    final response = await apiService.get(endPoint: '/products/$productId');

    final ProductDetailsEntity entity = ProductDetailsModel.fromJson(response);

    return entity;
  }
}
