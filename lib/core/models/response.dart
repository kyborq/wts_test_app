import 'package:wts_test_app/core/models/meta.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class Response {
  Response({
    required this.meta,
    required this.data,
  });

  Meta meta;
  dynamic data;

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}
