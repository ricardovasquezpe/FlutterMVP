import 'dart:io';
import 'package:dio/dio.dart';
import 'Constants.dart';
class Network{
  Dio dio;
  static final RESPONSE_STATUS_SUCCCESS = 200;
  static final HEADERS = {
    HttpHeaders.contentTypeHeader: "application/json"
  };
  Network(){
    BaseOptions options = new BaseOptions(
      baseUrl: URL_BASE_API,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    dio = new Dio(options);
  }

}