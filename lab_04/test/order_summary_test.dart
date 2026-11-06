
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab_04/order_summary.dart';

void main() {
  testWidgets('order summary displays correct details',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: OrderSummaryScreen(
          itemName: 'Cheese Pizza',
          quantity: 1,
        ),
      ),
    );

    expect(find.text('Item: Cheese Pizza'), findsOneWidget);
    expect(find.text('Quantity: 1'), findsOneWidget);
    expect(find.text('Total: RM25.00'), findsOneWidget);
  });
}
