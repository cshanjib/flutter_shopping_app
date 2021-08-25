import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiResult<T> {
  T data;
  int statusCode;
  ApiResult({this.data, this.statusCode});

  factory ApiResult.fromData(data) => _reformat(data);

  static ApiResult _reformat(response) {
    var _responseJson;
    if (response is http.Response) {
      try {
        _responseJson = json.decode(response.body);
      } catch (e) {
        _responseJson = response.body;
      }
    } else {
      _responseJson = response.data;
    }

    switch (response.statusCode) {
      case 200:
      case 204:
        return ApiResult(data: _responseJson, statusCode: response.statusCode);
      case 400:
        throw Exception("Bad Request");
      case 401:
        throw Exception("Unauthorized");
      case 500:
        throw Exception("Server Error");

      default:
        throw Exception("Error");
    }
  }
}
