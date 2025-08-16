import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:wonder_shop/Features/auth/data/repos/loginRepoImpl.dart';
import 'package:wonder_shop/Features/categories/data/dataSources/categoriesRemoteDataSource.dart';
import 'package:wonder_shop/Features/categories/data/repos/categoriesRepoImp.dart';
import 'package:wonder_shop/Features/products/data/dataSources/productsRemoteDataSource.dart';
import 'package:wonder_shop/Features/products/data/repos/productsRepoImp.dart';

import '../../../Features/auth/data/dataSources/loginLocalDataSource.dart';
import '../api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<LoginRepositoryImpl>(
    LoginRepositoryImpl(
         localDataSource:LoginLocalDataSourceImpl(getIt.get<ApiService>(),)

    ),
  );
  getIt.registerSingleton<CategoriesRepoImpl>(
      CategoriesRepoImpl(
        categoriesRemoteDataSource:CategoriesRemoteDataSourceImpl(getIt.get<ApiService>(),),

  ));
  getIt.registerSingleton<ProductsRepoImpl>(
      ProductsRepoImpl(productsRemoteDataSource: ProductsRemoteDataSourceImpl(getIt.get<ApiService>(),),
      ),
  );

}
