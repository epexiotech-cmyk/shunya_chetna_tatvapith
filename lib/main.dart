import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shunya_app/dependency_injection.dart';
import 'package:shunya_app/services/db_service.dart';
import 'package:shunya_app/utils/validation_utils.dart';
import 'routes/app_routes.dart';
import 'routes/common/common_app_pages.dart';

void main() async {
  getIt.registerLazySingleton<FormValidations>(() => FormValidations());
  // getIt.registerLazySingleton<SnackbarHelper>(() => SnackbarHelper());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await DBService.initIsar();
  runApp(const ShunyaApp()); // 🔥 SECOND
  // 🔥 THIRD
}

class ShunyaApp extends StatelessWidget {
  const ShunyaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shunya Chetna Tatvapith',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      initialRoute: routeRootpage,
      // initialRoute: routeclinicpage,
      getPages: AppRoutes.routes,
    );
  }
}
