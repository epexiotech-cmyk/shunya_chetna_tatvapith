import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../pages/dashboard/dashboard_binding.dart';
import '../../pages/dashboard/dashboard_page.dart';
import '../../pages/login/login_binding.dart';
import '../../pages/login/login_page.dart';
import '../../pages/splash/splash_binding.dart';
import '../../pages/splash/splash_page.dart';
import 'common_app_pages.dart';

// PLACEHOLDER BINDINGS
// (Other bindings will be moved to separate files as modules are implemented)

class PatientsBinding extends Bindings {
  @override
  void dependencies() {}
}

class AddVisitBinding extends Bindings {
  @override
  void dependencies() {}
}

class BillingBinding extends Bindings {
  @override
  void dependencies() {}
}

class InventoryBinding extends Bindings {
  @override
  void dependencies() {}
}

// GETPAGE ROUTES
class CommonRoutes {
  static final routes = [
    GetPage(
      name: routeRootpage,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: routeLoginpage,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: routeDashboardpage,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: routePatientsPage,
      page: () => const Scaffold(body: Center(child: Text("Patients Page"))),
      binding: PatientsBinding(),
    ),
    GetPage(
      name: routeAddVisitPage,
      page: () => const Scaffold(body: Center(child: Text("Add Visit Page"))),
      binding: AddVisitBinding(),
    ),
    GetPage(
      name: routeBillingPage,
      page: () => const Scaffold(body: Center(child: Text("Billing Page"))),
      binding: BillingBinding(),
    ),
    GetPage(
      name: routeInventoryPage,
      page: () => const Scaffold(body: Center(child: Text("Inventory Page"))),
      binding: InventoryBinding(),
    ),
  ];
}
