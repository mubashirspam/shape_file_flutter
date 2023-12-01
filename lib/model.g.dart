// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarModelCollection on Isar {
  IsarCollection<IsarModel> get isarModels => this.collection();
}

const IsarModelSchema = CollectionSchema(
  name: r'IsarModel',
  id: 2868268773712343045,
  properties: {
    r'sarvayCount': PropertySchema(
      id: 0,
      name: r'sarvayCount',
      type: IsarType.string,
    ),
    r'state': PropertySchema(
      id: 1,
      name: r'state',
      type: IsarType.string,
    )
  },
  estimateSize: _isarModelEstimateSize,
  serialize: _isarModelSerialize,
  deserialize: _isarModelDeserialize,
  deserializeProp: _isarModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'state': IndexSchema(
      id: 7917036384617311412,
      name: r'state',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'state',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _isarModelGetId,
  getLinks: _isarModelGetLinks,
  attach: _isarModelAttach,
  version: '3.1.0+1',
);

int _isarModelEstimateSize(
  IsarModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.sarvayCount.length * 3;
  bytesCount += 3 + object.state.length * 3;
  return bytesCount;
}

void _isarModelSerialize(
  IsarModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.sarvayCount);
  writer.writeString(offsets[1], object.state);
}

IsarModel _isarModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarModel(
    sarvayCount: reader.readString(offsets[0]),
    state: reader.readString(offsets[1]),
  );
  object.id = id;
  return object;
}

P _isarModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarModelGetId(IsarModel object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _isarModelGetLinks(IsarModel object) {
  return [];
}

void _isarModelAttach(IsarCollection<dynamic> col, Id id, IsarModel object) {
  object.id = id;
}

extension IsarModelQueryWhereSort
    on QueryBuilder<IsarModel, IsarModel, QWhere> {
  QueryBuilder<IsarModel, IsarModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<IsarModel, IsarModel, QAfterWhere> anyState() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'state'),
      );
    });
  }
}

extension IsarModelQueryWhere
    on QueryBuilder<IsarModel, IsarModel, QWhereClause> {
  QueryBuilder<IsarModel, IsarModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarModel, IsarModel, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<IsarModel, IsarModel, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarModel, IsarModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarModel, IsarModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<IsarModel, IsarModel, QAfterWhereClause> stateEqualTo(
      String state) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'state',
        value: [state],
      ));
    });
  }

  QueryBuilder<IsarModel, IsarModel, QAfterWhereClause> stateNotEqualTo(
      String state) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'state',
              lower: [],
              upper: [state],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'state',
              lower: [state],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'state',
              lower: [state],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'state',
              lower: [],
              upper: [state],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<IsarModel, IsarModel, QAfterWhereClause> stateGreaterThan(
    String state, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'state',
        lower: [state],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<IsarModel, IsarModel, QAfterWhereClause> stateLessThan(
    String state, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'state',
        lower: [],
        upper: [state],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<IsarModel, IsarModel, QAfterWhereClause> stateBetween(
    String lowerState,
    String upperState, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'state',
        lower: [lowerState],
        includeLower: includeLower,
        upper: [upperState],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarModel, IsarModel, QAfterWhereClause> stateStartsWith(
      String StatePrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'state',
        lower: [StatePrefix],
        upper: ['$StatePrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<IsarModel, IsarModel, QAfterWhereClause> stateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'state',
        value: [''],
      ));
    });
  }

  QueryBuilder<IsarModel, IsarModel, QAfterWhereClause> stateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'state',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'state',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'state',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'state',
              upper: [''],
            ));
      }
    });
  }
}

extension IsarModelQueryFilter
    on QueryBuilder<IsarModel, IsarModel, QFilterCondition> {
  QueryBuilder<IsarModel, IsarModel, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<IsarModel, IsarModel, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<IsarModel, IsarModel, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarModel, IsarModel, QAfterFilterCondition> idGreaterThan(
    Id? value, {
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

  QueryBuilder<IsarModel, IsarModel, QAfterFilterCondition> idLessThan(
    Id? value, {
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

  QueryBuilder<IsarModel, IsarModel, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
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

  QueryBuilder<IsarModel, IsarModel, QAfterFilterCondition> sarvayCountEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sarvayCount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarModel, IsarModel, QAfterFilterCondition>
      sarvayCountGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sarvayCount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarModel, IsarModel, QAfterFilterCondition> sarvayCountLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sarvayCount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarModel, IsarModel, QAfterFilterCondition> sarvayCountBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sarvayCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarModel, IsarModel, QAfterFilterCondition>
      sarvayCountStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sarvayCount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarModel, IsarModel, QAfterFilterCondition> sarvayCountEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sarvayCount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarModel, IsarModel, QAfterFilterCondition> sarvayCountContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sarvayCount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarModel, IsarModel, QAfterFilterCondition> sarvayCountMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sarvayCount',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarModel, IsarModel, QAfterFilterCondition>
      sarvayCountIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sarvayCount',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarModel, IsarModel, QAfterFilterCondition>
      sarvayCountIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sarvayCount',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarModel, IsarModel, QAfterFilterCondition> stateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'state',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarModel, IsarModel, QAfterFilterCondition> stateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'state',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarModel, IsarModel, QAfterFilterCondition> stateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'state',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarModel, IsarModel, QAfterFilterCondition> stateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'state',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarModel, IsarModel, QAfterFilterCondition> stateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'state',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarModel, IsarModel, QAfterFilterCondition> stateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'state',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarModel, IsarModel, QAfterFilterCondition> stateContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'state',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarModel, IsarModel, QAfterFilterCondition> stateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'state',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarModel, IsarModel, QAfterFilterCondition> stateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'state',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarModel, IsarModel, QAfterFilterCondition> stateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'state',
        value: '',
      ));
    });
  }
}

extension IsarModelQueryObject
    on QueryBuilder<IsarModel, IsarModel, QFilterCondition> {}

extension IsarModelQueryLinks
    on QueryBuilder<IsarModel, IsarModel, QFilterCondition> {}

extension IsarModelQuerySortBy on QueryBuilder<IsarModel, IsarModel, QSortBy> {
  QueryBuilder<IsarModel, IsarModel, QAfterSortBy> sortBySarvayCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sarvayCount', Sort.asc);
    });
  }

  QueryBuilder<IsarModel, IsarModel, QAfterSortBy> sortBySarvayCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sarvayCount', Sort.desc);
    });
  }

  QueryBuilder<IsarModel, IsarModel, QAfterSortBy> sortByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.asc);
    });
  }

  QueryBuilder<IsarModel, IsarModel, QAfterSortBy> sortByStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.desc);
    });
  }
}

extension IsarModelQuerySortThenBy
    on QueryBuilder<IsarModel, IsarModel, QSortThenBy> {
  QueryBuilder<IsarModel, IsarModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarModel, IsarModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarModel, IsarModel, QAfterSortBy> thenBySarvayCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sarvayCount', Sort.asc);
    });
  }

  QueryBuilder<IsarModel, IsarModel, QAfterSortBy> thenBySarvayCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sarvayCount', Sort.desc);
    });
  }

  QueryBuilder<IsarModel, IsarModel, QAfterSortBy> thenByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.asc);
    });
  }

  QueryBuilder<IsarModel, IsarModel, QAfterSortBy> thenByStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.desc);
    });
  }
}

extension IsarModelQueryWhereDistinct
    on QueryBuilder<IsarModel, IsarModel, QDistinct> {
  QueryBuilder<IsarModel, IsarModel, QDistinct> distinctBySarvayCount(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sarvayCount', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarModel, IsarModel, QDistinct> distinctByState(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'state', caseSensitive: caseSensitive);
    });
  }
}

extension IsarModelQueryProperty
    on QueryBuilder<IsarModel, IsarModel, QQueryProperty> {
  QueryBuilder<IsarModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarModel, String, QQueryOperations> sarvayCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sarvayCount');
    });
  }

  QueryBuilder<IsarModel, String, QQueryOperations> stateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'state');
    });
  }
}
