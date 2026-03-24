import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final box = GetStorage();

  /// REGISTER
  void register({
    required String name,
    required String email,
    required String mobile,
    required String password,
  }) {
    box.write('user', {
      "name": name,
      "email": email,
      "mobile": mobile,
      "password": password,
    });
  }

  /// LOGIN
  bool login(String input, String password) {
    final user = box.read('user');

    if (user != null &&
        password == user['password'] &&
        (input == user['mobile'] ||
            input == user['email'] ||
            input == user['name'])) {
      box.write('isLogin', true);
      return true;
    }

    return false;
  }

  /// LOGOUT
  void logout() {
    box.write('isLogin', false);
  }

  /// CHECK LOGIN
  bool isLoggedIn() {
    return box.read('isLogin') ?? false;
  }

  /// GET USER DATA
  Map<String, dynamic>? getUser() {
    final data = box.read('user');
    if (data != null) {
      return Map<String, dynamic>.from(data);
    }
    return null;
  }
}
