import 'package:flutter/material.dart';
import 'package:wts_test_app/categories/models/category.dart';
import 'package:wts_test_app/core/widgets/network_image_fallback.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
    required this.onTap,
  });

  final Category category;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(category.title),
      leading: NetworkImageFallback(
        imageUrl: category.imageUrl,
        width: 100,
        height: 100,
      ),
      onTap: onTap,
    );
  }
}
