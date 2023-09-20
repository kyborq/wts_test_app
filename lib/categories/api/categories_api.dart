import 'package:wts_test_app/api/base_api.dart';
import 'package:wts_test_app/categories/models/category_model.dart';

class CategoriesApi extends BaseApi {
  Future<List<CategoryModel>> getCategories() async {
    final rawData = await get('/api/common/category/list', {});

    final List<dynamic> data = rawData['categories'];
    return data.map<CategoryModel>((e) => CategoryModel.fromJson(e)).toList();
  }
}
