import 'package:dio/dio.dart';
import 'package:wts_test_app/models/catalog_model.dart';
import 'package:wts_test_app/models/products_model.dart';

class ApiClient {
  final String baseUrl = "ostest.whitetigersoft.ru";
  final String appKey;
  final Dio dio;

  ApiClient({required this.dio, required this.appKey});

  Future<List<Catalog>> getCategories() async {
    final uri = Uri(
      scheme: 'http',
      host: baseUrl,
      path: '/api/common/category/list',
      queryParameters: {
        'appKey': appKey,
      },
    );

    final response = await dio.getUri(uri);

    if (response.statusCode == 200) {
      final body = response.data['data']['categories'];
      final categories = body.map<Catalog>((e) => Catalog.fromJson(e)).toList();

      return categories;
    } else {
      throw Exception('Failed to fetch categories');
    }
  }

  Future<List<Product>> getProducts(int categoryId) async {
    final uri = Uri(
      scheme: 'http',
      host: baseUrl,
      path: '/api/common/product/list',
      queryParameters: {
        'categoryId': categoryId.toString(),
        'appKey': appKey,
      },
    );

    final response = await dio.getUri(uri);

    if (response.statusCode == 200) {
      final body = response.data['data'];
      final products = body.map<Product>((e) => Product.fromJson(e)).toList();

      return products;
    } else {
      throw Exception('Failed to fetch products');
    }
  }
}
