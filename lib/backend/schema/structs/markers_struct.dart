// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class MarkersStruct extends FFFirebaseStruct {
  MarkersStruct({
    LatLng? coordinates,
    String? imageUrl,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _coordinates = coordinates,
        _imageUrl = imageUrl,
        super(firestoreUtilData);

  // "coordinates" field.
  LatLng? _coordinates;
  LatLng? get coordinates => _coordinates;
  set coordinates(LatLng? val) => _coordinates = val;

  bool hasCoordinates() => _coordinates != null;

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  set imageUrl(String? val) => _imageUrl = val;

  bool hasImageUrl() => _imageUrl != null;

  static MarkersStruct fromMap(Map<String, dynamic> data) => MarkersStruct(
        coordinates: data['coordinates'] as LatLng?,
        imageUrl: data['imageUrl'] as String?,
      );

  static MarkersStruct? maybeFromMap(dynamic data) =>
      data is Map ? MarkersStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'coordinates': _coordinates,
        'imageUrl': _imageUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'coordinates': serializeParam(
          _coordinates,
          ParamType.LatLng,
        ),
        'imageUrl': serializeParam(
          _imageUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static MarkersStruct fromSerializableMap(Map<String, dynamic> data) =>
      MarkersStruct(
        coordinates: deserializeParam(
          data['coordinates'],
          ParamType.LatLng,
          false,
        ),
        imageUrl: deserializeParam(
          data['imageUrl'],
          ParamType.String,
          false,
        ),
      );

  static MarkersStruct fromAlgoliaData(Map<String, dynamic> data) =>
      MarkersStruct(
        coordinates: convertAlgoliaParam(
          data,
          ParamType.LatLng,
          false,
        ),
        imageUrl: convertAlgoliaParam(
          data['imageUrl'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'MarkersStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MarkersStruct &&
        coordinates == other.coordinates &&
        imageUrl == other.imageUrl;
  }

  @override
  int get hashCode => const ListEquality().hash([coordinates, imageUrl]);
}

MarkersStruct createMarkersStruct({
  LatLng? coordinates,
  String? imageUrl,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MarkersStruct(
      coordinates: coordinates,
      imageUrl: imageUrl,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MarkersStruct? updateMarkersStruct(
  MarkersStruct? markers, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    markers
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMarkersStructData(
  Map<String, dynamic> firestoreData,
  MarkersStruct? markers,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (markers == null) {
    return;
  }
  if (markers.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && markers.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final markersData = getMarkersFirestoreData(markers, forFieldValue);
  final nestedData = markersData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = markers.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMarkersFirestoreData(
  MarkersStruct? markers, [
  bool forFieldValue = false,
]) {
  if (markers == null) {
    return {};
  }
  final firestoreData = mapToFirestore(markers.toMap());

  // Add any Firestore field values
  markers.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMarkersListFirestoreData(
  List<MarkersStruct>? markerss,
) =>
    markerss?.map((e) => getMarkersFirestoreData(e, true)).toList() ?? [];
