import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shunya_app/auth_controller.dart';
import 'package:shunya_app/dependency_injection.dart';
import 'package:shunya_app/utils/validation_utils.dart';
import 'routes/app_routes.dart';
import 'routes/common/common_app_pages.dart';

void main() async {
  getIt.registerLazySingleton<FormValidations>(() => FormValidations());
  // getIt.registerLazySingleton<SnackbarHelper>(() => SnackbarHelper());
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put(AuthController(), permanent: true);
  runApp(const ShunyaApp());
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
      getPages: AppRoutes.routes,
    );
  }
}
