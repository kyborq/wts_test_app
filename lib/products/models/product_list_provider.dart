import 'package:flutter/material.dart';
import 'package:wts_test_app/products/models/api/products_api.dart';
import 'package:wts_test_app/products/models/entities/product.dart';

class ProductListProvider extends ValueNotifier<List<Product>> {
  ProductListProvider({required this.categoryId}) : super([]);

  ProductsApi api = ProductsApi();
  int offset = 0;
  int categoryId;
  bool isLoading = false;

  Future<void> loadMoreItems() async {
    if (isLoading) return;

    isLoading = true;

    List<Product> products = await api.getProducts(categoryId, offset);
    value = [...value, ...products];
    isLoading = false;

    notifyListeners();
    offset += products.length;
  }

  Future<void> reload() async {
    value.clear();
    offset = 0;
    notifyListeners();
    await loadMoreItems();
  }
}
