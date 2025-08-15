import 'package:dartz/dartz.dart';


import '../../../../core/errors/failure.dart';
import '../entites/categoriesEntity.dart';

abstract class CategoriesRepo {
  Future<Either<Failure, List<CategoriesEntity>>> viewCategories();
}
