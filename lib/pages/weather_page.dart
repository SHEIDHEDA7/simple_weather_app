// ignore_for_file: unused_field, unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_models.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:lottie/lottie.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  // Api key
  final _weatherService =
      WeatherService(apiKey: '9bebe5cf870be5e04e3b563f9aca1505');
  Weather? _weather;

  // Fetch weather
  _fetchWeather() async {
    // Get city name
    String cityName = await _weatherService.getCurrentCity();
    //Get weather of city
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  // Weather animation
  String getWeatherAni(String? mainCondition) {
    if (mainCondition == null) return 'assets/Cloud.json'; // Default to sunny

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
        return 'assets/Cloud.json';
      case 'fog':
        return 'assets/Cloud.json';
      case 'rainy':
        return 'assets/Rainy.json';
      case 'clear':
        return 'assets/Cloud.json';
      case 'snow':
        return 'assets/Snowy.json';
      default:
        return 'assets/Rainy.json';
    }
  }

  // Initial state
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("W E A T H E R"),
        backgroundColor: Colors.yellow[700],
        leading: const Icon(
          Icons.sunny,
        ),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          // City name
          Text(_weather?.cityName ?? "Loading city...",
              style: const TextStyle(fontSize: 30)),

          // Animations
          Lottie.asset(getWeatherAni(_weather?.mainCondition)),

          // Temperature
          Text(
            "${_weather?.temp.round()}•C",
            style: const TextStyle(fontSize: 30),
          ), // Interpolation

          //Weather Condition
          Text(_weather?.mainCondition ?? "",
              style: const TextStyle(fontSize: 20))
        ]),
      ),
    );
  }
}
