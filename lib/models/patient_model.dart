import 'package:isar/isar.dart';

part 'patient_model.g.dart';

@collection
class PatientModel {
  Id id = Isar.autoIncrement;

  late String userId;

  late String name;
  late String mobile;
  late String gender;
  late String dob;
  late String age;
  late String bloodGroup;
  late String maritalStatus;
  late String address;
  late String village;
  late String weight;
  late String height;
  late String bpCount;
  late String sugarLevel;
}
