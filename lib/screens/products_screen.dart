import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wts_test_app/bloc/products/products_bloc.dart';
import 'package:wts_test_app/router/app_pages.dart';
import 'package:wts_test_app/widgets/products_grid.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key, required this.catalogId});

  final int catalogId;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    super.initState();

    context
        .read<ProductsBloc>()
        .add(FetchProducts(catalogId: widget.catalogId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppPages.products.toTitle,
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            if (state is ProductsLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  value: null,
                ),
              );
            } else if (state is ProductsLoaded) {
              return ProductsGrid(
                products: state.products,
              );
            }

            return const Center(
              child: Text(
                'Error while loading',
                style: TextStyle(color: Colors.red),
              ),
            );
          },
        ),
      ),
    );
  }
}
