// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/models/failure_model.dart';
import 'package:meta/meta.dart';

import '../../models/weather_model.dart';
import '../../repository/api_repository.dart';

part 'weather_fetch_state.dart';

class WeatherFetchCubit extends Cubit<WeatherFetchState> {
  final ApiRepository apiRepository;

  WeatherFetchCubit({required this.apiRepository})
      : super(WeatherFetchInitial());

  Future<void> fetchWeatherApi() async {
    emit(WeatherFetchLoading());

    try {
      final Weather weather = await apiRepository.getWeather();
      print('hello');

      emit(WeatherFetchLoaded(weather: weather));
    } on Failure catch (err) {
      emit(WeatherFetchError(failure: err));
    } catch (err) {
      print(err);
    }
  }
}
