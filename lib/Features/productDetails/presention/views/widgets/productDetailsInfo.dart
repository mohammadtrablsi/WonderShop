// presentation/widgets/product_info.dart
import 'package:flutter/material.dart';
import '../../../domain/entites/productDetailsEntity.dart';

class ProductDetailsInfo extends StatelessWidget {
  final ProductDetailsEntity product;
  const ProductDetailsInfo(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFFFE5EC),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFC7164F), width: 1.2),
            ),
            child: Text(
              product.category.toUpperCase(),
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFFC7164F),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            product.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            product.description,
            style: const TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
