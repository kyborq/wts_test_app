import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class BaseApi {
  final String appKey = dotenv.env['APP_KEY']!;
  final String baseUrl = dotenv.env['BASE_URL']!;

  Future<Map<String, dynamic>> get(
    String path,
    Map<String, dynamic> parameters,
  ) async {
    final Uri uri = Uri(
      scheme: 'http',
      host: baseUrl,
      path: path,
      queryParameters: {
        ...parameters,
        'appKey': appKey,
      },
    );

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return json.decode(response.body)['data'];
    } else {
      throw Exception('Failed to make a request');
    }
  }
}
