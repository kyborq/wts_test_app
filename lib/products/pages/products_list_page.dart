import 'package:flutter/material.dart';
import 'package:wts_test_app/products/models/product.dart';
import 'package:wts_test_app/products/widgets/product_item.dart';

class ProductsPageArgs {
  final String title;
  final int id;

  ProductsPageArgs(this.title, this.id);
}

class ProductsListPage extends StatefulWidget {
  const ProductsListPage({super.key});

  static const routeName = "/products";

  @override
  State<ProductsListPage> createState() => _ProductsListPageState();
}

class _ProductsListPageState extends State<ProductsListPage> {
  late int categoryId;
  late int offset;
  late String title;

  late Future<List<Product>> products;
  List<Product> productsList = [];

  final _controller = ScrollController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)!.settings.arguments as ProductsPageArgs;

    categoryId = args.id;
    title = args.title;
    offset = 0;

    products = _getProducts();
  }

  Future<List<Product>> _getProducts() async {
    List<Product> newProducts = await Product.getProducts(categoryId, offset);

    setState(() {
      productsList.addAll(newProducts);
      offset = productsList.length;
    });

    return productsList;
  }

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      final hasReachedEnd =
          _controller.offset >= _controller.position.maxScrollExtent &&
              !_controller.position.outOfRange;
      if (!hasReachedEnd) return;

      _getProducts();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<List<Product>>(
        future: products,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              itemCount: snapshot.data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (ctx, i) => ProductItem(
                product: snapshot.data![i],
              ),
              controller: _controller,
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
