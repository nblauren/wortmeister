// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conjugation.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ConjugationSchema = Schema(
  name: r'Conjugation',
  id: 1770917321138326586,
  properties: {
    r'auxiliaryVerb': PropertySchema(
      id: 0,
      name: r'auxiliaryVerb',
      type: IsarType.string,
    ),
    r'past': PropertySchema(
      id: 1,
      name: r'past',
      type: IsarType.string,
    ),
    r'pastParticiple': PropertySchema(
      id: 2,
      name: r'pastParticiple',
      type: IsarType.string,
    ),
    r'perfect': PropertySchema(
      id: 3,
      name: r'perfect',
      type: IsarType.string,
    ),
    r'present': PropertySchema(
      id: 4,
      name: r'present',
      type: IsarType.string,
    )
  },
  estimateSize: _conjugationEstimateSize,
  serialize: _conjugationSerialize,
  deserialize: _conjugationDeserialize,
  deserializeProp: _conjugationDeserializeProp,
);

int _conjugationEstimateSize(
  Conjugation object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.auxiliaryVerb;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.past;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.pastParticiple;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.perfect;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.present;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _conjugationSerialize(
  Conjugation object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.auxiliaryVerb);
  writer.writeString(offsets[1], object.past);
  writer.writeString(offsets[2], object.pastParticiple);
  writer.writeString(offsets[3], object.perfect);
  writer.writeString(offsets[4], object.present);
}

Conjugation _conjugationDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Conjugation(
    auxiliaryVerb: reader.readStringOrNull(offsets[0]),
    past: reader.readStringOrNull(offsets[1]),
    pastParticiple: reader.readStringOrNull(offsets[2]),
    perfect: reader.readStringOrNull(offsets[3]),
    present: reader.readStringOrNull(offsets[4]),
  );
  return object;
}

P _conjugationDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ConjugationQueryFilter
    on QueryBuilder<Conjugation, Conjugation, QFilterCondition> {
  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition>
      auxiliaryVerbIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'auxiliaryVerb',
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition>
      auxiliaryVerbIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'auxiliaryVerb',
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition>
      auxiliaryVerbEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'auxiliaryVerb',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition>
      auxiliaryVerbGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'auxiliaryVerb',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition>
      auxiliaryVerbLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'auxiliaryVerb',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition>
      auxiliaryVerbBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'auxiliaryVerb',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition>
      auxiliaryVerbStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'auxiliaryVerb',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition>
      auxiliaryVerbEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'auxiliaryVerb',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition>
      auxiliaryVerbContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'auxiliaryVerb',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition>
      auxiliaryVerbMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'auxiliaryVerb',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition>
      auxiliaryVerbIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'auxiliaryVerb',
        value: '',
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition>
      auxiliaryVerbIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'auxiliaryVerb',
        value: '',
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition> pastIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'past',
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition>
      pastIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'past',
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition> pastEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'past',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition> pastGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'past',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition> pastLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'past',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition> pastBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'past',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition> pastStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'past',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition> pastEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'past',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition> pastContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'past',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition> pastMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'past',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition> pastIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'past',
        value: '',
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition>
      pastIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'past',
        value: '',
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition>
      pastParticipleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pastParticiple',
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition>
      pastParticipleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pastParticiple',
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition>
      pastParticipleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pastParticiple',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition>
      pastParticipleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pastParticiple',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition>
      pastParticipleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pastParticiple',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition>
      pastParticipleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pastParticiple',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition>
      pastParticipleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pastParticiple',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition>
      pastParticipleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pastParticiple',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition>
      pastParticipleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pastParticiple',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition>
      pastParticipleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pastParticiple',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition>
      pastParticipleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pastParticiple',
        value: '',
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition>
      pastParticipleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pastParticiple',
        value: '',
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition>
      perfectIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'perfect',
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition>
      perfectIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'perfect',
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition> perfectEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'perfect',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition>
      perfectGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'perfect',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition> perfectLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'perfect',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition> perfectBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'perfect',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition>
      perfectStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'perfect',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition> perfectEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'perfect',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition> perfectContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'perfect',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition> perfectMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'perfect',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition>
      perfectIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'perfect',
        value: '',
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition>
      perfectIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'perfect',
        value: '',
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition>
      presentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'present',
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition>
      presentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'present',
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition> presentEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'present',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition>
      presentGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'present',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition> presentLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'present',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition> presentBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'present',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition>
      presentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'present',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition> presentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'present',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition> presentContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'present',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition> presentMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'present',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition>
      presentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'present',
        value: '',
      ));
    });
  }

  QueryBuilder<Conjugation, Conjugation, QAfterFilterCondition>
      presentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'present',
        value: '',
      ));
    });
  }
}

extension ConjugationQueryObject
    on QueryBuilder<Conjugation, Conjugation, QFilterCondition> {}
