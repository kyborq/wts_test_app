import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:wts_test_app/categories/pages/categories_list_page.dart';
import 'package:wts_test_app/products/pages/products_list_page.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eShop',
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: CategoriesListPage.routeName,
      routes: {
        CategoriesListPage.routeName: (context) => const CategoriesListPage(),
        ProductsListPage.routeName: (context) => const ProductsListPage(),
      },
    );
  }
}
