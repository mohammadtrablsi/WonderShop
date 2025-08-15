
import 'package:flutter/material.dart';

import '../../../domain/entites/categoriesEntity.dart';
import 'categoryCard.dart';

class CategoriesList extends StatelessWidget {
  final List<CategoriesEntity> categories;
  final Map<String, String> categoryImages;
  final Function(String) onCategoryTap;

  const CategoriesList({
    super.key,
    required this.categories,
    required this.categoryImages,
    required this.onCategoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        final category = categories[index];
        return CategoryCard(
          category: category,
          imageUrl: categoryImages[category.name] ??
              "https://via.placeholder.com/300",
          onTap: () => onCategoryTap(categories[index].name??''),
        );
      },
    );
  }
}
