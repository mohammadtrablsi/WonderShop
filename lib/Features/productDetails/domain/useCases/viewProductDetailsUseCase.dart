import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entites/productDetailsEntity.dart';
import '../repos/productsRepo.dart';

class ViewProductDetailsUseCase extends UseCase<ProductDetailsEntity, String> {
  final ProductDetailsRepo productDetailsRepo;

  ViewProductDetailsUseCase(this.productDetailsRepo);

  Future<Either<Failure, ProductDetailsEntity>> call([String? productId]) async {
    return await productDetailsRepo.viewProductDetails(productId!);
  }
}
