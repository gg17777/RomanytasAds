import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RequestsSentRecord extends FirestoreRecord {
  RequestsSentRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "number" field.
  int? _number;
  int get number => _number ?? 0;
  bool hasNumber() => _number != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  void _initializeFields() {
    _number = castToType<int>(snapshotData['number']);
    _type = snapshotData['type'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('requestsSent');

  static Stream<RequestsSentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RequestsSentRecord.fromSnapshot(s));

  static Future<RequestsSentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RequestsSentRecord.fromSnapshot(s));

  static RequestsSentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RequestsSentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RequestsSentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RequestsSentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RequestsSentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RequestsSentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRequestsSentRecordData({
  int? number,
  String? type,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'number': number,
      'type': type,
    }.withoutNulls,
  );

  return firestoreData;
}

class RequestsSentRecordDocumentEquality
    implements Equality<RequestsSentRecord> {
  const RequestsSentRecordDocumentEquality();

  @override
  bool equals(RequestsSentRecord? e1, RequestsSentRecord? e2) {
    return e1?.number == e2?.number && e1?.type == e2?.type;
  }

  @override
  int hash(RequestsSentRecord? e) =>
      const ListEquality().hash([e?.number, e?.type]);

  @override
  bool isValidKey(Object? o) => o is RequestsSentRecord;
}
