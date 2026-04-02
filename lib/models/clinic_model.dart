import 'package:isar/isar.dart';

part 'clinic_model.g.dart';

@collection
class ClinicModel {
  Id id = Isar.autoIncrement;

  late String doctorName;
  late String clinicName;
  late String address;
  late String mobile;
  late String upiId;
  late String qualification;
}
