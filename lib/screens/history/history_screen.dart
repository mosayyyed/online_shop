import 'package:flutter/material.dart';

import '../../widgets/empty_massege.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: EmptyMessage(
        image: 'assets/empty_images/empty_orders.png',
        massege: 'No ongoing order',
        subMassege:
            "We currently don't have any active orders in progress. Feel free to explore our products and place a new order.zz",
      ),
    );
  }
}
