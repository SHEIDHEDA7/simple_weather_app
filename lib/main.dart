// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weather_app/pages/weather_page.dart';

void main() {
  runApp(const MyApp());
}

//In ios info.plist add
//

// For android add in src/main/manifest/
// <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
//  <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>

/* ***^***
First of all you need to download some 
packages from termial. 
To download type - flutter pub add package_name
•http
•geolocator
•geocoding
•lottie  -  for nice animations
*/

/* Geoloactor
Features-
Get the last known location;
Get the current location of the device;
Get continuous location updates;
Check if location services are enabled on the device;
Calculate the distance (in meters) between two geocoordinates;
Calculate the bearing between two geocoordinates;
*/

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherPage(),
    );
  }
}
