import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RequestAcceptedRecord extends FirestoreRecord {
  RequestAcceptedRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('requestAccepted');

  static Stream<RequestAcceptedRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RequestAcceptedRecord.fromSnapshot(s));

  static Future<RequestAcceptedRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RequestAcceptedRecord.fromSnapshot(s));

  static RequestAcceptedRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RequestAcceptedRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RequestAcceptedRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RequestAcceptedRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RequestAcceptedRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RequestAcceptedRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRequestAcceptedRecordData({
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class RequestAcceptedRecordDocumentEquality
    implements Equality<RequestAcceptedRecord> {
  const RequestAcceptedRecordDocumentEquality();

  @override
  bool equals(RequestAcceptedRecord? e1, RequestAcceptedRecord? e2) {
    return e1?.date == e2?.date;
  }

  @override
  int hash(RequestAcceptedRecord? e) => const ListEquality().hash([e?.date]);

  @override
  bool isValidKey(Object? o) => o is RequestAcceptedRecord;
}
