import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CountFiltersEventsRecord extends FirestoreRecord {
  CountFiltersEventsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _type = snapshotData['type'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('countFiltersEvents');

  static Stream<CountFiltersEventsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CountFiltersEventsRecord.fromSnapshot(s));

  static Future<CountFiltersEventsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CountFiltersEventsRecord.fromSnapshot(s));

  static CountFiltersEventsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CountFiltersEventsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CountFiltersEventsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CountFiltersEventsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CountFiltersEventsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CountFiltersEventsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCountFiltersEventsRecordData({
  DateTime? date,
  String? type,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'type': type,
    }.withoutNulls,
  );

  return firestoreData;
}

class CountFiltersEventsRecordDocumentEquality
    implements Equality<CountFiltersEventsRecord> {
  const CountFiltersEventsRecordDocumentEquality();

  @override
  bool equals(CountFiltersEventsRecord? e1, CountFiltersEventsRecord? e2) {
    return e1?.date == e2?.date && e1?.type == e2?.type;
  }

  @override
  int hash(CountFiltersEventsRecord? e) =>
      const ListEquality().hash([e?.date, e?.type]);

  @override
  bool isValidKey(Object? o) => o is CountFiltersEventsRecord;
}
