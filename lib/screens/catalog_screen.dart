import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wts_test_app/bloc/catalog/catalog_bloc.dart';
import 'package:wts_test_app/router/app_pages.dart';
import 'package:wts_test_app/widgets/catalog_grid.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppPages.catalog.toTitle,
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<CatalogBloc, CatalogState>(
          builder: (context, state) {
            if (state is CatalogLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  value: null,
                ),
              );
            } else if (state is CatalogLoaded) {
              return CatalogGrid(
                categories: state.categories,
                onTapCategory: (categoryId) => context.push(
                  "${AppPages.products.toPath}/$categoryId",
                ),
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
