import 'package:flutter/material.dart';
import 'package:wts_test_app/products/models/api/products_api.dart';
import 'package:wts_test_app/products/models/entities/product.dart';

class ProductListProvider extends ValueNotifier<List<Product>> {
  ProductListProvider({required this.categoryId}) : super([]);

  ProductsApi api = ProductsApi();

  int categoryId;
  bool isLoading = false;
  bool isLoadedAll = false;

  Future<void> loadMoreItems() async {
    if (isLoading || isLoadedAll) return;

    isLoading = true;

    List<Product> products = await api.getProducts(categoryId, value.length);
    value.addAll(products);

    isLoading = false;
    isLoadedAll = true;

    notifyListeners();
  }

  Future<void> reload() async {
    if (isLoading) return;

    value.clear();
    notifyListeners();
    await loadMoreItems();
  }
}
