import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wonder_shop/Features/products/domain/useCases/viewProductsUseCase.dart';
import 'package:wonder_shop/Features/products/presention/views/manger/prodcutsState.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ViewProductsUseCase viewProductsUseCase;

  ProductsCubit(this.viewProductsUseCase) : super(ProductsInitial());

  Future<void> viewProducts() async {
    emit(ProductsLoading());
    final products = await viewProductsUseCase.call();
    products.fold(
      (failure) => emit(ProductsError(failure.message)),
      (Products) => emit(ProductsLoaded(Products)),
    );
  }
}
