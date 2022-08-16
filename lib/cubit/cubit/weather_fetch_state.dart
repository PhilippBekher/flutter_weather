// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'weather_fetch_cubit.dart';

@immutable
abstract class WeatherFetchState extends Equatable {
  const WeatherFetchState();

  @override
  List<Object> get props => [];
}

class WeatherFetchLoading extends WeatherFetchState {}

class WeatherFetchLoaded extends WeatherFetchState {
  final Weather weather;

  WeatherFetchLoaded({
    required this.weather,
  });

  @override
  // TODO: implement props
  List<Object> get props => [weather];
}

class WeatherFetchInitial extends WeatherFetchState {}

class WeatherFetchError extends WeatherFetchState {
  final Failure failure;

  WeatherFetchError({
    required this.failure,
  });
  @override
  // TODO: implement props
  List<Object> get props => [failure];
}
