class Weather {
  final String cityName;
  final double temp;
  final String mainCondition;

  Weather(
      {required this.cityName,
      required this.temp,
      required this.mainCondition});

  // *^*Create a method to deal with JSON file, to decode the info
  //factory is used so that no other insatnce of the class is created
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        cityName: json['name'],
        temp: json['main']['temp'].toDouble(),
        mainCondition: json['weather'][0]['main']);
  }
}
