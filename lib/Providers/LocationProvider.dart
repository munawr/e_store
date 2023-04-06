import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import '../Models.dart/CurrentLocModel.dart';

class LocationProvider with ChangeNotifier {
  CurrentLoc? currentLoc;
  getCurrentData() async {
    
    const String apiKey = 'c0dbb6f1794640eeabf103014222805';
    final permissionStatus = await Permission.location.status;
    final position = await Geolocator.getCurrentPosition();
    final latitude = position.latitude;
    final longitude = position.longitude;

    print(permissionStatus);
    if (permissionStatus == PermissionStatus.granted) {
      final url = Uri.parse(
          'http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$latitude,$longitude&aqi=no');
      print(url);
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        currentLoc = CurrentLoc.fromJson(jsonResponse);
        print(currentLoc);

        notifyListeners();
      } else {
        throw Exception('Failed to load data.\n ${response.body}');
      }
    } else {
      await requestLocationPermission();
      throw Exception('Location permission not granted');
    }
  }

  Future<void> requestLocationPermission() async {
    final status = await Permission.location.request();
    if (status == PermissionStatus.granted) {
    } else if (status == PermissionStatus.denied) {
      throw Exception('Location permission denied.');
    } else {
      await openAppSettings();
      throw Exception('Location permission permanently denied');
    }
  }
}
