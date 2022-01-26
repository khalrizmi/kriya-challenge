import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:kriya_test/core/config/app_config.dart';

class Api {
  static const int _timeoutDuration = 30000;
  late Dio _dio;

  Api() {
    _dio = Dio();
  }

  Future<dynamic> get({required String url}) async {
    BaseOptions baseOptions = BaseOptions();
    baseOptions.connectTimeout = _timeoutDuration;
    baseOptions.receiveTimeout = _timeoutDuration;

    _dio.options = baseOptions;

    Response<dynamic>? responseApi;

    try {
      String endpoint = AppConfig.baseUrl + url;
      responseApi = await _dio.get(endpoint);

      return jsonEncode(responseApi.data);
    } on DioError catch (error) {
      responseApi = error.response;
      if (kDebugMode) {
        print("Dio Error: ${error.message}");
      }
      throw Exception;
    }
  }
}
