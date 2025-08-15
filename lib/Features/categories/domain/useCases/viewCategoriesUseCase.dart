
import 'package:dartz/dartz.dart';
import 'package:wonder_shop/core/use_cases/use_case.dart';


import '../../../../core/errors/failure.dart';
import '../entites/categoriesEntity.dart';
import '../repos/categoriesRepo.dart';



class ViewCategoriesUseCase extends UseCase<List<CategoriesEntity>,NoParam>{
  final CategoriesRepo categoriesRepo;

  ViewCategoriesUseCase(this.categoriesRepo);

  Future<Either<Failure, List<CategoriesEntity>>> call([NoParam? param]) async {
    return await categoriesRepo.viewCategories();
  }
}
