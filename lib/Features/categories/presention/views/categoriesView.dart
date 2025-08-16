import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wonder_shop/Features/categories/presention/views/widgets/categoriesViewBody.dart';

import '../../../../core/utils/functions/setup_service_locator.dart';
import '../../data/repos/categoriesRepoImp.dart';
import '../../domain/useCases/viewCategoriesUseCase.dart';
import 'manger/categoriesCubit.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key, required this.isDrawerOpen, this.onPressed});
  final bool isDrawerOpen;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return CategoriesCubit(
          ViewCategoriesUseCase(
            getIt.get<CategoriesRepoImpl>(),
          ),
        )..viewCategories();
      },
      child:  CategoriesViewBody(isDrawerOpen: isDrawerOpen,onPressed:onPressed ,),
    );
  }
}
