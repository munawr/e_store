import 'package:e_store/Views/ProductsScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../Providers/CategoryProvider.dart';

class HomeScreen extends StatelessWidget {
  final Color appBarColor = Colors.teal;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: appBarColor,
    ));

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: appBarColor,
              pinned: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
              title: Text('Choose from these Items'),
              background: Image.asset(
                'assets/appbar.webp',
                fit: BoxFit.cover,
              ),
            ),
            ),
            ChangeNotifierProvider<CategoryProvider>(
              create: (_) => CategoryProvider()..fetchCategories(),
              child: Consumer<CategoryProvider>(
                builder: (context, provider, child) {
                  if (provider.isLoading) {
                    return SliverFillRemaining(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => ListTile(
                          title: InkWell(
                            onTap: () => ProductsScreen(),
                            child: SizedBox(
                              height: 50,
                              width: 100,
                              child: Center(
                                child: Text(
                                  provider.categories[index].toString(),
                                  style: TextStyle(fontSize: 20),
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
