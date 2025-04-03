// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CustomMarkerStruct extends FFFirebaseStruct {
  CustomMarkerStruct({
    LatLng? position,
    String? type,
    String? id,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _position = position,
        _type = type,
        _id = id,
        super(firestoreUtilData);

  // "position" field.
  LatLng? _position;
  LatLng? get position => _position;
  set position(LatLng? val) => _position = val;

  bool hasPosition() => _position != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  static CustomMarkerStruct fromMap(Map<String, dynamic> data) =>
      CustomMarkerStruct(
        position: data['position'] as LatLng?,
        type: data['type'] as String?,
        id: data['id'] as String?,
      );

  static CustomMarkerStruct? maybeFromMap(dynamic data) => data is Map
      ? CustomMarkerStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'position': _position,
        'type': _type,
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'position': serializeParam(
          _position,
          ParamType.LatLng,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
      }.withoutNulls;

  static CustomMarkerStruct fromSerializableMap(Map<String, dynamic> data) =>
      CustomMarkerStruct(
        position: deserializeParam(
          data['position'],
          ParamType.LatLng,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
      );

  static CustomMarkerStruct fromAlgoliaData(Map<String, dynamic> data) =>
      CustomMarkerStruct(
        position: convertAlgoliaParam(
          data,
          ParamType.LatLng,
          false,
        ),
        type: convertAlgoliaParam(
          data['type'],
          ParamType.String,
          false,
        ),
        id: convertAlgoliaParam(
          data['id'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'CustomMarkerStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CustomMarkerStruct &&
        position == other.position &&
        type == other.type &&
        id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([position, type, id]);
}

CustomMarkerStruct createCustomMarkerStruct({
  LatLng? position,
  String? type,
  String? id,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CustomMarkerStruct(
      position: position,
      type: type,
      id: id,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CustomMarkerStruct? updateCustomMarkerStruct(
  CustomMarkerStruct? customMarker, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    customMarker
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCustomMarkerStructData(
  Map<String, dynamic> firestoreData,
  CustomMarkerStruct? customMarker,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (customMarker == null) {
    return;
  }
  if (customMarker.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && customMarker.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final customMarkerData =
      getCustomMarkerFirestoreData(customMarker, forFieldValue);
  final nestedData =
      customMarkerData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = customMarker.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCustomMarkerFirestoreData(
  CustomMarkerStruct? customMarker, [
  bool forFieldValue = false,
]) {
  if (customMarker == null) {
    return {};
  }
  final firestoreData = mapToFirestore(customMarker.toMap());

  // Add any Firestore field values
  customMarker.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCustomMarkerListFirestoreData(
  List<CustomMarkerStruct>? customMarkers,
) =>
    customMarkers?.map((e) => getCustomMarkerFirestoreData(e, true)).toList() ??
    [];
