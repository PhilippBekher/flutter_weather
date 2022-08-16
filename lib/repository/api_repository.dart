import 'package:flutter_application_1/models/weather_model.dart';

import '../services/api_service.dart';

class ApiRepository {
  ApiRepository({
    required this.apiService,
  });

  final ApiService apiService;
  Future<Weather> getWeather() async {
    final response = await apiService.getWeatherData();

    final data = response?.data;

    return Weather.fromJson(data);
  }
}
