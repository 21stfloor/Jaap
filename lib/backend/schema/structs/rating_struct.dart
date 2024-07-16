// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RatingStruct extends FFFirebaseStruct {
  RatingStruct({
    int? rating,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _rating = rating,
        super(firestoreUtilData);

  // "rating" field.
  int? _rating;
  int get rating => _rating ?? 0;
  set rating(int? val) => _rating = val;

  void incrementRating(int amount) => rating = rating + amount;

  bool hasRating() => _rating != null;

  static RatingStruct fromMap(Map<String, dynamic> data) => RatingStruct(
        rating: castToType<int>(data['rating']),
      );

  static RatingStruct? maybeFromMap(dynamic data) =>
      data is Map ? RatingStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'rating': _rating,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'rating': serializeParam(
          _rating,
          ParamType.int,
        ),
      }.withoutNulls;

  static RatingStruct fromSerializableMap(Map<String, dynamic> data) =>
      RatingStruct(
        rating: deserializeParam(
          data['rating'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'RatingStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RatingStruct && rating == other.rating;
  }

  @override
  int get hashCode => const ListEquality().hash([rating]);
}

RatingStruct createRatingStruct({
  int? rating,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RatingStruct(
      rating: rating,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RatingStruct? updateRatingStruct(
  RatingStruct? ratingStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    ratingStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRatingStructData(
  Map<String, dynamic> firestoreData,
  RatingStruct? ratingStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (ratingStruct == null) {
    return;
  }
  if (ratingStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && ratingStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final ratingStructData = getRatingFirestoreData(ratingStruct, forFieldValue);
  final nestedData =
      ratingStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = ratingStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRatingFirestoreData(
  RatingStruct? ratingStruct, [
  bool forFieldValue = false,
]) {
  if (ratingStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(ratingStruct.toMap());

  // Add any Firestore field values
  ratingStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRatingListFirestoreData(
  List<RatingStruct>? ratingStructs,
) =>
    ratingStructs?.map((e) => getRatingFirestoreData(e, true)).toList() ?? [];
