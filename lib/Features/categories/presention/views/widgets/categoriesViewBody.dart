import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wonder_shop/Features/categories/presention/views/manger/categoriesCubit.dart';
import 'package:wonder_shop/core/utils/app_router.dart';

import 'categoriesAppBar.dart';
import 'categoriesList.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key});

  static const Map<String, String> categoryImages = {
    "electronics":
    "https://images.pexels.com/photos/3945659/pexels-photo-3945659.jpeg",
    "jewelery":
    "https://images.unsplash.com/photo-1522312346375-d1a52e2b99b3?w=800",
    "men's clothing":
    "https://images.pexels.com/photos/428340/pexels-photo-428340.jpeg?auto=compress&cs=tinysrgb&w=800",
    "women's clothing":
    "https://images.pexels.com/photos/7679720/pexels-photo-7679720.jpeg",
  };

  void goToCategoryProducts(BuildContext context, String category) {
    context.push(AppRouter.kProductsView);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CategoriesAppBar(title: 'Categories'),

            const SizedBox(height: 12),

            // Categories List
            Expanded(
              child: BlocBuilder<CategoriesCubit, CategoriesState>(
                builder: (context, state) {
                  if (state is CategoriesLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is CategoriesLoaded) {
                    return CategoriesList(
                      categories: state.categories,
                      categoryImages: categoryImages,
                      onCategoryTap: (category) =>
                          goToCategoryProducts(context, category),
                    );
                  } else if (state is CategoriesError) {
                    return Center(child: Text(state.message));
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
