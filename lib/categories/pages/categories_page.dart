import 'package:flutter/material.dart';
import 'package:wts_test_app/categories/models/category_model.dart';
import 'package:wts_test_app/categories/widgets/category_button.dart';
import 'package:wts_test_app/products/pages/products_page.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  static const routeName = '/';

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  late Future<List<CategoryModel>> _categories;

  void _getData() {
    _categories = CategoryModel.getCategories();
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Категории'),
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
      ),
      body: SafeArea(
        child: FutureBuilder<List<CategoryModel>>(
          future: _categories,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: snapshot.data!.length,
                clipBehavior: Clip.hardEdge,
                itemBuilder: (context, index) {
                  final category = snapshot.data![index];
                  return CategoryButton(
                    label: category.title,
                    imageUrl: category.imageUrl,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        ProductsPage.routeName,
                        arguments: ProductsArguments(category.title, 'id'),
                      );
                    },
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 1.5),
                ),
              );
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
