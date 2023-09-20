import 'package:json_annotation/json_annotation.dart';
import 'package:wts_test_app/products/api/products_api.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  ProductModel({
    required this.title,
    this.imageUrl,
    this.price,
  });

  final String title;
  final String? imageUrl;
  final int? price;

  final _productsApi = ProductsApi();

  List<ProductModel> getProducts(String id) {
    _productsApi.getProducts(id);

    return [];
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
