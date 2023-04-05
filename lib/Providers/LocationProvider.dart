import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
// Assuming a file called Models.dart inside the same folder has the CurrentLoc class
import '../Models.dart/CurrentLocModel.dart';

class LocationProvider with ChangeNotifier {
  Future<CurrentLoc?> getCurrentData() async {
    // Location? locationData = await GetLoctionProvider().getLoc();
    CurrentLoc? currentLoc;
    const String apiKey = 'c0dbb6f1794640eeabf103014222805';
    final position = await Geolocator.getCurrentPosition();
    final latitude = position.latitude;
    final longitude = position.longitude;
    final permissionStatus = await Permission.location.status;

    if (permissionStatus == PermissionStatus.granted) {
      final url = Uri.parse(
          'http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$latitude,$longitude&aqi=no');

      final response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        currentLoc = CurrentLoc.fromJson(jsonResponse);
        ChangeNotifier();
        return currentLoc;
      } else {
        throw Exception('Failed to load data.\n ${response.body}');
      }
    } else {
      // When location permission is not granted, the app should prompt user for permission
      await requestLocationPermission();
      throw Exception('Location permission not granted');
    }
  }

  CurrentLoc? currentLoc;

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
