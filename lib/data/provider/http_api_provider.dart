import 'dart:io';

import 'package:flutter_shopping_app/data/model/api_result.dart';
import 'package:http/http.dart' as http;

abstract class HttpApiProvider{
  Future<ApiResult> get(url) async{
    try{
      final _response = await http.get(Uri.parse(url));

      return ApiResult.fromData(_response);
    }on SocketException catch(e){
      throw Exception("No Internet connection");
    }
  }

  Future<ApiResult> post(url, {data}) async{
    try{
      final _response = await http.post(url, body: data);

      return ApiResult.fromData(_response);
    }on SocketException catch(e){
      throw Exception("No Internet connection");
    }
  }
}