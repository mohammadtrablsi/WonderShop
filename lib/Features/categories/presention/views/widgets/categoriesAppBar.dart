import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class CategoriesAppBar extends StatelessWidget {
  final String title;

  const CategoriesAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFFC7164F),
            ),
          ),
          IconButton(
            icon:  Icon(Icons.favorite_border, color: Styles.mainColor),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
