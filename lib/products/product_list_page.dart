import 'package:flutter/material.dart';
import 'package:wts_test_app/products/models/product.dart';
import 'package:wts_test_app/products/product_list_provider.dart';
import 'package:wts_test_app/products/widgets/product_item.dart';

class ProductListPageArgs {
  final String title;
  final int id;

  ProductListPageArgs(this.title, this.id);
}

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  static const routeName = "/products";

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  late String title;
  late int categoryId;
  late ProductListProvider provider;

  final _controller = ScrollController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final settings = ModalRoute.of(context)!.settings;
    final args = settings.arguments as ProductListPageArgs;

    title = args.title;
    categoryId = args.id;

    provider = ProductListProvider(categoryId: categoryId);
    provider.loadMoreItems();

    _controller.addListener(() {
      final hasReachedEnd =
          _controller.offset >= _controller.position.maxScrollExtent - 300 &&
              !_controller.position.outOfRange;
      if (!hasReachedEnd) return;

      provider.loadMoreItems();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    provider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ValueListenableBuilder(
        valueListenable: provider,
        builder: (context, List<Product> products, child) {
          if (products.isEmpty) {
            return const CircularProgressIndicator();
          }

          return GridView.builder(
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) => ProductItem(
              product: products[index],
            ),
            controller: _controller,
          );
        },
      ),
    );
  }
}
