// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:bia_energy_prueba/src/view/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bia_energy_prueba/main.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('MyWidget should display text', (WidgetTester tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        home: SplashScreen(),
      ),
    );
    expect(find.text('Hello, World!'), findsOneWidget);
  });
}
