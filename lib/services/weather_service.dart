// ignore_for_file: dead_code, unused_element

import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../models/weather_models.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static const BASE_URL = 'http://api.openweathermap.org/data/2.5/weather';
  final String apiKey;

  WeatherService({required this.apiKey});

  // ***^*** Getting the loaction of user by asking permission
  Future<String> getCurrentCity() async {
    // Gets for permission
    LocationPermission permission = await Geolocator.checkPermission();

    // If denied requests it
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    // ***^*** Fetch the current location
    // It takes the location in the for of latitudes and longitudes
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // Convert the loction into List of placemark objects, i.e Coordinates
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    // Extract city name from first placemark
    String? city = placemarks[0].locality;

    return city ?? " ";
  }

  // Future
  Future<Weather> getWeather(String cityName) async {
    // ***^*** So in order to access url from web use http.get method
    final response = await http
        .get(Uri.parse('$BASE_URL?q=$cityName&appid=$apiKey&units=metric'));

    // ***^*** Decoding the value recieved from web
    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Weather data');
    }
  }
}
