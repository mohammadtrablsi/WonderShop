// presentation/widgets/product_bottom_bar.dart
import 'package:flutter/material.dart';
import 'package:wonder_shop/core/utils/styles.dart';
import '../../../domain/entites/productDetailsEntity.dart';

class ProductDetailsBottomBar extends StatelessWidget {
  final ProductDetailsEntity product;
  final VoidCallback onAddToCart;
  const ProductDetailsBottomBar({required this.product, required this.onAddToCart, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6, offset: const Offset(0, -2))
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("\$${product.price}", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Styles.mainColor)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Styles.mainColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            onPressed: onAddToCart,
            child: const Text("Add to Cart", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
