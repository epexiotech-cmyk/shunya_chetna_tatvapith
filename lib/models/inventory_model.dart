import 'package:isar/isar.dart';

part 'inventory_model.g.dart';

@collection
class InventoryModel {
  Id id = Isar.autoIncrement;

  late String userId;

  late String name;
  late String type;
  late String use;
}
