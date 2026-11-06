import 'package:flutter/material.dart';
import 'order.dart';

class OrderSummaryScreen extends StatelessWidget {
  final String itemName;
  final int quantity;

  const OrderSummaryScreen({
    super.key,
    required this.itemName,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    final double total = orderTotal(quantity);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Summary'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Item: $itemName'),
            Text('Quantity: $quantity'),
            Text('Total: RM${total.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}
