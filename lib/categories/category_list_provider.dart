import 'package:flutter/material.dart';
import 'package:wts_test_app/categories/api/categories_api.dart';
import 'package:wts_test_app/categories/models/category.dart';

class CategoryListProvider extends ValueNotifier<List<Category>> {
  CategoryListProvider() : super([]);

  CategoriesApi api = CategoriesApi();

  Future<void> loadItems() async {
    List<Category> categories = await api.getList();
    value = categories;

    notifyListeners();
  }

  Future<void> reload() async {
    value.clear();
    notifyListeners();
    await loadItems();
  }
}
