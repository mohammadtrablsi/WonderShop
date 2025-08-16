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
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Styles.mainColor,
            ),
          ),
          IconButton(
            icon:  Icon(Icons.notifications_none_outlined, color: Styles.mainColor),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
