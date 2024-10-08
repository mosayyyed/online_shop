import 'package:flutter/material.dart';

import '../../models/product_model.dart';
import 'product_card.dart';

class ProductItem extends StatelessWidget {
  final List<ProductModel> products;

  const ProductItem({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 0.7,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final productModel = products[index];
            return ProductCard(productModel: productModel);
          },
          childCount: products.length,
        ),
      ),
    );
  }
}
