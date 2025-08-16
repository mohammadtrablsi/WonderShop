import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entites/productDetailsEntity.dart';

abstract class ProductDetailsRepo {
  Future<Either<Failure, ProductDetailsEntity>> viewProductDetails(String productId);
}
