import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/providers/product_provider.dart';
import 'package:untitled1/screens/payment/payment_screen.dart';
import 'package:untitled1/widgets/product_card.dart';

import '../../helper/cart_helper.dart';
import '../../utils/constants.dart';
import '../../widgets/auth/custom_button.dart';
import '../../widgets/empty_massege.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your Cart",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 16, top: 16),
        color: Colors.white,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16.0),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey.shade300, width: 1.0),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total: ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Consumer<CartProvider>(
                    builder: (context, cartProvider, child) {
                      return Text(
                        "\$ ${cartProvider.totalPrice(context).toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CustomButton(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PaymentScreen(),
                  ));
                },
                backgroundColor: Colors.black,
                textColor: Colors.white,
                label: 'Proceed to Checkout',
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Delivery to',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Cairo, Egypt',
                  style: TextStyle(fontSize: 16.0, color: Colors.black54),
                ),
              ],
            ),
          ),
          Expanded(
            child: Consumer<CartProvider>(
              builder: (context, cartProvider, child) {
                final cartIds = cartProvider.cartProductIds;
                return Consumer<ProductProvider>(
                  builder: (context, productProvider, child) {
                    if (productProvider.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (productProvider.errorMessage != null) {
                      return Center(
                        child: Text(
                          'Error: ${productProvider.errorMessage}',
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
                    } else {
                      final cartProducts =
                          productProvider.getCartProducts(cartIds);
                      if (cartProducts.isEmpty) {
                        return const EmptyMessage(
                          image: 'assets/empty_images/empty_cart.png',
                          massege: 'Your cart is empty',
                          subMassege:
                              "Looks like you have not added anything in your cart. Go ahead and explore top categories.",
                        );
                      }
                      return ProductCard(products: cartProducts);
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
