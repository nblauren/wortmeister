// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'srs.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSrsCollection on Isar {
  IsarCollection<Srs> get srs => this.collection();
}

const SrsSchema = CollectionSchema(
  name: r'Srs',
  id: -9030908485210333138,
  properties: {
    r'correctCount': PropertySchema(
      id: 0,
      name: r'correctCount',
      type: IsarType.long,
    ),
    r'easeFactor': PropertySchema(
      id: 1,
      name: r'easeFactor',
      type: IsarType.double,
    ),
    r'incorrectCount': PropertySchema(
      id: 2,
      name: r'incorrectCount',
      type: IsarType.long,
    ),
    r'interval': PropertySchema(
      id: 3,
      name: r'interval',
      type: IsarType.long,
    ),
    r'lastReviewed': PropertySchema(
      id: 4,
      name: r'lastReviewed',
      type: IsarType.dateTime,
    ),
    r'nextReview': PropertySchema(
      id: 5,
      name: r'nextReview',
      type: IsarType.dateTime,
    ),
    r'reviewCount': PropertySchema(
      id: 6,
      name: r'reviewCount',
      type: IsarType.long,
    ),
    r'srsId': PropertySchema(
      id: 7,
      name: r'srsId',
      type: IsarType.string,
    ),
    r'streak': PropertySchema(
      id: 8,
      name: r'streak',
      type: IsarType.long,
    ),
    r'suspended': PropertySchema(
      id: 9,
      name: r'suspended',
      type: IsarType.bool,
    ),
    r'userId': PropertySchema(
      id: 10,
      name: r'userId',
      type: IsarType.string,
    ),
    r'wordId': PropertySchema(
      id: 11,
      name: r'wordId',
      type: IsarType.string,
    )
  },
  estimateSize: _srsEstimateSize,
  serialize: _srsSerialize,
  deserialize: _srsDeserialize,
  deserializeProp: _srsDeserializeProp,
  idName: r'id',
  indexes: {
    r'srsId': IndexSchema(
      id: 3665327841579292585,
      name: r'srsId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'srsId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'userId': IndexSchema(
      id: -2005826577402374815,
      name: r'userId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'wordId': IndexSchema(
      id: 2217755591053908536,
      name: r'wordId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'wordId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _srsGetId,
  getLinks: _srsGetLinks,
  attach: _srsAttach,
  version: '3.1.0+1',
);

int _srsEstimateSize(
  Srs object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.srsId.length * 3;
  bytesCount += 3 + object.userId.length * 3;
  bytesCount += 3 + object.wordId.length * 3;
  return bytesCount;
}

void _srsSerialize(
  Srs object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.correctCount);
  writer.writeDouble(offsets[1], object.easeFactor);
  writer.writeLong(offsets[2], object.incorrectCount);
  writer.writeLong(offsets[3], object.interval);
  writer.writeDateTime(offsets[4], object.lastReviewed);
  writer.writeDateTime(offsets[5], object.nextReview);
  writer.writeLong(offsets[6], object.reviewCount);
  writer.writeString(offsets[7], object.srsId);
  writer.writeLong(offsets[8], object.streak);
  writer.writeBool(offsets[9], object.suspended);
  writer.writeString(offsets[10], object.userId);
  writer.writeString(offsets[11], object.wordId);
}

Srs _srsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Srs(
    correctCount: reader.readLong(offsets[0]),
    easeFactor: reader.readDouble(offsets[1]),
    incorrectCount: reader.readLong(offsets[2]),
    interval: reader.readLong(offsets[3]),
    lastReviewed: reader.readDateTimeOrNull(offsets[4]),
    nextReview: reader.readDateTime(offsets[5]),
    reviewCount: reader.readLong(offsets[6]),
    srsId: reader.readString(offsets[7]),
    streak: reader.readLong(offsets[8]),
    suspended: reader.readBool(offsets[9]),
    userId: reader.readString(offsets[10]),
    wordId: reader.readString(offsets[11]),
  );
  object.id = id;
  return object;
}

P _srsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _srsGetId(Srs object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _srsGetLinks(Srs object) {
  return [];
}

void _srsAttach(IsarCollection<dynamic> col, Id id, Srs object) {
  object.id = id;
}

extension SrsQueryWhereSort on QueryBuilder<Srs, Srs, QWhere> {
  QueryBuilder<Srs, Srs, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SrsQueryWhere on QueryBuilder<Srs, Srs, QWhereClause> {
  QueryBuilder<Srs, Srs, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Srs, Srs, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Srs, Srs, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Srs, Srs, QAfterWhereClause> idBetween(
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

  QueryBuilder<Srs, Srs, QAfterWhereClause> srsIdEqualTo(String srsId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'srsId',
        value: [srsId],
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterWhereClause> srsIdNotEqualTo(String srsId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'srsId',
              lower: [],
              upper: [srsId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'srsId',
              lower: [srsId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'srsId',
              lower: [srsId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'srsId',
              lower: [],
              upper: [srsId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Srs, Srs, QAfterWhereClause> userIdEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterWhereClause> userIdNotEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Srs, Srs, QAfterWhereClause> wordIdEqualTo(String wordId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'wordId',
        value: [wordId],
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterWhereClause> wordIdNotEqualTo(String wordId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'wordId',
              lower: [],
              upper: [wordId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'wordId',
              lower: [wordId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'wordId',
              lower: [wordId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'wordId',
              lower: [],
              upper: [wordId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension SrsQueryFilter on QueryBuilder<Srs, Srs, QFilterCondition> {
  QueryBuilder<Srs, Srs, QAfterFilterCondition> correctCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'correctCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> correctCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'correctCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> correctCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'correctCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> correctCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'correctCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> easeFactorEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'easeFactor',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> easeFactorGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'easeFactor',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> easeFactorLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'easeFactor',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> easeFactorBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'easeFactor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Srs, Srs, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Srs, Srs, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Srs, Srs, QAfterFilterCondition> incorrectCountEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'incorrectCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> incorrectCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'incorrectCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> incorrectCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'incorrectCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> incorrectCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'incorrectCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> intervalEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'interval',
        value: value,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> intervalGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'interval',
        value: value,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> intervalLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'interval',
        value: value,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> intervalBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'interval',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> lastReviewedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastReviewed',
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> lastReviewedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastReviewed',
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> lastReviewedEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastReviewed',
        value: value,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> lastReviewedGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastReviewed',
        value: value,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> lastReviewedLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastReviewed',
        value: value,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> lastReviewedBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastReviewed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> nextReviewEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nextReview',
        value: value,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> nextReviewGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nextReview',
        value: value,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> nextReviewLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nextReview',
        value: value,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> nextReviewBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nextReview',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> reviewCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reviewCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> reviewCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reviewCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> reviewCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reviewCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> reviewCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reviewCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> srsIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'srsId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> srsIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'srsId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> srsIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'srsId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> srsIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'srsId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> srsIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'srsId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> srsIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'srsId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> srsIdContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'srsId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> srsIdMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'srsId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> srsIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'srsId',
        value: '',
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> srsIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'srsId',
        value: '',
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> streakEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'streak',
        value: value,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> streakGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'streak',
        value: value,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> streakLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'streak',
        value: value,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> streakBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'streak',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> suspendedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'suspended',
        value: value,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> userIdEqualTo(
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

  QueryBuilder<Srs, Srs, QAfterFilterCondition> userIdGreaterThan(
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

  QueryBuilder<Srs, Srs, QAfterFilterCondition> userIdLessThan(
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

  QueryBuilder<Srs, Srs, QAfterFilterCondition> userIdBetween(
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

  QueryBuilder<Srs, Srs, QAfterFilterCondition> userIdStartsWith(
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

  QueryBuilder<Srs, Srs, QAfterFilterCondition> userIdEndsWith(
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

  QueryBuilder<Srs, Srs, QAfterFilterCondition> userIdContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> userIdMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> wordIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wordId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> wordIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'wordId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> wordIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'wordId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> wordIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'wordId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> wordIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'wordId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> wordIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'wordId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> wordIdContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'wordId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> wordIdMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'wordId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> wordIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wordId',
        value: '',
      ));
    });
  }

  QueryBuilder<Srs, Srs, QAfterFilterCondition> wordIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'wordId',
        value: '',
      ));
    });
  }
}

extension SrsQueryObject on QueryBuilder<Srs, Srs, QFilterCondition> {}

extension SrsQueryLinks on QueryBuilder<Srs, Srs, QFilterCondition> {}

extension SrsQuerySortBy on QueryBuilder<Srs, Srs, QSortBy> {
  QueryBuilder<Srs, Srs, QAfterSortBy> sortByCorrectCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctCount', Sort.asc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> sortByCorrectCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctCount', Sort.desc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> sortByEaseFactor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'easeFactor', Sort.asc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> sortByEaseFactorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'easeFactor', Sort.desc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> sortByIncorrectCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'incorrectCount', Sort.asc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> sortByIncorrectCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'incorrectCount', Sort.desc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> sortByInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interval', Sort.asc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> sortByIntervalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interval', Sort.desc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> sortByLastReviewed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReviewed', Sort.asc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> sortByLastReviewedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReviewed', Sort.desc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> sortByNextReview() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextReview', Sort.asc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> sortByNextReviewDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextReview', Sort.desc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> sortByReviewCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewCount', Sort.asc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> sortByReviewCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewCount', Sort.desc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> sortBySrsId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'srsId', Sort.asc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> sortBySrsIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'srsId', Sort.desc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> sortByStreak() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streak', Sort.asc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> sortByStreakDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streak', Sort.desc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> sortBySuspended() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'suspended', Sort.asc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> sortBySuspendedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'suspended', Sort.desc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> sortByWordId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wordId', Sort.asc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> sortByWordIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wordId', Sort.desc);
    });
  }
}

extension SrsQuerySortThenBy on QueryBuilder<Srs, Srs, QSortThenBy> {
  QueryBuilder<Srs, Srs, QAfterSortBy> thenByCorrectCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctCount', Sort.asc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> thenByCorrectCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctCount', Sort.desc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> thenByEaseFactor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'easeFactor', Sort.asc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> thenByEaseFactorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'easeFactor', Sort.desc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> thenByIncorrectCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'incorrectCount', Sort.asc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> thenByIncorrectCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'incorrectCount', Sort.desc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> thenByInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interval', Sort.asc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> thenByIntervalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interval', Sort.desc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> thenByLastReviewed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReviewed', Sort.asc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> thenByLastReviewedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReviewed', Sort.desc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> thenByNextReview() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextReview', Sort.asc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> thenByNextReviewDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextReview', Sort.desc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> thenByReviewCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewCount', Sort.asc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> thenByReviewCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewCount', Sort.desc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> thenBySrsId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'srsId', Sort.asc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> thenBySrsIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'srsId', Sort.desc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> thenByStreak() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streak', Sort.asc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> thenByStreakDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streak', Sort.desc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> thenBySuspended() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'suspended', Sort.asc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> thenBySuspendedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'suspended', Sort.desc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> thenByWordId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wordId', Sort.asc);
    });
  }

  QueryBuilder<Srs, Srs, QAfterSortBy> thenByWordIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wordId', Sort.desc);
    });
  }
}

extension SrsQueryWhereDistinct on QueryBuilder<Srs, Srs, QDistinct> {
  QueryBuilder<Srs, Srs, QDistinct> distinctByCorrectCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'correctCount');
    });
  }

  QueryBuilder<Srs, Srs, QDistinct> distinctByEaseFactor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'easeFactor');
    });
  }

  QueryBuilder<Srs, Srs, QDistinct> distinctByIncorrectCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'incorrectCount');
    });
  }

  QueryBuilder<Srs, Srs, QDistinct> distinctByInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'interval');
    });
  }

  QueryBuilder<Srs, Srs, QDistinct> distinctByLastReviewed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastReviewed');
    });
  }

  QueryBuilder<Srs, Srs, QDistinct> distinctByNextReview() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nextReview');
    });
  }

  QueryBuilder<Srs, Srs, QDistinct> distinctByReviewCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reviewCount');
    });
  }

  QueryBuilder<Srs, Srs, QDistinct> distinctBySrsId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'srsId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Srs, Srs, QDistinct> distinctByStreak() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'streak');
    });
  }

  QueryBuilder<Srs, Srs, QDistinct> distinctBySuspended() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'suspended');
    });
  }

  QueryBuilder<Srs, Srs, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Srs, Srs, QDistinct> distinctByWordId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wordId', caseSensitive: caseSensitive);
    });
  }
}

extension SrsQueryProperty on QueryBuilder<Srs, Srs, QQueryProperty> {
  QueryBuilder<Srs, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Srs, int, QQueryOperations> correctCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'correctCount');
    });
  }

  QueryBuilder<Srs, double, QQueryOperations> easeFactorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'easeFactor');
    });
  }

  QueryBuilder<Srs, int, QQueryOperations> incorrectCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'incorrectCount');
    });
  }

  QueryBuilder<Srs, int, QQueryOperations> intervalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'interval');
    });
  }

  QueryBuilder<Srs, DateTime?, QQueryOperations> lastReviewedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastReviewed');
    });
  }

  QueryBuilder<Srs, DateTime, QQueryOperations> nextReviewProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nextReview');
    });
  }

  QueryBuilder<Srs, int, QQueryOperations> reviewCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reviewCount');
    });
  }

  QueryBuilder<Srs, String, QQueryOperations> srsIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'srsId');
    });
  }

  QueryBuilder<Srs, int, QQueryOperations> streakProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'streak');
    });
  }

  QueryBuilder<Srs, bool, QQueryOperations> suspendedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'suspended');
    });
  }

  QueryBuilder<Srs, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<Srs, String, QQueryOperations> wordIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wordId');
    });
  }
}
