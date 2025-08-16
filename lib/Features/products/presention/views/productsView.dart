import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/functions/setup_service_locator.dart';
import '../../data/repos/productsRepoImp.dart';
import '../../domain/useCases/viewProductsUseCase.dart';
import 'manger/productsCubit.dart';
import 'package:wonder_shop/Features/products/presention/views/widgets/productsViewBody.dart';


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
