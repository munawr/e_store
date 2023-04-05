import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:e_store/Providers/LocationProvider.dart';
import 'package:e_store/Views/ProductsScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import '../Models.dart/CurrentLocModel.dart';
import '../Providers/CategoryProvider.dart';
import '../Providers/LocationProvider1.dart';

class HomeScreen extends StatelessWidget {
  final Color appBarColor = Colors.teal;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: appBarColor,
    ));
    Provider.of<LocationProvider>(context, listen: false)
        .requestLocationPermission();

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: appBarColor,
              pinned: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('Choose from these Items'),
                background: Stack(
                  fit: StackFit.loose,
                  children: [
                    Image.asset(
                      'assets/appbar.webp',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    ChangeNotifierProvider<LocationProvider>(
                        create: (context) =>
                            LocationProvider()..getCurrentData(),
                        child: Consumer<LocationProvider>(
                          builder: (context, value, child) {
                            if (value.currentLoc == null) {
                              return Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('Fetching Location'),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(15),
                                    child: CircularProgressIndicator(),
                                  ),
                                ],
                              );
                            }
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  '${value.currentLoc!.location}',
                                  style: const TextStyle(
                                    fontSize: 32.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            );
                          },
                        )),
                  ],
                ),
              ),
            ),
            ChangeNotifierProvider<CategoryProvider>(
              create: (_) => CategoryProvider()..fetchCategories(),
              child: Consumer<CategoryProvider>(
                builder: (context, provider, child) {
                  if (provider.isLoading) {
                    return const SliverFillRemaining(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => ListTile(
                          title: InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductsScreen(
                                        categoryName: provider.categories[index]
                                            .toString(),
                                      )),
                            ),
                            child: SizedBox(
                              height: 50,
                              width: 100,
                              child: Center(
                                child: Text(
                                  provider.categories[index].toString(),
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ),
                        childCount: provider.categories.length,
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
