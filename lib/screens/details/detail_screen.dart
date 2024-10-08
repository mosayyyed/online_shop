import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rate/rate.dart';
import 'package:untitled1/models/product_model.dart';
import 'package:untitled1/utils/constants.dart';

import '../../helper/cart_helper.dart';
import '../../helper/favourite_helper.dart';
import '../../widgets/auth/custom_button.dart';
import '../../widgets/detail/app_bar.dart';
import '../cart/cart_screen.dart';

class DetailScreen extends StatelessWidget {
  final ProductModel productModel;
  const DetailScreen({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Product Details'),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomButton(
                backgroundColor: Colors.white,
                textColor: Colors.black,
                label: 'Buy Now',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CartScreen(),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Consumer<CartProvider>(
                builder: (context, cartProvider, child) {
                  return CustomButton(
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                    label: 'Add to Cart',
                    onTap: () {
                      cartProvider.addToCart(productModel.id);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Product added to cart'),
                        backgroundColor: kPrimaryColor,
                        duration: Duration(seconds: 3),
                      ));
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        productModel.image,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    productModel.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Rate(
                        iconSize: 30,
                        color: const Color(0xFFFFAD33),
                        allowHalf: true,
                        allowClear: true,
                        initialValue: productModel.rating,
                        readOnly: true,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "(${productModel.ratingCount} Reviews)",
                        style:
                            const TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${productModel.price}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Consumer<FavoritesProvider>(
                        builder: (context, favoritesProvider, child) {
                          bool isFavorite =
                              favoritesProvider.isFavorite(productModel.id);
                          return Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              onPressed: () {
                                favoritesProvider
                                    .toggleFavorite(productModel.id);
                              },
                              icon: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isFavorite
                                    ? kPrimaryColor
                                    : Colors.grey[400],
                                size: 25,
                              ),
                              padding: const EdgeInsets.all(4),
                              splashRadius: 22,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    productModel.description,
                    style: const TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
