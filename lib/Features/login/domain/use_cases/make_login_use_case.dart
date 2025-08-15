import 'package:wonder_shop/Features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entities/login_entity.dart';
import '../repos/login_repo.dart';

class MakeLoginBooksUseCase extends UseCase<LoginEntity, Map<String, dynamic>> {
  final LoginRepo loginRepo;

  MakeLoginBooksUseCase(this.loginRepo);

  @override
  Future<Either<Failure, LoginEntity>> call([Map<String, dynamic>? body]) async {
    return await loginRepo.makeLogin(body!);
  }
}
