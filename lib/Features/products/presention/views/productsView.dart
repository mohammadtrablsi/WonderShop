import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/functions/setupServiceLocator.dart';
import '../../data/repos/productsRepoImp.dart';
import '../../domain/useCases/viewProductsUseCase.dart';
import 'package:wonder_shop/Features/products/presention/views/widgets/productsViewBody.dart';

import '../manager/productsCubit.dart';


class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return ProductsCubit(
          ViewProductsUseCase(
            getIt.get<ProductsRepoImpl>(),
          ),
        )..viewProducts();
      },
      child: ProductsViewBody(),
    );
  }
}
