import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Providers/CategoryProvider.dart';
import 'Providers/LocationProvider.dart';
import 'Providers/LocationProvider1.dart';
import 'Providers/ProductsProvider.dart';
import 'Providers/SplashProvider.dart';
import 'Views/SplashScreen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashScreenProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => ProductsProvider()),
        ChangeNotifierProvider(create: (_) => LocationProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E Store',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: SplashScreen(),
    );
  }
}
