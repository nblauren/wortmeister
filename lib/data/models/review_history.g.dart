// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_history.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetReviewHistoryCollection on Isar {
  IsarCollection<ReviewHistory> get reviewHistorys => this.collection();
}

const ReviewHistorySchema = CollectionSchema(
  name: r'ReviewHistory',
  id: -4582051496398156496,
  properties: {
    r'date': PropertySchema(
      id: 0,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'deckId': PropertySchema(
      id: 1,
      name: r'deckId',
      type: IsarType.string,
    ),
    r'newWordReviewCount': PropertySchema(
      id: 2,
      name: r'newWordReviewCount',
      type: IsarType.long,
    ),
    r'reviewHistoryId': PropertySchema(
      id: 3,
      name: r'reviewHistoryId',
      type: IsarType.string,
    ),
    r'reviewWordCount': PropertySchema(
      id: 4,
      name: r'reviewWordCount',
      type: IsarType.long,
    )
  },
  estimateSize: _reviewHistoryEstimateSize,
  serialize: _reviewHistorySerialize,
  deserialize: _reviewHistoryDeserialize,
  deserializeProp: _reviewHistoryDeserializeProp,
  idName: r'id',
  indexes: {
    r'reviewHistoryId': IndexSchema(
      id: 8553314913285028170,
      name: r'reviewHistoryId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'reviewHistoryId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'deckId': IndexSchema(
      id: -1182505463565197889,
      name: r'deckId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'deckId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'date': IndexSchema(
      id: -7552997827385218417,
      name: r'date',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'date',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _reviewHistoryGetId,
  getLinks: _reviewHistoryGetLinks,
  attach: _reviewHistoryAttach,
  version: '3.1.8',
);

int _reviewHistoryEstimateSize(
  ReviewHistory object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.deckId.length * 3;
  bytesCount += 3 + object.reviewHistoryId.length * 3;
  return bytesCount;
}

void _reviewHistorySerialize(
  ReviewHistory object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.date);
  writer.writeString(offsets[1], object.deckId);
  writer.writeLong(offsets[2], object.newWordReviewCount);
  writer.writeString(offsets[3], object.reviewHistoryId);
  writer.writeLong(offsets[4], object.reviewWordCount);
}

ReviewHistory _reviewHistoryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ReviewHistory(
    date: reader.readDateTime(offsets[0]),
    deckId: reader.readString(offsets[1]),
    newWordReviewCount: reader.readLong(offsets[2]),
    reviewHistoryId: reader.readString(offsets[3]),
    reviewWordCount: reader.readLong(offsets[4]),
  );
  object.id = id;
  return object;
}

P _reviewHistoryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _reviewHistoryGetId(ReviewHistory object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _reviewHistoryGetLinks(ReviewHistory object) {
  return [];
}

void _reviewHistoryAttach(
    IsarCollection<dynamic> col, Id id, ReviewHistory object) {
  object.id = id;
}

extension ReviewHistoryByIndex on IsarCollection<ReviewHistory> {
  Future<ReviewHistory?> getByReviewHistoryId(String reviewHistoryId) {
    return getByIndex(r'reviewHistoryId', [reviewHistoryId]);
  }

  ReviewHistory? getByReviewHistoryIdSync(String reviewHistoryId) {
    return getByIndexSync(r'reviewHistoryId', [reviewHistoryId]);
  }

  Future<bool> deleteByReviewHistoryId(String reviewHistoryId) {
    return deleteByIndex(r'reviewHistoryId', [reviewHistoryId]);
  }

  bool deleteByReviewHistoryIdSync(String reviewHistoryId) {
    return deleteByIndexSync(r'reviewHistoryId', [reviewHistoryId]);
  }

  Future<List<ReviewHistory?>> getAllByReviewHistoryId(
      List<String> reviewHistoryIdValues) {
    final values = reviewHistoryIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'reviewHistoryId', values);
  }

  List<ReviewHistory?> getAllByReviewHistoryIdSync(
      List<String> reviewHistoryIdValues) {
    final values = reviewHistoryIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'reviewHistoryId', values);
  }

  Future<int> deleteAllByReviewHistoryId(List<String> reviewHistoryIdValues) {
    final values = reviewHistoryIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'reviewHistoryId', values);
  }

  int deleteAllByReviewHistoryIdSync(List<String> reviewHistoryIdValues) {
    final values = reviewHistoryIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'reviewHistoryId', values);
  }

  Future<Id> putByReviewHistoryId(ReviewHistory object) {
    return putByIndex(r'reviewHistoryId', object);
  }

  Id putByReviewHistoryIdSync(ReviewHistory object, {bool saveLinks = true}) {
    return putByIndexSync(r'reviewHistoryId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByReviewHistoryId(List<ReviewHistory> objects) {
    return putAllByIndex(r'reviewHistoryId', objects);
  }

  List<Id> putAllByReviewHistoryIdSync(List<ReviewHistory> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'reviewHistoryId', objects, saveLinks: saveLinks);
  }
}

extension ReviewHistoryQueryWhereSort
    on QueryBuilder<ReviewHistory, ReviewHistory, QWhere> {
  QueryBuilder<ReviewHistory, ReviewHistory, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterWhere> anyDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'date'),
      );
    });
  }
}

extension ReviewHistoryQueryWhere
    on QueryBuilder<ReviewHistory, ReviewHistory, QWhereClause> {
  QueryBuilder<ReviewHistory, ReviewHistory, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterWhereClause> idBetween(
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

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterWhereClause>
      reviewHistoryIdEqualTo(String reviewHistoryId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'reviewHistoryId',
        value: [reviewHistoryId],
      ));
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterWhereClause>
      reviewHistoryIdNotEqualTo(String reviewHistoryId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reviewHistoryId',
              lower: [],
              upper: [reviewHistoryId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reviewHistoryId',
              lower: [reviewHistoryId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reviewHistoryId',
              lower: [reviewHistoryId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reviewHistoryId',
              lower: [],
              upper: [reviewHistoryId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterWhereClause> deckIdEqualTo(
      String deckId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'deckId',
        value: [deckId],
      ));
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterWhereClause>
      deckIdNotEqualTo(String deckId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'deckId',
              lower: [],
              upper: [deckId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'deckId',
              lower: [deckId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'deckId',
              lower: [deckId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'deckId',
              lower: [],
              upper: [deckId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterWhereClause> dateEqualTo(
      DateTime date) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'date',
        value: [date],
      ));
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterWhereClause> dateNotEqualTo(
      DateTime date) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [],
              upper: [date],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [date],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [date],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [],
              upper: [date],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterWhereClause> dateGreaterThan(
    DateTime date, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [date],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterWhereClause> dateLessThan(
    DateTime date, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [],
        upper: [date],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterWhereClause> dateBetween(
    DateTime lowerDate,
    DateTime upperDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [lowerDate],
        includeLower: includeLower,
        upper: [upperDate],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ReviewHistoryQueryFilter
    on QueryBuilder<ReviewHistory, ReviewHistory, QFilterCondition> {
  QueryBuilder<ReviewHistory, ReviewHistory, QAfterFilterCondition> dateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterFilterCondition>
      dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterFilterCondition>
      dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterFilterCondition> dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterFilterCondition>
      deckIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deckId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterFilterCondition>
      deckIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deckId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterFilterCondition>
      deckIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deckId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterFilterCondition>
      deckIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deckId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterFilterCondition>
      deckIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'deckId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterFilterCondition>
      deckIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'deckId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterFilterCondition>
      deckIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deckId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterFilterCondition>
      deckIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deckId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterFilterCondition>
      deckIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deckId',
        value: '',
      ));
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterFilterCondition>
      deckIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deckId',
        value: '',
      ));
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterFilterCondition>
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

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterFilterCondition>
      newWordReviewCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'newWordReviewCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterFilterCondition>
      newWordReviewCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'newWordReviewCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterFilterCondition>
      newWordReviewCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'newWordReviewCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterFilterCondition>
      newWordReviewCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'newWordReviewCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterFilterCondition>
      reviewHistoryIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reviewHistoryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterFilterCondition>
      reviewHistoryIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reviewHistoryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterFilterCondition>
      reviewHistoryIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reviewHistoryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterFilterCondition>
      reviewHistoryIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reviewHistoryId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterFilterCondition>
      reviewHistoryIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'reviewHistoryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterFilterCondition>
      reviewHistoryIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'reviewHistoryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterFilterCondition>
      reviewHistoryIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'reviewHistoryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterFilterCondition>
      reviewHistoryIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'reviewHistoryId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterFilterCondition>
      reviewHistoryIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reviewHistoryId',
        value: '',
      ));
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterFilterCondition>
      reviewHistoryIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'reviewHistoryId',
        value: '',
      ));
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterFilterCondition>
      reviewWordCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reviewWordCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterFilterCondition>
      reviewWordCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reviewWordCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterFilterCondition>
      reviewWordCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reviewWordCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterFilterCondition>
      reviewWordCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reviewWordCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ReviewHistoryQueryObject
    on QueryBuilder<ReviewHistory, ReviewHistory, QFilterCondition> {}

extension ReviewHistoryQueryLinks
    on QueryBuilder<ReviewHistory, ReviewHistory, QFilterCondition> {}

extension ReviewHistoryQuerySortBy
    on QueryBuilder<ReviewHistory, ReviewHistory, QSortBy> {
  QueryBuilder<ReviewHistory, ReviewHistory, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterSortBy> sortByDeckId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deckId', Sort.asc);
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterSortBy> sortByDeckIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deckId', Sort.desc);
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterSortBy>
      sortByNewWordReviewCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'newWordReviewCount', Sort.asc);
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterSortBy>
      sortByNewWordReviewCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'newWordReviewCount', Sort.desc);
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterSortBy>
      sortByReviewHistoryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewHistoryId', Sort.asc);
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterSortBy>
      sortByReviewHistoryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewHistoryId', Sort.desc);
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterSortBy>
      sortByReviewWordCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewWordCount', Sort.asc);
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterSortBy>
      sortByReviewWordCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewWordCount', Sort.desc);
    });
  }
}

extension ReviewHistoryQuerySortThenBy
    on QueryBuilder<ReviewHistory, ReviewHistory, QSortThenBy> {
  QueryBuilder<ReviewHistory, ReviewHistory, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterSortBy> thenByDeckId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deckId', Sort.asc);
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterSortBy> thenByDeckIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deckId', Sort.desc);
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterSortBy>
      thenByNewWordReviewCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'newWordReviewCount', Sort.asc);
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterSortBy>
      thenByNewWordReviewCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'newWordReviewCount', Sort.desc);
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterSortBy>
      thenByReviewHistoryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewHistoryId', Sort.asc);
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterSortBy>
      thenByReviewHistoryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewHistoryId', Sort.desc);
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterSortBy>
      thenByReviewWordCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewWordCount', Sort.asc);
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QAfterSortBy>
      thenByReviewWordCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewWordCount', Sort.desc);
    });
  }
}

extension ReviewHistoryQueryWhereDistinct
    on QueryBuilder<ReviewHistory, ReviewHistory, QDistinct> {
  QueryBuilder<ReviewHistory, ReviewHistory, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QDistinct> distinctByDeckId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deckId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QDistinct>
      distinctByNewWordReviewCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'newWordReviewCount');
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QDistinct>
      distinctByReviewHistoryId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reviewHistoryId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReviewHistory, ReviewHistory, QDistinct>
      distinctByReviewWordCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reviewWordCount');
    });
  }
}

extension ReviewHistoryQueryProperty
    on QueryBuilder<ReviewHistory, ReviewHistory, QQueryProperty> {
  QueryBuilder<ReviewHistory, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ReviewHistory, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<ReviewHistory, String, QQueryOperations> deckIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deckId');
    });
  }

  QueryBuilder<ReviewHistory, int, QQueryOperations>
      newWordReviewCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'newWordReviewCount');
    });
  }

  QueryBuilder<ReviewHistory, String, QQueryOperations>
      reviewHistoryIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reviewHistoryId');
    });
  }

  QueryBuilder<ReviewHistory, int, QQueryOperations> reviewWordCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reviewWordCount');
    });
  }
}
