import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:shunya_app/pages/billing/billing_binding.dart';
import 'package:shunya_app/pages/billing/billing_page.dart';
import 'package:shunya_app/pages/billing_details/billing_details_binding.dart';
import 'package:shunya_app/pages/billing_details/billing_details_page.dart';
import 'package:shunya_app/pages/clinic/clinic_binding.dart';
import 'package:shunya_app/pages/clinic/clinic_page.dart';
import 'package:shunya_app/pages/dashboard/dashboard_binding.dart';
import 'package:shunya_app/pages/dashboard/dashboard_page.dart';
import 'package:shunya_app/pages/disease/disease_binding.dart';
import 'package:shunya_app/pages/disease/disease_page.dart';
import 'package:shunya_app/pages/forget/forget_binding.dart';
import 'package:shunya_app/pages/forget/forget_page.dart';
import 'package:shunya_app/pages/inventory/add_inventory.dart';
import 'package:shunya_app/pages/inventory/inventory_binding.dart';
import 'package:shunya_app/pages/inventory/inventory_page.dart';
import 'package:shunya_app/pages/login/login_binding.dart';
import 'package:shunya_app/pages/login/login_page.dart';
import 'package:shunya_app/pages/patient/add_patient.dart';
import 'package:shunya_app/pages/patient/patient_binding.dart';
import 'package:shunya_app/pages/patient/patient_page.dart';
import 'package:shunya_app/pages/pin/pin_binding.dart';
import 'package:shunya_app/pages/pin/pin_screen.dart';
import 'package:shunya_app/pages/profile/profile_binding.dart';
import 'package:shunya_app/pages/profile/profile_page.dart';
import 'package:shunya_app/pages/register/register_binding.dart';
import 'package:shunya_app/pages/register/register_screen.dart';
import 'package:shunya_app/pages/select_medicine/select_medicine_binding.dart';
import 'package:shunya_app/pages/select_medicine/select_medicine_screen.dart';
import 'package:shunya_app/pages/splash/splash_binding.dart';
import 'package:shunya_app/pages/splash/splash_page.dart';
import 'package:shunya_app/routes/common/common_app_pages.dart';

//COMMON APP ROUTE HERE

class CommonRoutes {
  static final routes = [
    GetPage(
      name: routeRootpage,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: routeLoginpage,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: routeregisterpage,
      page: () => const RegisterScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: routedashboard,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: routeforgetpage,
      page: () => const ForgetScreen(),
      binding: ForgetBinding(),
    ),
    GetPage(
      name: routepatientpage,
      page: () => const PatientPage(),
      binding: PatientBinding(),
    ),
    GetPage(
      name: routebillingpage,
      page: () => const BillingPage(),
      binding: BillingBinding(),
    ),
    GetPage(
      name: routeinventorypage,
      page: () => const InventoryPage(),
      binding: InventoryBinding(),
    ),
    GetPage(
      name: routediseasepage,
      page: () => const DiseasePage(),
      binding: DiseaseBinding(),
    ),
    GetPage(
      name: routeprofilepage,
      page: () => const ProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: routeselectmedicinepage,
      page: () => const SelectMedicineScreen(),
      binding: SelectMedicineBinding(),
    ),
    GetPage(
      name: routebillingdetailspage,
      page: () => const BillingDetailsPage(),
      binding: BillingDetailsBinding(),
    ),
    GetPage(
      name: routepinpage,
      page: () => const PinScreen(),
      binding: PinBinding(),
    ),
    GetPage(
      name: routeclinicpage,
      page: () => const ClinicPage(),
      binding: ClinicBinding(),
    ),
    GetPage(
      name: routeaddinventory,
      page: () => const AddInventoryPage(),
      binding: InventoryBinding(),
    ),
    GetPage(
      name: routeaddpatient,
      page: () => const AddPatientPage(),
      binding: PatientBinding(),
    ),
  ];
}
