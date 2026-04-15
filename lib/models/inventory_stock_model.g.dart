// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_stock_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetInventoryStockModelCollection on Isar {
  IsarCollection<InventoryStockModel> get inventoryStockModels =>
      this.collection();
}

const InventoryStockModelSchema = CollectionSchema(
  name: r'InventoryStockModel',
  id: 6701256960216229297,
  properties: {
    r'clinicId': PropertySchema(
      id: 0,
      name: r'clinicId',
      type: IsarType.string,
    ),
    r'inventoryId': PropertySchema(
      id: 1,
      name: r'inventoryId',
      type: IsarType.long,
    ),
    r'price': PropertySchema(
      id: 2,
      name: r'price',
      type: IsarType.long,
    ),
    r'qty': PropertySchema(
      id: 3,
      name: r'qty',
      type: IsarType.long,
    ),
    r'userId': PropertySchema(
      id: 4,
      name: r'userId',
      type: IsarType.string,
    )
  },
  estimateSize: _inventoryStockModelEstimateSize,
  serialize: _inventoryStockModelSerialize,
  deserialize: _inventoryStockModelDeserialize,
  deserializeProp: _inventoryStockModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _inventoryStockModelGetId,
  getLinks: _inventoryStockModelGetLinks,
  attach: _inventoryStockModelAttach,
  version: '3.1.0+1',
);

int _inventoryStockModelEstimateSize(
  InventoryStockModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.clinicId.length * 3;
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _inventoryStockModelSerialize(
  InventoryStockModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.clinicId);
  writer.writeLong(offsets[1], object.inventoryId);
  writer.writeLong(offsets[2], object.price);
  writer.writeLong(offsets[3], object.qty);
  writer.writeString(offsets[4], object.userId);
}

InventoryStockModel _inventoryStockModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = InventoryStockModel();
  object.clinicId = reader.readString(offsets[0]);
  object.id = id;
  object.inventoryId = reader.readLong(offsets[1]);
  object.price = reader.readLong(offsets[2]);
  object.qty = reader.readLong(offsets[3]);
  object.userId = reader.readString(offsets[4]);
  return object;
}

P _inventoryStockModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _inventoryStockModelGetId(InventoryStockModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _inventoryStockModelGetLinks(
    InventoryStockModel object) {
  return [];
}

void _inventoryStockModelAttach(
    IsarCollection<dynamic> col, Id id, InventoryStockModel object) {
  object.id = id;
}

extension InventoryStockModelQueryWhereSort
    on QueryBuilder<InventoryStockModel, InventoryStockModel, QWhere> {
  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension InventoryStockModelQueryWhere
    on QueryBuilder<InventoryStockModel, InventoryStockModel, QWhereClause> {
  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension InventoryStockModelQueryFilter on QueryBuilder<InventoryStockModel,
    InventoryStockModel, QFilterCondition> {
  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterFilterCondition>
      clinicIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clinicId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterFilterCondition>
      clinicIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'clinicId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterFilterCondition>
      clinicIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'clinicId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterFilterCondition>
      clinicIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'clinicId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterFilterCondition>
      clinicIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'clinicId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterFilterCondition>
      clinicIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'clinicId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterFilterCondition>
      clinicIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'clinicId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterFilterCondition>
      clinicIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'clinicId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterFilterCondition>
      clinicIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clinicId',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterFilterCondition>
      clinicIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'clinicId',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterFilterCondition>
      inventoryIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'inventoryId',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterFilterCondition>
      inventoryIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'inventoryId',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterFilterCondition>
      inventoryIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'inventoryId',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterFilterCondition>
      inventoryIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'inventoryId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterFilterCondition>
      priceEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'price',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterFilterCondition>
      priceGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'price',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterFilterCondition>
      priceLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'price',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterFilterCondition>
      priceBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'price',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterFilterCondition>
      qtyEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qty',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterFilterCondition>
      qtyGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qty',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterFilterCondition>
      qtyLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qty',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterFilterCondition>
      qtyBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qty',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterFilterCondition>
      userIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterFilterCondition>
      userIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterFilterCondition>
      userIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterFilterCondition>
      userIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterFilterCondition>
      userIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterFilterCondition>
      userIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }
}

extension InventoryStockModelQueryObject on QueryBuilder<InventoryStockModel,
    InventoryStockModel, QFilterCondition> {}

extension InventoryStockModelQueryLinks on QueryBuilder<InventoryStockModel,
    InventoryStockModel, QFilterCondition> {}

extension InventoryStockModelQuerySortBy
    on QueryBuilder<InventoryStockModel, InventoryStockModel, QSortBy> {
  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterSortBy>
      sortByClinicId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clinicId', Sort.asc);
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterSortBy>
      sortByClinicIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clinicId', Sort.desc);
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterSortBy>
      sortByInventoryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inventoryId', Sort.asc);
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterSortBy>
      sortByInventoryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inventoryId', Sort.desc);
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterSortBy>
      sortByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterSortBy>
      sortByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterSortBy>
      sortByQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty', Sort.asc);
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterSortBy>
      sortByQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty', Sort.desc);
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension InventoryStockModelQuerySortThenBy
    on QueryBuilder<InventoryStockModel, InventoryStockModel, QSortThenBy> {
  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterSortBy>
      thenByClinicId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clinicId', Sort.asc);
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterSortBy>
      thenByClinicIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clinicId', Sort.desc);
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterSortBy>
      thenByInventoryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inventoryId', Sort.asc);
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterSortBy>
      thenByInventoryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inventoryId', Sort.desc);
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterSortBy>
      thenByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterSortBy>
      thenByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterSortBy>
      thenByQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty', Sort.asc);
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterSortBy>
      thenByQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty', Sort.desc);
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension InventoryStockModelQueryWhereDistinct
    on QueryBuilder<InventoryStockModel, InventoryStockModel, QDistinct> {
  QueryBuilder<InventoryStockModel, InventoryStockModel, QDistinct>
      distinctByClinicId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clinicId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QDistinct>
      distinctByInventoryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'inventoryId');
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QDistinct>
      distinctByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'price');
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QDistinct>
      distinctByQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qty');
    });
  }

  QueryBuilder<InventoryStockModel, InventoryStockModel, QDistinct>
      distinctByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension InventoryStockModelQueryProperty
    on QueryBuilder<InventoryStockModel, InventoryStockModel, QQueryProperty> {
  QueryBuilder<InventoryStockModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<InventoryStockModel, String, QQueryOperations>
      clinicIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clinicId');
    });
  }

  QueryBuilder<InventoryStockModel, int, QQueryOperations>
      inventoryIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'inventoryId');
    });
  }

  QueryBuilder<InventoryStockModel, int, QQueryOperations> priceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'price');
    });
  }

  QueryBuilder<InventoryStockModel, int, QQueryOperations> qtyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qty');
    });
  }

  QueryBuilder<InventoryStockModel, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
