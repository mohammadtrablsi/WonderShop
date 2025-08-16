import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wonder_shop/Features/productDetails/presention/views/widgets/productDetailsImage.dart';
import 'package:wonder_shop/Features/productDetails/presention/views/widgets/productDetailsInfo.dart';
import 'package:wonder_shop/core/utils/styles.dart';

import '../../../../../core/utils/functions/lottieStatusRequest.dart';
import '../manger/prodcutDetailsState.dart';
import '../manger/productDetailsCubit.dart';
import 'ProductDetailsBottomBar.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.tag});
  final tag;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        if (state is ProductDetailsLoading) {
          return Scaffold(backgroundColor: Styles.customWhite,body: Center(child: lottieStatusRequest(StatusRequest.loading)));
        } else if (state is ProductDetailsLoaded) {
          final product = state.product;
          return Scaffold(
            backgroundColor: Styles.customWhite,
            body: SafeArea(
              child: Column(
                children: [
                  Hero(
                    tag: tag.toString(),
                    child: ProductDetailsImage(
                      imageUrl: product.image,
                      onBack: () => Navigator.pop(context),
                    ),
                  ),
                  Expanded(child: SingleChildScrollView(child: ProductDetailsInfo(product))),
                  ProductDetailsBottomBar(product: product, onAddToCart: () {}),
                ],
              ),
            ),
          );
        } else if (state is ProductDetailsError) {
          return Scaffold(body: Center(child: Text(state.message)));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
