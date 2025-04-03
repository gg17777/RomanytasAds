// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class NasoniTypeStruct extends FFFirebaseStruct {
  NasoniTypeStruct({
    LatLng? latlng,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _latlng = latlng,
        super(firestoreUtilData);

  // "latlng" field.
  LatLng? _latlng;
  LatLng? get latlng => _latlng;
  set latlng(LatLng? val) => _latlng = val;

  bool hasLatlng() => _latlng != null;

  static NasoniTypeStruct fromMap(Map<String, dynamic> data) =>
      NasoniTypeStruct(
        latlng: data['latlng'] as LatLng?,
      );

  static NasoniTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? NasoniTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'latlng': _latlng,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'latlng': serializeParam(
          _latlng,
          ParamType.LatLng,
        ),
      }.withoutNulls;

  static NasoniTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      NasoniTypeStruct(
        latlng: deserializeParam(
          data['latlng'],
          ParamType.LatLng,
          false,
        ),
      );

  static NasoniTypeStruct fromAlgoliaData(Map<String, dynamic> data) =>
      NasoniTypeStruct(
        latlng: convertAlgoliaParam(
          data,
          ParamType.LatLng,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'NasoniTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NasoniTypeStruct && latlng == other.latlng;
  }

  @override
  int get hashCode => const ListEquality().hash([latlng]);
}

NasoniTypeStruct createNasoniTypeStruct({
  LatLng? latlng,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NasoniTypeStruct(
      latlng: latlng,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NasoniTypeStruct? updateNasoniTypeStruct(
  NasoniTypeStruct? nasoniType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    nasoniType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNasoniTypeStructData(
  Map<String, dynamic> firestoreData,
  NasoniTypeStruct? nasoniType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (nasoniType == null) {
    return;
  }
  if (nasoniType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && nasoniType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final nasoniTypeData = getNasoniTypeFirestoreData(nasoniType, forFieldValue);
  final nestedData = nasoniTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = nasoniType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNasoniTypeFirestoreData(
  NasoniTypeStruct? nasoniType, [
  bool forFieldValue = false,
]) {
  if (nasoniType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(nasoniType.toMap());

  // Add any Firestore field values
  nasoniType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNasoniTypeListFirestoreData(
  List<NasoniTypeStruct>? nasoniTypes,
) =>
    nasoniTypes?.map((e) => getNasoniTypeFirestoreData(e, true)).toList() ?? [];
