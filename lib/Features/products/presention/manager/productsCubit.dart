import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wonder_shop/Features/products/domain/useCases/viewProductsUseCase.dart';
import 'package:wonder_shop/Features/products/presention/manager/prodcutsState.dart';

import '../../domain/entites/productsEntity.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ViewProductsUseCase viewProductsUseCase;

  ProductsCubit(this.viewProductsUseCase) : super(ProductsInitial());

  List<ProductsEntity> allProducts = [];
  int selectedRating = 1;
  bool isFilterExpanded = false;


  Future<void> viewProducts() async {
    emit(ProductsLoading());
    final products = await viewProductsUseCase.call();
    products.fold(
          (failure) => emit(ProductsError(failure.message)),
          (productsList) {
        allProducts = productsList;
        filterByRating(selectedRating);
      },
    );
  }

  void filterByRating(int rating) {
    selectedRating = rating;
    final filtered = allProducts.where((p) => p.rating >= rating).toList();
    emit(ProductsLoaded(filtered));
    isFilterExpanded = false;
  }

  void toggleFilterExpansion(bool expanded) {
    isFilterExpanded = expanded;
    emit(state);
  }
}
