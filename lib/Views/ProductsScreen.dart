import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

import '../Providers/ProductsProvider.dart';

class ProductsScreen extends StatefulWidget {
  final String categoryName;
  const ProductsScreen({
    Key? key,
    required this.categoryName,
  }) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      body: ChangeNotifierProvider<ProductsProvider>(
        create: (_) => ProductsProvider()
          ..fetchProducts(categoryName: widget.categoryName),
        child: Consumer<ProductsProvider>(
          builder: (context, provider, child) {
            if (provider.isLoading1) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Scaffold(
                  body: AnimationLimiter(
                child: ListView.builder(
                  padding: const EdgeInsets.all(20),
                  itemCount: provider.products?.products?.length ?? 0,
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredList(
                      delay: const Duration(milliseconds: 200),
                      duration: const Duration(milliseconds: 500),
                      position: index,
                      child: SlideAnimation(
                        horizontalOffset: 100.0,
                        child: FadeInAnimation(
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                Container(
                                  height: 250,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: NetworkImage(provider.products
                                                  ?.products?[index].thumbnail ??
                                              ''),
                                          fit: BoxFit.cover)),
                                ),
                                ListTile(
                                  contentPadding: const EdgeInsets.all(20),
                                  title: Text(
                                      provider.products?.products?[index].title ??
                                          ''),
                                  subtitle: Text(provider
                                          .products?.products?[index].description
                                          .toString() ??
                                      ""),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ));
            }
          },
        ),
      ),
    );
  }
}
