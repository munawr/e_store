// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:location/location.dart';
// // import 'package:permission_handler/permission_handler.dart';

// import '../Models.dart/MapToAddressModel.dart';

// class LocationProvider with ChangeNotifier {
//   MapToAddress? mapData;

//   static String pathUrl = "https://nominatim.openstreetmap.org";

//   getAddrsDetails() async {
//     LocationData? locationData = await GetLoctionProvider().getLoc();
//     var response = await Dio().get(
//         '$pathUrl/reverse?lat=${locationData?.latitude ?? '10.1632'}&lon=${locationData?.latitude ?? '76.6413'}&format=jsonv2');

//     print(response.data);
//     if (response.statusCode == 200) {
//       ChangeNotifier();
//       mapData= MapToAddress.fromJson(response.data);
//     } else {
//       throw 'error';
//     }
//   }
// }

// class GetLoctionProvider with ChangeNotifier {
//   Future<LocationData?> getLoc() async {
//     Location location = new Location();

//     bool _serviceEnabled;
//     PermissionStatus _permissionGranted;
//     LocationData _locationData;

//     _serviceEnabled = await location.serviceEnabled();
//     if (!_serviceEnabled) {
//       _serviceEnabled = await location.requestService();
//       if (!_serviceEnabled) {
//         return null;
//       }
//     }

//     _permissionGranted = await location.hasPermission();
//     if (_permissionGranted == PermissionStatus.denied) {
//       _permissionGranted = await location.requestPermission();
//       if (_permissionGranted != PermissionStatus.granted) {
//         return null;
//       }
//     }

//     _locationData = await location.getLocation();
//     ChangeNotifier();
//     return _locationData;
//   }
// }
