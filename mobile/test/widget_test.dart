import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/app.dart';

void main() {
  testWidgets('Home screen smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our welcome text is present.
    expect(find.text('Your Wardrobe'), findsOneWidget);
    expect(find.text('Welcome back, 👋'), findsOneWidget);

    // Verify that the bottom navigation bar is present.
    expect(find.byType(BottomNavigationBar), findsOneWidget);

    // Verify that the FloatingActionButton is present.
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });
}
