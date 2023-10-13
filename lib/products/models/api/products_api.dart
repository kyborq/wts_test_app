import 'package:wts_test_app/core/api/base_api.dart';
import 'package:wts_test_app/products/models/entities/product.dart';

class ProductsApi extends BaseApi {
  Future<List<Product>> getProducts(int id, int offset) async {
    final response = await get('common/product/list', params: {
      'categoryId': id.toString(),
      'offset': offset.toString(),
    });
    final List<dynamic> data = response.data;

    return data.map((e) => Product.fromJson(e)).toList();
  }
}
