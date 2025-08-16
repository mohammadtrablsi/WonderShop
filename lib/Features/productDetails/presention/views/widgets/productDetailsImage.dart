import 'package:flutter/material.dart';

class ProductDetailsImage extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onBack;
  // final Object heroTag;

  const ProductDetailsImage({
    required this.imageUrl,
    required this.onBack,
    // required this.heroTag,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            color: const Color(0xFFF8F8F8),
            child: Image.network(imageUrl, fit: BoxFit.contain),
          ),
        ),
        Positioned(
          top: 16,
          left: 16,
          child: GestureDetector(
            onTap: onBack,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFC7164F).withOpacity(0.4),
                    blurRadius: 6,
                    spreadRadius: 1,
                  )
                ],
              ),
              child: const Icon(Icons.arrow_back, color: Colors.black87),
            ),
          ),
        ),
      ],
    );
  }
}
