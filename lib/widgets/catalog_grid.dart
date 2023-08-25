import 'package:flutter/material.dart';
import 'package:wts_test_app/models/catalog_model.dart';
import 'package:wts_test_app/widgets/catalog_item.dart';

typedef OnTapCategoryCallback = void Function(int categoryId);

class CatalogGrid extends StatelessWidget {
  const CatalogGrid({
    Key? key,
    required this.categories,
    required this.onTapCategory,
  }) : super(key: key);

  final List<Catalog> categories;
  final OnTapCategoryCallback onTapCategory;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: categories.length,
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        final category = categories[index];
        return CatalogItem(
          imageUrl: category.imageUrl,
          title: category.title,
          onTap: () {
            onTapCategory(category.categoryId);
          },
        );
      },
    );
  }
}
