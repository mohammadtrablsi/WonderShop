
import 'package:dartz/dartz.dart';
import 'package:wonder_shop/core/use_cases/use_case.dart';


import '../../../../core/errors/failure.dart';
import '../entites/productsEntity.dart';
import '../repos/productsRepo.dart';



class ViewProductsUseCase extends UseCase<List<ProductsEntity>,NoParam>{
  final ProductsRepo productsRepo;

  ViewProductsUseCase(this.productsRepo);

  Future<Either<Failure, List<ProductsEntity>>> call([NoParam? param]) async {
    return await productsRepo.viewProducts();
  }
}
