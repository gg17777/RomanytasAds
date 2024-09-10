// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CiboTypeStruct extends FFFirebaseStruct {
  CiboTypeStruct({
    LatLng? latlng,
    String? name,
    String? description,
    bool? zozzoni,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _latlng = latlng,
        _name = name,
        _description = description,
        _zozzoni = zozzoni,
        super(firestoreUtilData);

  // "latlng" field.
  LatLng? _latlng;
  LatLng? get latlng => _latlng;
  set latlng(LatLng? val) => _latlng = val;

  bool hasLatlng() => _latlng != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "zozzoni" field.
  bool? _zozzoni;
  bool get zozzoni => _zozzoni ?? false;
  set zozzoni(bool? val) => _zozzoni = val;

  bool hasZozzoni() => _zozzoni != null;

  static CiboTypeStruct fromMap(Map<String, dynamic> data) => CiboTypeStruct(
        latlng: data['latlng'] as LatLng?,
        name: data['name'] as String?,
        description: data['description'] as String?,
        zozzoni: data['zozzoni'] as bool?,
      );

  static CiboTypeStruct? maybeFromMap(dynamic data) =>
      data is Map ? CiboTypeStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'latlng': _latlng,
        'name': _name,
        'description': _description,
        'zozzoni': _zozzoni,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'latlng': serializeParam(
          _latlng,
          ParamType.LatLng,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'zozzoni': serializeParam(
          _zozzoni,
          ParamType.bool,
        ),
      }.withoutNulls;

  static CiboTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      CiboTypeStruct(
        latlng: deserializeParam(
          data['latlng'],
          ParamType.LatLng,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        zozzoni: deserializeParam(
          data['zozzoni'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'CiboTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CiboTypeStruct &&
        latlng == other.latlng &&
        name == other.name &&
        description == other.description &&
        zozzoni == other.zozzoni;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([latlng, name, description, zozzoni]);
}

CiboTypeStruct createCiboTypeStruct({
  LatLng? latlng,
  String? name,
  String? description,
  bool? zozzoni,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CiboTypeStruct(
      latlng: latlng,
      name: name,
      description: description,
      zozzoni: zozzoni,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CiboTypeStruct? updateCiboTypeStruct(
  CiboTypeStruct? ciboType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    ciboType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCiboTypeStructData(
  Map<String, dynamic> firestoreData,
  CiboTypeStruct? ciboType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (ciboType == null) {
    return;
  }
  if (ciboType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && ciboType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final ciboTypeData = getCiboTypeFirestoreData(ciboType, forFieldValue);
  final nestedData = ciboTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = ciboType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCiboTypeFirestoreData(
  CiboTypeStruct? ciboType, [
  bool forFieldValue = false,
]) {
  if (ciboType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(ciboType.toMap());

  // Add any Firestore field values
  ciboType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCiboTypeListFirestoreData(
  List<CiboTypeStruct>? ciboTypes,
) =>
    ciboTypes?.map((e) => getCiboTypeFirestoreData(e, true)).toList() ?? [];
