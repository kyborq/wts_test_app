import 'package:json_annotation/json_annotation.dart';
import 'package:wts_test_app/categories/api/categories_api.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  Category({
    required this.categoryId,
    required this.title,
    required this.imageUrl,
  });

  int categoryId;
  String title;
  String imageUrl;

  static final _categoriesApi = CategoriesApi();

  static Future<List<Category>> getCategories() async {
    return await _categoriesApi.getList();
  }

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
