import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../Providers/SplashProvider.dart';
import 'HomeScreen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 4)).then((_) {
      Provider.of<SplashScreenProvider>(context, listen: false).setLoading =
          false;
    });

    return Scaffold(
      body: Center(
        child: Consumer<SplashScreenProvider>(
          builder: (context, provider, child) {
            return provider.isLoading
                ? Lottie.asset('assets/loading.json', height: 100, width: 100)
                : HomeScreen();
          },
        ),
      ),
    );
  }
}
