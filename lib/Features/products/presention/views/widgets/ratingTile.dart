import 'package:flutter/material.dart';

class RatingTile extends StatelessWidget {
  const RatingTile({super.key, required this.rating, this.onTap});
  final int rating;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          rating,
              (i) => const Icon(Icons.star, color: Color(0xFFC7164F), size: 16),
        ),
      ),
      title: Text("Rating ≥ $rating"),
      onTap: onTap,
    );
  }
}