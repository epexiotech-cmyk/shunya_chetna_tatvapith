import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shunya_app/routes/common/common_app_pages.dart';

class PinController extends GetxController {
  final storage = const FlutterSecureStorage();

  /// 🔥 4 BOX CONTROLLERS
  List<TextEditingController> pinBoxes = List.generate(
    4,
    (_) => TextEditingController(),
  );

  List<TextEditingController> confirmBoxes = List.generate(
    4,
    (_) => TextEditingController(),
  );

  List<FocusNode> pinFocus = List.generate(4, (_) => FocusNode());

  List<FocusNode> confirmFocus = List.generate(4, (_) => FocusNode());

  RxBool isSetMode = true.obs;
  RxBool isResetMode = false.obs;

  @override
  void onInit() {
    super.onInit();

    final args = Get.arguments;

    if (args != null) {
      isSetMode.value = args["isSet"] ?? false;
      isResetMode.value = args["isReset"] ?? false;
    }
  }

  /// 🔥 GET PIN STRING
  String get enteredPin => pinBoxes.map((e) => e.text).join();

  String get confirmPin => confirmBoxes.map((e) => e.text).join();

  /// SAVE / RESET PIN
  Future<void> saveOrResetPin() async {
    if (enteredPin.length != 4 || confirmPin.length != 4) {
      Get.snackbar("Error", "Enter 4 digit PIN");
      return;
    }

    if (enteredPin != confirmPin) {
      Get.snackbar("Error", "PIN does not match");
      return;
    }

    await storage.write(key: "app_pin", value: enteredPin);

    Get.offAllNamed('/dashboard');
  }

  /// VERIFY PIN
  Future<void> verifyPin() async {
    String? savedPin = await storage.read(key: "app_pin");

    if (enteredPin == (savedPin ?? "")) {
      Get.offAllNamed(routedashboard);
    } else {
      Get.snackbar("Error", "Wrong PIN");
    }
  }

  @override
  void onClose() {
    for (var c in pinBoxes) {
      c.dispose();
    }
    for (var c in confirmBoxes) {
      c.dispose();
    }
    for (var f in pinFocus) {
      f.dispose();
    }
    for (var f in confirmFocus) {
      f.dispose();
    }
    super.onClose();
  }
}
