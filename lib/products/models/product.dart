import 'package:json_annotation/json_annotation.dart';
import 'package:wts_test_app/products/api/products_api.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  int productId;
  String title;
  int price;
  String imageUrl;

  Product({
    required this.productId,
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  static final _productsApi = ProductsApi();

  static Future<List<Product>> getProducts(int id, int offset) async {
    return await _productsApi.getProducts(id, offset);
  }

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
