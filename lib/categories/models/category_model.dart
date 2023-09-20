import 'package:json_annotation/json_annotation.dart';
import 'package:wts_test_app/categories/api/categories_api.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  CategoryModel({
    required this.categoryId,
    required this.title,
    required this.imageUrl,
  });

  final int categoryId;
  final String title;
  final String imageUrl;

  static final _categoriesApi = CategoriesApi();

  static Future<List<CategoryModel>> getCategories() async {
    final categories = await _categoriesApi.getCategories();
    return categories;
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
