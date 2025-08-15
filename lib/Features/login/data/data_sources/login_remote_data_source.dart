
import 'package:wonder_shop/core/utils/api_service.dart';

import '../../domain/entities/login_entity.dart';
import '../models/loginModel.dart';

abstract class LoginRemoteDataSource {
  Future<LoginEntity> makeLogin(Map<String, dynamic> body);
}

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  final ApiService apiService;

  LoginRemoteDataSourceImpl(this.apiService);
  @override
  Future<LoginEntity> makeLogin( Map<String, dynamic> body) async {
    var data = await apiService.post(
        endPoint:
            'https://fakestoreapi.com/auth/login', data: body);
    LoginEntity dataOfLogin = getLoginData(data);
    return dataOfLogin;
  }
  

  LoginEntity getLoginData(Map<String, dynamic> data) {
    LoginEntity dataOfLogin;
    dataOfLogin=LoginModel.fromJson(data);
    return dataOfLogin;
  }
}
