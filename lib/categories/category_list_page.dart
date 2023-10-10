import 'package:flutter/material.dart';
import 'package:wts_test_app/categories/models/category.dart';
import 'package:wts_test_app/categories/widgets/category_item.dart';
import 'package:wts_test_app/products/products_list_page.dart';

class CategoryListPage extends StatelessWidget {
  const CategoryListPage({super.key});

  static const routeName = "/categories";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Категории'),
      ),
      body: FutureBuilder<List<Category>>(
        future: Category.getCategories(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final category = snapshot.data![index];
                return CategoryItem(
                  category: category,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ProductListPage.routeName,
                      arguments: ProductListPageArgs(
                        category.title,
                        category.categoryId,
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
