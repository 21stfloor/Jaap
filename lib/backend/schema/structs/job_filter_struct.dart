// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class JobFilterStruct extends FFFirebaseStruct {
  JobFilterStruct({
    String? searchKeyword,
    List<String>? countries,
    List<String>? companies,
    String? days,
    List<String>? jobTypes,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _searchKeyword = searchKeyword,
        _countries = countries,
        _companies = companies,
        _days = days,
        _jobTypes = jobTypes,
        super(firestoreUtilData);

  // "searchKeyword" field.
  String? _searchKeyword;
  String get searchKeyword => _searchKeyword ?? '';
  set searchKeyword(String? val) => _searchKeyword = val;

  bool hasSearchKeyword() => _searchKeyword != null;

  // "Countries" field.
  List<String>? _countries;
  List<String> get countries => _countries ?? const [];
  set countries(List<String>? val) => _countries = val;

  void updateCountries(Function(List<String>) updateFn) {
    updateFn(_countries ??= []);
  }

  bool hasCountries() => _countries != null;

  // "Companies" field.
  List<String>? _companies;
  List<String> get companies => _companies ?? const [];
  set companies(List<String>? val) => _companies = val;

  void updateCompanies(Function(List<String>) updateFn) {
    updateFn(_companies ??= []);
  }

  bool hasCompanies() => _companies != null;

  // "Days" field.
  String? _days;
  String get days => _days ?? '';
  set days(String? val) => _days = val;

  bool hasDays() => _days != null;

  // "JobTypes" field.
  List<String>? _jobTypes;
  List<String> get jobTypes => _jobTypes ?? const [];
  set jobTypes(List<String>? val) => _jobTypes = val;

  void updateJobTypes(Function(List<String>) updateFn) {
    updateFn(_jobTypes ??= []);
  }

  bool hasJobTypes() => _jobTypes != null;

  static JobFilterStruct fromMap(Map<String, dynamic> data) => JobFilterStruct(
        searchKeyword: data['searchKeyword'] as String?,
        countries: getDataList(data['Countries']),
        companies: getDataList(data['Companies']),
        days: data['Days'] as String?,
        jobTypes: getDataList(data['JobTypes']),
      );

  static JobFilterStruct? maybeFromMap(dynamic data) => data is Map
      ? JobFilterStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'searchKeyword': _searchKeyword,
        'Countries': _countries,
        'Companies': _companies,
        'Days': _days,
        'JobTypes': _jobTypes,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'searchKeyword': serializeParam(
          _searchKeyword,
          ParamType.String,
        ),
        'Countries': serializeParam(
          _countries,
          ParamType.String,
          isList: true,
        ),
        'Companies': serializeParam(
          _companies,
          ParamType.String,
          isList: true,
        ),
        'Days': serializeParam(
          _days,
          ParamType.String,
        ),
        'JobTypes': serializeParam(
          _jobTypes,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static JobFilterStruct fromSerializableMap(Map<String, dynamic> data) =>
      JobFilterStruct(
        searchKeyword: deserializeParam(
          data['searchKeyword'],
          ParamType.String,
          false,
        ),
        countries: deserializeParam<String>(
          data['Countries'],
          ParamType.String,
          true,
        ),
        companies: deserializeParam<String>(
          data['Companies'],
          ParamType.String,
          true,
        ),
        days: deserializeParam(
          data['Days'],
          ParamType.String,
          false,
        ),
        jobTypes: deserializeParam<String>(
          data['JobTypes'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'JobFilterStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is JobFilterStruct &&
        searchKeyword == other.searchKeyword &&
        listEquality.equals(countries, other.countries) &&
        listEquality.equals(companies, other.companies) &&
        days == other.days &&
        listEquality.equals(jobTypes, other.jobTypes);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([searchKeyword, countries, companies, days, jobTypes]);
}

JobFilterStruct createJobFilterStruct({
  String? searchKeyword,
  String? days,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    JobFilterStruct(
      searchKeyword: searchKeyword,
      days: days,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

JobFilterStruct? updateJobFilterStruct(
  JobFilterStruct? jobFilter, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    jobFilter
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addJobFilterStructData(
  Map<String, dynamic> firestoreData,
  JobFilterStruct? jobFilter,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (jobFilter == null) {
    return;
  }
  if (jobFilter.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && jobFilter.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final jobFilterData = getJobFilterFirestoreData(jobFilter, forFieldValue);
  final nestedData = jobFilterData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = jobFilter.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getJobFilterFirestoreData(
  JobFilterStruct? jobFilter, [
  bool forFieldValue = false,
]) {
  if (jobFilter == null) {
    return {};
  }
  final firestoreData = mapToFirestore(jobFilter.toMap());

  // Add any Firestore field values
  jobFilter.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getJobFilterListFirestoreData(
  List<JobFilterStruct>? jobFilters,
) =>
    jobFilters?.map((e) => getJobFilterFirestoreData(e, true)).toList() ?? [];
