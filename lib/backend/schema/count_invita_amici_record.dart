import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CountInvitaAmiciRecord extends FirestoreRecord {
  CountInvitaAmiciRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "device" field.
  String? _device;
  String get device => _device ?? '';
  bool hasDevice() => _device != null;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _device = snapshotData['device'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('countInvitaAmici');

  static Stream<CountInvitaAmiciRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CountInvitaAmiciRecord.fromSnapshot(s));

  static Future<CountInvitaAmiciRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CountInvitaAmiciRecord.fromSnapshot(s));

  static CountInvitaAmiciRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CountInvitaAmiciRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CountInvitaAmiciRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CountInvitaAmiciRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CountInvitaAmiciRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CountInvitaAmiciRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCountInvitaAmiciRecordData({
  DateTime? date,
  String? device,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'device': device,
    }.withoutNulls,
  );

  return firestoreData;
}

class CountInvitaAmiciRecordDocumentEquality
    implements Equality<CountInvitaAmiciRecord> {
  const CountInvitaAmiciRecordDocumentEquality();

  @override
  bool equals(CountInvitaAmiciRecord? e1, CountInvitaAmiciRecord? e2) {
    return e1?.date == e2?.date && e1?.device == e2?.device;
  }

  @override
  int hash(CountInvitaAmiciRecord? e) =>
      const ListEquality().hash([e?.date, e?.device]);

  @override
  bool isValidKey(Object? o) => o is CountInvitaAmiciRecord;
}
