import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../Features/home/data/data_sources/home_local_data_source.dart';
import '../../../Features/home/data/data_sources/home_remote_data_source.dart';
import '../../../Features/home/data/repos/home_repo_impl.dart';
import '../../../Features/login/data/data_sources/login_remote_data_source.dart';
import '../../../Features/login/data/repos/login_repo_impl.dart';
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
  getIt.registerSingleton<LoginRepoImpl>(
    LoginRepoImpl(
      loginRemoteDataSource: LoginRemoteDataSourceImpl(
        getIt.get<ApiService>(),
      ),
    ),
  );
}
