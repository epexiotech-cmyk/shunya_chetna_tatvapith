import 'package:isar/isar.dart';

part 'disease_model.g.dart';

@collection
class DiseaseModel {
  Id id = Isar.autoIncrement;

  late String userId; // 🔥 IMPORTANT

  late String name;
}
