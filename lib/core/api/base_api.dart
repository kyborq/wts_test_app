import 'dart:convert';

import 'package:wts_test_app/core/models/response.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class BaseApi {
  final String appKey = dotenv.env['APP_KEY']!;
  final String baseUrl = dotenv.env['BASE_URL']!;

  Future<Response> get(String endpoint, {Map<String, dynamic>? params}) async {
    final uri = Uri(
      scheme: 'http',
      host: baseUrl,
      path: '/api/$endpoint',
      queryParameters: {
        ...?params,
        'appKey': appKey,
      },
    );
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      return Response.fromJson(json);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
