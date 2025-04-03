import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SyncContactsRecord extends FirestoreRecord {
  SyncContactsRecord._(
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
  bool? _type;
  bool get type => _type ?? false;
  bool hasType() => _type != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  void _initializeFields() {
    _number = castToType<int>(snapshotData['number']);
    _type = snapshotData['type'] as bool?;
    _date = snapshotData['date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('syncContacts');

  static Stream<SyncContactsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SyncContactsRecord.fromSnapshot(s));

  static Future<SyncContactsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SyncContactsRecord.fromSnapshot(s));

  static SyncContactsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SyncContactsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SyncContactsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SyncContactsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SyncContactsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SyncContactsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSyncContactsRecordData({
  int? number,
  bool? type,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'number': number,
      'type': type,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class SyncContactsRecordDocumentEquality
    implements Equality<SyncContactsRecord> {
  const SyncContactsRecordDocumentEquality();

  @override
  bool equals(SyncContactsRecord? e1, SyncContactsRecord? e2) {
    return e1?.number == e2?.number &&
        e1?.type == e2?.type &&
        e1?.date == e2?.date;
  }

  @override
  int hash(SyncContactsRecord? e) =>
      const ListEquality().hash([e?.number, e?.type, e?.date]);

  @override
  bool isValidKey(Object? o) => o is SyncContactsRecord;
}
