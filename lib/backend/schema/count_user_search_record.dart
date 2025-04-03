import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CountUserSearchRecord extends FirestoreRecord {
  CountUserSearchRecord._(
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
      FirebaseFirestore.instance.collection('countUserSearch');

  static Stream<CountUserSearchRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CountUserSearchRecord.fromSnapshot(s));

  static Future<CountUserSearchRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CountUserSearchRecord.fromSnapshot(s));

  static CountUserSearchRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CountUserSearchRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CountUserSearchRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CountUserSearchRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CountUserSearchRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CountUserSearchRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCountUserSearchRecordData({
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class CountUserSearchRecordDocumentEquality
    implements Equality<CountUserSearchRecord> {
  const CountUserSearchRecordDocumentEquality();

  @override
  bool equals(CountUserSearchRecord? e1, CountUserSearchRecord? e2) {
    return e1?.date == e2?.date;
  }

  @override
  int hash(CountUserSearchRecord? e) => const ListEquality().hash([e?.date]);

  @override
  bool isValidKey(Object? o) => o is CountUserSearchRecord;
}
