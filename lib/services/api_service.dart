import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/constants/api_constants.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response?> getWeatherData() async {
    try {
      final Response? response = await _dio.get(baseUrl);

      return response;
    } catch (err) {
      debugPrint(err.toString());
    }
  }
}
