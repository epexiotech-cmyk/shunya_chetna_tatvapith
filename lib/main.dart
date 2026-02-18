import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/app_routes.dart';
import 'routes/common/common_app_pages.dart';

void main() {
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
