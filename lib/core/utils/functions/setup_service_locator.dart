import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:wonder_shop/Features/auth/data/repos/loginRepoImpl.dart';

import '../../../Features/auth/data/dataSources/loginLocalDataSource.dart';
import '../../../Features/home/data/data_sources/home_local_data_source.dart';
import '../../../Features/home/data/data_sources/home_remote_data_source.dart';
import '../../../Features/home/data/repos/home_repo_impl.dart';
// import '../../../Features/login/data/data_sources/loginLocalDataSource.dart';
// import '../../../Features/login/data/repos/loginRepoImpl.dart';
import '../api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeLocalDataSource: HomeLocalDataSourceImpl(),
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
        getIt.get<ApiService>(),
      ),
    ),
  );
  getIt.registerSingleton<LoginRepositoryImpl>(
    LoginRepositoryImpl(
         localDataSource:LoginLocalDataSourceImpl(getIt.get<ApiService>(),)

    ),
  );
}
