
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab_04/menu.dart';

void main() {
  testWidgets('menu displays all three items',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: MenuScreen()),
    );

    expect(find.text('Vegetable Pizza'), findsOneWidget);
    expect(find.text('Cheese Pizza'), findsOneWidget);
    expect(find.text('Box of Fries'), findsOneWidget);
  });

  testWidgets('tapping vegetable pizza opens detail screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: const MenuScreen(),
        routes: {
          'vegetable': (context) => Scaffold(
                appBar: AppBar(title: const Text('Vegetable Pizza')),
                body: const Text('Vegetable Pizza is a pizza'),
              ),
        },
      ),
    );

    await tester.tap(find.text('Vegetable Pizza'));
    await tester.pumpAndSettle();

    expect(find.text('Vegetable Pizza is a pizza'), findsOneWidget);
  });

  testWidgets('back button returns to menu',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: const MenuScreen(),
        routes: {
          'vegetable': (context) => Scaffold(
                appBar: AppBar(title: const Text('Vegetable Pizza')),
                body: const Text('Vegetable Pizza is a pizza'),
              ),
        },
      ),
    );

    await tester.tap(find.text('Vegetable Pizza'));
    await tester.pumpAndSettle();

    await tester.pageBack();
    await tester.pumpAndSettle();

    expect(find.text('Cheese Pizza'), findsOneWidget);
    expect(find.text('Box of Fries'), findsOneWidget);
  });
}
