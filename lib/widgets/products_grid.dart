import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wts_test_app/models/products_model.dart';
import 'package:wts_test_app/widgets/products_item.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    Key? key,
    required this.products,
  }) : super(key: key);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StaggeredGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 2,
        crossAxisSpacing: 16,
        children: [
          for (var i = 0; i < products.length - 1; i++)
            ProductsItem(
              imageUrl: products[i].imageUrl,
              title: products[i].title,
              price: products[i].price,
            ),
        ],
      ),
    );
  }
}
