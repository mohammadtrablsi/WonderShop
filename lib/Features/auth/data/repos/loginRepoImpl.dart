import '../../domain/entities/userEntity.dart';
import '../../domain/repos/loginRepo.dart';
import '../dataSources/loginLocalDataSource.dart';

class LoginRepositoryImpl implements LoginRepo {
  final LoginLocalDataSource localDataSource;

  LoginRepositoryImpl({required this.localDataSource});

  @override
  Future<void> seedUser() => localDataSource.seedUser();

  @override
  Future<bool> login(String phone, String password) async {
    final user = await localDataSource.getUser();
    if (user != null && user.phone == phone && user.password == password) {
      await localDataSource.setLoggedIn(true);
      return true;
    }
    return false;
  }

  @override
  Future<UserEntity?> getUser() => localDataSource.getUser();

  @override
  Future<void> setLoggedIn(bool value) => localDataSource.setLoggedIn(value);

  @override
  Future<bool> isLoggedIn() => localDataSource.isLoggedIn();
}
