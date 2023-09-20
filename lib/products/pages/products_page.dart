import 'package:flutter/material.dart';

class ProductsArguments {
  final String title;
  final String id;

  ProductsArguments(this.title, this.id);
}

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  static const routeName = '/products';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ProductsArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: const SafeArea(
        child: Text('Hello'),
      ),
    );
  }
}
