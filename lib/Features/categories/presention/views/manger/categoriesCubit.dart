import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entites/categoriesEntity.dart';
import '../../../domain/useCases/viewCategoriesUseCase.dart';

part 'categoriesState.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final ViewCategoriesUseCase useCase;

  CategoriesCubit(this.useCase) : super(CategoriesInitial());

  Future<void> viewCategories() async {
    emit(CategoriesLoading());
    final result = await useCase();
    result.fold(
          (failure) => emit(CategoriesError(failure.message)),
          (categories) => emit(CategoriesLoaded(categories)),
    );
  }
}
