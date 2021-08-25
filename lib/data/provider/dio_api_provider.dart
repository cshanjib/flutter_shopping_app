import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_shopping_app/data/model/api_result.dart';

abstract class DioApiProvider{
  Future<ApiResult> get(url) async{
    try{
      final _response = await Dio().get(url);

      return ApiResult.fromData(_response);
    }on SocketException catch(e){
      throw Exception("No Internet connection");
    }on DioError catch(e){
      return ApiResult.fromData(e.response);
    }
  }

  Future<ApiResult> post(url, {data}) async{
    try{
      final _response = await Dio().post(url, data: data);

      return ApiResult.fromData(_response);
    }on SocketException catch(e){
      throw Exception("No Internet connection");
    }on DioError catch(e){
      return ApiResult.fromData(e.response);
    }
  }
}