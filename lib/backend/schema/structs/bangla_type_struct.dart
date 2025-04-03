// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class BanglaTypeStruct extends FFFirebaseStruct {
  BanglaTypeStruct({
    LatLng? latlng,
    DateTime? dateTime,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _latlng = latlng,
        _dateTime = dateTime,
        super(firestoreUtilData);

  // "latlng" field.
  LatLng? _latlng;
  LatLng? get latlng => _latlng;
  set latlng(LatLng? val) => _latlng = val;

  bool hasLatlng() => _latlng != null;

  // "date_time" field.
  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;
  set dateTime(DateTime? val) => _dateTime = val;

  bool hasDateTime() => _dateTime != null;

  static BanglaTypeStruct fromMap(Map<String, dynamic> data) =>
      BanglaTypeStruct(
        latlng: data['latlng'] as LatLng?,
        dateTime: data['date_time'] as DateTime?,
      );

  static BanglaTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? BanglaTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'latlng': _latlng,
        'date_time': _dateTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'latlng': serializeParam(
          _latlng,
          ParamType.LatLng,
        ),
        'date_time': serializeParam(
          _dateTime,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static BanglaTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      BanglaTypeStruct(
        latlng: deserializeParam(
          data['latlng'],
          ParamType.LatLng,
          false,
        ),
        dateTime: deserializeParam(
          data['date_time'],
          ParamType.DateTime,
          false,
        ),
      );

  static BanglaTypeStruct fromAlgoliaData(Map<String, dynamic> data) =>
      BanglaTypeStruct(
        latlng: convertAlgoliaParam(
          data,
          ParamType.LatLng,
          false,
        ),
        dateTime: convertAlgoliaParam(
          data['date_time'],
          ParamType.DateTime,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'BanglaTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BanglaTypeStruct &&
        latlng == other.latlng &&
        dateTime == other.dateTime;
  }

  @override
  int get hashCode => const ListEquality().hash([latlng, dateTime]);
}

BanglaTypeStruct createBanglaTypeStruct({
  LatLng? latlng,
  DateTime? dateTime,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BanglaTypeStruct(
      latlng: latlng,
      dateTime: dateTime,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BanglaTypeStruct? updateBanglaTypeStruct(
  BanglaTypeStruct? banglaType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    banglaType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBanglaTypeStructData(
  Map<String, dynamic> firestoreData,
  BanglaTypeStruct? banglaType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (banglaType == null) {
    return;
  }
  if (banglaType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && banglaType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final banglaTypeData = getBanglaTypeFirestoreData(banglaType, forFieldValue);
  final nestedData = banglaTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = banglaType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBanglaTypeFirestoreData(
  BanglaTypeStruct? banglaType, [
  bool forFieldValue = false,
]) {
  if (banglaType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(banglaType.toMap());

  // Add any Firestore field values
  banglaType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBanglaTypeListFirestoreData(
  List<BanglaTypeStruct>? banglaTypes,
) =>
    banglaTypes?.map((e) => getBanglaTypeFirestoreData(e, true)).toList() ?? [];
