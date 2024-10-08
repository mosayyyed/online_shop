import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helper/favourite_helper.dart';
import '../../providers/product_provider.dart';
import '../../widgets/empty_massege.dart';
import '../../widgets/home/product_item.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritesProvider>(
      builder: (context, favoritesProvider, child) {
        final favoriteIds = favoritesProvider.favoriteIds;

        return Consumer<ProductProvider>(
          builder: (context, productProvider, child) {
            if (productProvider.isLoading) {
              return const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()));
            } else if (productProvider.errorMessage != null) {
              return SliverToBoxAdapter(
                  child: Center(
                      child: Text('Error: ${productProvider.errorMessage}')));
            } else {
              final favoriteProducts =
                  productProvider.getFavoriteProducts(favoriteIds);

              if (favoriteProducts.isEmpty) {
                return const EmptyMessage(
                  image: 'assets/empty_images/empty_wishlist.png',
                  massege: 'Your wishlist is empty',
                  subMassege:
                      "Tap heart button to start saving your favorite items.",
                );
              }

              return CustomScrollView(
                slivers: [ProductItem(products: favoriteProducts)],
              );
            }
          },
        );
      },
    );
  }
}
