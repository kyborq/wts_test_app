import 'package:flutter/material.dart';
import 'package:wts_test_app/categories/models/category_list_provider.dart';
import 'package:wts_test_app/categories/models/entities/category.dart';
import 'package:wts_test_app/categories/widgets/category_item.dart';
import 'package:wts_test_app/products/product_list_page.dart';

class CategoryListPage extends StatefulWidget {
  const CategoryListPage({super.key});

  static const routeName = "/categories";

  @override
  State<CategoryListPage> createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {
  late CategoryListProvider provider;

  @override
  void initState() {
    super.initState();
    provider = CategoryListProvider();
    provider.loadItems();
  }

  @override
  void dispose() {
    provider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Категории'),
      ),
      body: ValueListenableBuilder(
        valueListenable: provider,
        builder: (context, List<Category> categories, child) {
          if (categories.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return CategoryItem(
                category: category,
                onTap: () => Navigator.pushNamed(
                  context,
                  ProductListPage.routeName,
                  arguments: ProductListPageArgs(
                    category.title,
                    category.categoryId,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
