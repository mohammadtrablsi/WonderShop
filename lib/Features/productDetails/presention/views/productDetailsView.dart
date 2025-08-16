import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wonder_shop/Features/productDetails/presention/views/widgets/productDetailsViewBody.dart';

import '../../../../core/utils/functions/setup_service_locator.dart';
import '../../data/repos/productDetailsRepoImp.dart';
import '../../domain/useCases/viewProductDetailsUseCase.dart';
import 'manger/productDetailsCubit.dart';


class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.productId, required this.tag});
  final int productId;
  final tag;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return ProductDetailsCubit(
          ViewProductDetailsUseCase(
            getIt.get<ProductDetailsRepoImpl>(),
          ),
        )..viewProductDetails(productId.toString());
      },
      child:ProductDetailsViewBody(tag: tag,),
    );
  }
}
