import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:shunya_app/main.dart';
import 'package:shunya_app/pages/dashboard/dashboard_page.dart';
import 'package:shunya_app/pages/login/login_page.dart';
import 'package:shunya_app/pages/splash/splash_page.dart';

void main() {
  testWidgets('Navigation Flow Test: Splash -> Login -> Dashboard', (
    WidgetTester tester,
  ) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ShunyaApp());

    // 1. Verify Splash Screen
    expect(find.byType(SplashPage), findsOneWidget);
    expect(find.text('Shunya Chetna Tatvapith'), findsOneWidget);

    // Trigger the 2-second delay
    await tester.pump(const Duration(seconds: 2));
    // Settle any animations/transitions
    await tester.pumpAndSettle();

    // 2. Verify Login Screen
    expect(find.byType(LoginPage), findsOneWidget);
    expect(find.text('Doctor Login'), findsOneWidget);

    // Enter credentials
    await tester.enterText(
      find.widgetWithText(TextField, 'Email'),
      'test@doctor.com',
    );
    await tester.enterText(
      find.widgetWithText(TextField, 'Password'),
      'password123',
    );

    // Tap Login Button
    await tester.tap(find.text('Login'));

    // Trigger the frames for the loading state (initial tap + state change)
    await tester.pump();

    // Verify loading indicator is shown (Login button text gone)
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text('Login'), findsNothing);

    // Trigger the 1-second login delay
    await tester.pump(const Duration(seconds: 1));
    // Settle navigation
    await tester.pumpAndSettle();

    // 3. Verify Dashboard Screen
    expect(find.byType(DashboardPage), findsOneWidget);
    expect(find.text('Welcome Doctor'), findsOneWidget);
  });
}
