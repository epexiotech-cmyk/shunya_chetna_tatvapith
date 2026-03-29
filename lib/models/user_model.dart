import 'package:isar/isar.dart';

part 'user_model.g.dart'; // ✅ THIS LINE IS MISSING (ADD THIS)

@collection
class UserModel {
  Id id = Isar.autoIncrement;

  late String firebaseUid;
  late String name;
  late String email;
  late String mobile;

  String? pinHash;
  bool isLoggedIn = false;
}
