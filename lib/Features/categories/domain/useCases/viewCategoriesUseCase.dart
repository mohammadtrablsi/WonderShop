
import 'package:dartz/dartz.dart';


import '../../../../core/errors/failure.dart';
import '../../../../core/useCases/useCase.dart';
import '../entites/categoriesEntity.dart';
import '../repos/categoriesRepo.dart';



class ViewCategoriesUseCase extends UseCase<List<CategoriesEntity>,NoParam>{
  final CategoriesRepo categoriesRepo;

  ViewCategoriesUseCase(this.categoriesRepo);

  Future<Either<Failure, List<CategoriesEntity>>> call([NoParam? param]) async {
    return await categoriesRepo.viewCategories();
  }
}
