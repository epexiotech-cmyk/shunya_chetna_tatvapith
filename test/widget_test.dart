import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:shunya_app/main.dart';
import 'package:shunya_app/modules/auth/auth_controller.dart';

void main() {
  testWidgets('Login screen UI elements smoke test', (WidgetTester tester) async {
    // Inject dependencies
    Get.put(AuthController());

    // Build our app and trigger a frame.
    await tester.pumpWidget(const ShunyaApp());
    
    // Wait for GetX navigation and animations
    await tester.pumpAndSettle();

    // Verify Title and Subtitle
    expect(find.text('Shunya Chetna Tatvapith'), findsOneWidget);
    expect(find.text('Doctor Login'), findsOneWidget);

    // Verify TextFields
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);

    // Verify Buttons
    expect(find.text('LOGIN'), findsOneWidget);
    expect(find.text('Create Account'), findsOneWidget);
    
    // Verify Icon
    expect(find.byIcon(Icons.spa_rounded), findsOneWidget);
  });
}
