import 'package:dio/dio.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/api/api_consumer.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/api/api_endpoint.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/api/api_interceptor.dart';
import '../error/exception.dart';

class DioConsumer extends ApiCounsumer{
  final Dio dio;
  DioConsumer({required this.dio}){
    dio.options.baseUrl =EndPoint.baseUrl;
    dio.interceptors.add(ApiInterceptor());
    dio.interceptors.add(LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true
    ));
  }
  @override
  Future delete(
      String path, {
        dynamic data,
        Map<String, dynamic>? queryparameter,
        bool isFormData=false
      }) async{
    try {
      final response=await dio.delete(path,
        data:isFormData?FormData.fromMap(data): data,
        queryParameters: queryparameter,
      );
      return response.data;
    } on DioException catch (e) {
      HandelDioException(e);
    }
  }

  @override
  Future get(
      String path, {
        dynamic data,
        Map<String, dynamic>? queryparameter,
        bool isFormData=false
      }) async{
    try{
      final response=await dio.get(path,
          data:isFormData?FormData.fromMap(data): data,
          queryParameters: queryparameter
      );
      return response.data;
    }on DioException catch (e){
      HandelDioException(e);
    }
  }

  @override
  Future patch(
      String path, {
        dynamic data,
        Map<String, dynamic>? queryparameter,
        bool isFormData=false
      }) async {
    try{
      final response=await dio.patch(path,
          data:isFormData?FormData.fromMap(data): data,
          queryParameters: queryparameter
      );
      return response.data;
    }on DioException catch (e){
      HandelDioException(e);
    }
  }

  @override
  Future post(
      String path, {
        dynamic data,
        Map<String, dynamic>? queryparameter,
        bool isFormData =false
      })async {
    try{
      final response=await dio.post(path,
          data:isFormData?FormData.fromMap(data): data,
          queryParameters: queryparameter
      );
      return response.data;
    }on DioException catch (e){
      HandelDioException(e);
    }
  }
}