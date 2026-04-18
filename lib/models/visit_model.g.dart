// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visit_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVisitModelCollection on Isar {
  IsarCollection<VisitModel> get visitModels => this.collection();
}

const VisitModelSchema = CollectionSchema(
  name: r'VisitModel',
  id: -3192176043887904449,
  properties: {
    r'date': PropertySchema(
      id: 0,
      name: r'date',
      type: IsarType.string,
    ),
    r'medicines': PropertySchema(
      id: 1,
      name: r'medicines',
      type: IsarType.stringList,
    ),
    r'observation': PropertySchema(
      id: 2,
      name: r'observation',
      type: IsarType.string,
    ),
    r'patientId': PropertySchema(
      id: 3,
      name: r'patientId',
      type: IsarType.long,
    ),
    r'pdfPaths': PropertySchema(
      id: 4,
      name: r'pdfPaths',
      type: IsarType.stringList,
    ),
    r'problem': PropertySchema(
      id: 5,
      name: r'problem',
      type: IsarType.string,
    )
  },
  estimateSize: _visitModelEstimateSize,
  serialize: _visitModelSerialize,
  deserialize: _visitModelDeserialize,
  deserializeProp: _visitModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _visitModelGetId,
  getLinks: _visitModelGetLinks,
  attach: _visitModelAttach,
  version: '3.1.0+1',
);

int _visitModelEstimateSize(
  VisitModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.date.length * 3;
  bytesCount += 3 + object.medicines.length * 3;
  {
    for (var i = 0; i < object.medicines.length; i++) {
      final value = object.medicines[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.observation.length * 3;
  bytesCount += 3 + object.pdfPaths.length * 3;
  {
    for (var i = 0; i < object.pdfPaths.length; i++) {
      final value = object.pdfPaths[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.problem.length * 3;
  return bytesCount;
}

void _visitModelSerialize(
  VisitModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.date);
  writer.writeStringList(offsets[1], object.medicines);
  writer.writeString(offsets[2], object.observation);
  writer.writeLong(offsets[3], object.patientId);
  writer.writeStringList(offsets[4], object.pdfPaths);
  writer.writeString(offsets[5], object.problem);
}

VisitModel _visitModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VisitModel();
  object.date = reader.readString(offsets[0]);
  object.id = id;
  object.medicines = reader.readStringList(offsets[1]) ?? [];
  object.observation = reader.readString(offsets[2]);
  object.patientId = reader.readLong(offsets[3]);
  object.pdfPaths = reader.readStringList(offsets[4]) ?? [];
  object.problem = reader.readString(offsets[5]);
  return object;
}

P _visitModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readStringList(offset) ?? []) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _visitModelGetId(VisitModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _visitModelGetLinks(VisitModel object) {
  return [];
}

void _visitModelAttach(IsarCollection<dynamic> col, Id id, VisitModel object) {
  object.id = id;
}

extension VisitModelQueryWhereSort
    on QueryBuilder<VisitModel, VisitModel, QWhere> {
  QueryBuilder<VisitModel, VisitModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VisitModelQueryWhere
    on QueryBuilder<VisitModel, VisitModel, QWhereClause> {
  QueryBuilder<VisitModel, VisitModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<VisitModel, VisitModel, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterWhereClause> idBetween(
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

extension VisitModelQueryFilter
    on QueryBuilder<VisitModel, VisitModel, QFilterCondition> {
  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition> dateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition> dateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition> dateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition> dateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition> dateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition> dateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition> dateContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition> dateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'date',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition> dateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition> dateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition>
      medicinesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'medicines',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition>
      medicinesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'medicines',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition>
      medicinesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'medicines',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition>
      medicinesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'medicines',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition>
      medicinesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'medicines',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition>
      medicinesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'medicines',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition>
      medicinesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'medicines',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition>
      medicinesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'medicines',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition>
      medicinesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'medicines',
        value: '',
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition>
      medicinesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'medicines',
        value: '',
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition>
      medicinesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'medicines',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition>
      medicinesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'medicines',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition>
      medicinesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'medicines',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition>
      medicinesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'medicines',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition>
      medicinesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'medicines',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition>
      medicinesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'medicines',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition>
      observationEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'observation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition>
      observationGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'observation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition>
      observationLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'observation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition>
      observationBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'observation',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition>
      observationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'observation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition>
      observationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'observation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition>
      observationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'observation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition>
      observationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'observation',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition>
      observationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'observation',
        value: '',
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition>
      observationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'observation',
        value: '',
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition> patientIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'patientId',
        value: value,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition>
      patientIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'patientId',
        value: value,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition> patientIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'patientId',
        value: value,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition> patientIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'patientId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition>
      pdfPathsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pdfPaths',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition>
      pdfPathsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pdfPaths',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition>
      pdfPathsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pdfPaths',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition>
      pdfPathsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pdfPaths',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition>
      pdfPathsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pdfPaths',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition>
      pdfPathsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pdfPaths',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition>
      pdfPathsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pdfPaths',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition>
      pdfPathsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pdfPaths',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition>
      pdfPathsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pdfPaths',
        value: '',
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition>
      pdfPathsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pdfPaths',
        value: '',
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition>
      pdfPathsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pdfPaths',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition>
      pdfPathsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pdfPaths',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition>
      pdfPathsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pdfPaths',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition>
      pdfPathsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pdfPaths',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition>
      pdfPathsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pdfPaths',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition>
      pdfPathsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pdfPaths',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition> problemEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'problem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition>
      problemGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'problem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition> problemLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'problem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition> problemBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'problem',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition> problemStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'problem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition> problemEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'problem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition> problemContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'problem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition> problemMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'problem',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition> problemIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'problem',
        value: '',
      ));
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterFilterCondition>
      problemIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'problem',
        value: '',
      ));
    });
  }
}

extension VisitModelQueryObject
    on QueryBuilder<VisitModel, VisitModel, QFilterCondition> {}

extension VisitModelQueryLinks
    on QueryBuilder<VisitModel, VisitModel, QFilterCondition> {}

extension VisitModelQuerySortBy
    on QueryBuilder<VisitModel, VisitModel, QSortBy> {
  QueryBuilder<VisitModel, VisitModel, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterSortBy> sortByObservation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observation', Sort.asc);
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterSortBy> sortByObservationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observation', Sort.desc);
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterSortBy> sortByPatientId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'patientId', Sort.asc);
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterSortBy> sortByPatientIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'patientId', Sort.desc);
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterSortBy> sortByProblem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'problem', Sort.asc);
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterSortBy> sortByProblemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'problem', Sort.desc);
    });
  }
}

extension VisitModelQuerySortThenBy
    on QueryBuilder<VisitModel, VisitModel, QSortThenBy> {
  QueryBuilder<VisitModel, VisitModel, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterSortBy> thenByObservation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observation', Sort.asc);
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterSortBy> thenByObservationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observation', Sort.desc);
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterSortBy> thenByPatientId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'patientId', Sort.asc);
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterSortBy> thenByPatientIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'patientId', Sort.desc);
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterSortBy> thenByProblem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'problem', Sort.asc);
    });
  }

  QueryBuilder<VisitModel, VisitModel, QAfterSortBy> thenByProblemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'problem', Sort.desc);
    });
  }
}

extension VisitModelQueryWhereDistinct
    on QueryBuilder<VisitModel, VisitModel, QDistinct> {
  QueryBuilder<VisitModel, VisitModel, QDistinct> distinctByDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VisitModel, VisitModel, QDistinct> distinctByMedicines() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'medicines');
    });
  }

  QueryBuilder<VisitModel, VisitModel, QDistinct> distinctByObservation(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'observation', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VisitModel, VisitModel, QDistinct> distinctByPatientId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'patientId');
    });
  }

  QueryBuilder<VisitModel, VisitModel, QDistinct> distinctByPdfPaths() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pdfPaths');
    });
  }

  QueryBuilder<VisitModel, VisitModel, QDistinct> distinctByProblem(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'problem', caseSensitive: caseSensitive);
    });
  }
}

extension VisitModelQueryProperty
    on QueryBuilder<VisitModel, VisitModel, QQueryProperty> {
  QueryBuilder<VisitModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VisitModel, String, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<VisitModel, List<String>, QQueryOperations> medicinesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'medicines');
    });
  }

  QueryBuilder<VisitModel, String, QQueryOperations> observationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'observation');
    });
  }

  QueryBuilder<VisitModel, int, QQueryOperations> patientIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'patientId');
    });
  }

  QueryBuilder<VisitModel, List<String>, QQueryOperations> pdfPathsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pdfPaths');
    });
  }

  QueryBuilder<VisitModel, String, QQueryOperations> problemProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'problem');
    });
  }
}
