import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wonder_shop/Features/productDetails/presention/manager/prodcutDetailsState.dart';

import '../../domain/useCases/viewProductDetailsUseCase.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final ViewProductDetailsUseCase useCase;

  ProductDetailsCubit(this.useCase) : super(ProductDetailsInitial());

  Future<void> viewProductDetails(String productId) async {
    emit(ProductDetailsLoading());
    final result = await useCase(productId);
    result.fold(
          (failure) => emit(ProductDetailsError(failure.message)),
          (product) => emit(ProductDetailsLoaded(product)),
    );
  }
}
