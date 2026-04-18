import 'package:isar/isar.dart';

part 'visit_model.g.dart';

@collection
class VisitModel {
  Id id = Isar.autoIncrement;

  /// 🔗 relation
  late int patientId;

  /// 📅 visit date
  late String date;

  /// 🧾 details
  late String problem;
  late String observation;

  /// 💊 medicines
  List<String> medicines = [];

  /// 📄 pdf paths
  List<String> pdfPaths = [];
}
