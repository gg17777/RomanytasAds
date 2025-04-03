import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CountVideoClickedRecord extends FirestoreRecord {
  CountVideoClickedRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "titolo" field.
  String? _titolo;
  String get titolo => _titolo ?? '';
  bool hasTitolo() => _titolo != null;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _titolo = snapshotData['titolo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('countVideoClicked');

  static Stream<CountVideoClickedRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CountVideoClickedRecord.fromSnapshot(s));

  static Future<CountVideoClickedRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CountVideoClickedRecord.fromSnapshot(s));

  static CountVideoClickedRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CountVideoClickedRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CountVideoClickedRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CountVideoClickedRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CountVideoClickedRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CountVideoClickedRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCountVideoClickedRecordData({
  DateTime? date,
  String? titolo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'titolo': titolo,
    }.withoutNulls,
  );

  return firestoreData;
}

class CountVideoClickedRecordDocumentEquality
    implements Equality<CountVideoClickedRecord> {
  const CountVideoClickedRecordDocumentEquality();

  @override
  bool equals(CountVideoClickedRecord? e1, CountVideoClickedRecord? e2) {
    return e1?.date == e2?.date && e1?.titolo == e2?.titolo;
  }

  @override
  int hash(CountVideoClickedRecord? e) =>
      const ListEquality().hash([e?.date, e?.titolo]);

  @override
  bool isValidKey(Object? o) => o is CountVideoClickedRecord;
}
