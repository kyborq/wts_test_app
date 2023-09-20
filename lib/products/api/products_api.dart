import 'package:wts_test_app/api/base_api.dart';

const categoryListApi = '/api/common/category/list';

class ProductsApi extends BaseApi {
  void getProducts(String id) async {
    final data = await get(categoryListApi, {});

    // ignore: avoid_print
    print(data);

    // if (response['meta']['success']) {
    //   final List<dynamic> data = response['data']['categories'];
    //   return data.map<Catalog>((e) => Catalog.fromJson(e)).toList();
    // } else {
    //   throw Exception('Failed to fetch categories');
    // }
  }
}
