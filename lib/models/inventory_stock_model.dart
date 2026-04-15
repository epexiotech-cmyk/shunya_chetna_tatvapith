import 'package:isar/isar.dart';

part 'inventory_stock_model.g.dart';

@collection
class InventoryStockModel {
  Id id = Isar.autoIncrement;

  late String userId;
  late String clinicId;

  late int inventoryId;

  late int qty;
  late int price;
}
