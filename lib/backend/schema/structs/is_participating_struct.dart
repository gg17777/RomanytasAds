// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class IsParticipatingStruct extends FFFirebaseStruct {
  IsParticipatingStruct({
    bool? isPart,
    DocumentReference? event,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _isPart = isPart,
        _event = event,
        super(firestoreUtilData);

  // "isPart" field.
  bool? _isPart;
  bool get isPart => _isPart ?? false;
  set isPart(bool? val) => _isPart = val;

  bool hasIsPart() => _isPart != null;

  // "event" field.
  DocumentReference? _event;
  DocumentReference? get event => _event;
  set event(DocumentReference? val) => _event = val;

  bool hasEvent() => _event != null;

  static IsParticipatingStruct fromMap(Map<String, dynamic> data) =>
      IsParticipatingStruct(
        isPart: data['isPart'] as bool?,
        event: data['event'] as DocumentReference?,
      );

  static IsParticipatingStruct? maybeFromMap(dynamic data) => data is Map
      ? IsParticipatingStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'isPart': _isPart,
        'event': _event,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'isPart': serializeParam(
          _isPart,
          ParamType.bool,
        ),
        'event': serializeParam(
          _event,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static IsParticipatingStruct fromSerializableMap(Map<String, dynamic> data) =>
      IsParticipatingStruct(
        isPart: deserializeParam(
          data['isPart'],
          ParamType.bool,
          false,
        ),
        event: deserializeParam(
          data['event'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Eventi'],
        ),
      );

  static IsParticipatingStruct fromAlgoliaData(Map<String, dynamic> data) =>
      IsParticipatingStruct(
        isPart: convertAlgoliaParam(
          data['isPart'],
          ParamType.bool,
          false,
        ),
        event: convertAlgoliaParam(
          data['event'],
          ParamType.DocumentReference,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'IsParticipatingStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is IsParticipatingStruct &&
        isPart == other.isPart &&
        event == other.event;
  }

  @override
  int get hashCode => const ListEquality().hash([isPart, event]);
}

IsParticipatingStruct createIsParticipatingStruct({
  bool? isPart,
  DocumentReference? event,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    IsParticipatingStruct(
      isPart: isPart,
      event: event,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

IsParticipatingStruct? updateIsParticipatingStruct(
  IsParticipatingStruct? isParticipating, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    isParticipating
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addIsParticipatingStructData(
  Map<String, dynamic> firestoreData,
  IsParticipatingStruct? isParticipating,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (isParticipating == null) {
    return;
  }
  if (isParticipating.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && isParticipating.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final isParticipatingData =
      getIsParticipatingFirestoreData(isParticipating, forFieldValue);
  final nestedData =
      isParticipatingData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = isParticipating.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getIsParticipatingFirestoreData(
  IsParticipatingStruct? isParticipating, [
  bool forFieldValue = false,
]) {
  if (isParticipating == null) {
    return {};
  }
  final firestoreData = mapToFirestore(isParticipating.toMap());

  // Add any Firestore field values
  isParticipating.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getIsParticipatingListFirestoreData(
  List<IsParticipatingStruct>? isParticipatings,
) =>
    isParticipatings
        ?.map((e) => getIsParticipatingFirestoreData(e, true))
        .toList() ??
    [];
