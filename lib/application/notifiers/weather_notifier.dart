import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/application/states/api_state.dart';
import 'package:weather/domain/networking/network_exception.dart';
import 'package:weather/domain/repository/base_weather_repository.dart';
import 'package:weather/infrastructure/Model/weather_model/weather_data.dart';

class WeatherStateNotifer
    extends StateNotifier<ApiRequestState<WeatherData, String>> {
  final WeatherRepository weatherRepository;
  final String cityName;

  WeatherStateNotifer(
    this.weatherRepository,
    this.cityName,
  ) : super(const ApiRequestState.idle()) {
    getWeather(cityName);
  }

  Future<void> getWeather(String cityName) async {
    try {
      state = const ApiRequestState.loading();
      var data = await weatherRepository.getWeather(cityName);
      state = ApiRequestState<WeatherData, String>.data(data: data);
    } on NetworkException catch (e) {
      // print(e.toString());
      state = ApiRequestState.failed(
        reason: e.message,
      );
    }
  }
}
