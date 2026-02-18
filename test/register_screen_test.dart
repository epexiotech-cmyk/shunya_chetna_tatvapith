import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:shunya_app/modules/auth/auth_controller.dart';
import 'package:shunya_app/modules/auth/register_screen.dart';

void main() {
  testWidgets('Register screen UI elements smoke test', (WidgetTester tester) async {
    // Inject dependencies
    final controller = Get.put(AuthController());

    // Build RegisterScreen wrapped in GetMaterialApp
    await tester.pumpWidget(GetMaterialApp(
      home: const RegisterScreen(),
    ));
    
    // Wait for animations
    await tester.pumpAndSettle();

    // Verify Title and Subtitle
    expect(find.text('Create Account'), findsOneWidget);
    expect(find.text('Join Shunya Chetna Tatvapith'), findsOneWidget);

    // Verify TextFields
    expect(find.byType(TextField), findsNWidgets(4)); // Name, Email, Password, Confirm Password
    expect(find.text('Doctor Name'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Confirm Password'), findsOneWidget);

    // Verify Buttons
    expect(find.text('REGISTER'), findsOneWidget);
    expect(find.text('Back to Login'), findsOneWidget);
  });
}
