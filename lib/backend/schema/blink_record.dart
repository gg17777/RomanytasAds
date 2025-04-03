import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BlinkRecord extends FirestoreRecord {
  BlinkRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "where" field.
  String? _where;
  String get where => _where ?? '';
  bool hasWhere() => _where != null;

  // "matched" field.
  bool? _matched;
  bool get matched => _matched ?? false;
  bool hasMatched() => _matched != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "viewed" field.
  bool? _viewed;
  bool get viewed => _viewed ?? false;
  bool hasViewed() => _viewed != null;

  // "whereID" field.
  String? _whereID;
  String get whereID => _whereID ?? '';
  bool hasWhereID() => _whereID != null;

  // "blinker" field.
  DocumentReference? _blinker;
  DocumentReference? get blinker => _blinker;
  bool hasBlinker() => _blinker != null;

  // "blinked" field.
  DocumentReference? _blinked;
  DocumentReference? get blinked => _blinked;
  bool hasBlinked() => _blinked != null;

  void _initializeFields() {
    _where = snapshotData['where'] as String?;
    _matched = snapshotData['matched'] as bool?;
    _date = snapshotData['date'] as DateTime?;
    _viewed = snapshotData['viewed'] as bool?;
    _whereID = snapshotData['whereID'] as String?;
    _blinker = snapshotData['blinker'] as DocumentReference?;
    _blinked = snapshotData['blinked'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('blink');

  static Stream<BlinkRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BlinkRecord.fromSnapshot(s));

  static Future<BlinkRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BlinkRecord.fromSnapshot(s));

  static BlinkRecord fromSnapshot(DocumentSnapshot snapshot) => BlinkRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BlinkRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BlinkRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BlinkRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BlinkRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBlinkRecordData({
  String? where,
  bool? matched,
  DateTime? date,
  bool? viewed,
  String? whereID,
  DocumentReference? blinker,
  DocumentReference? blinked,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'where': where,
      'matched': matched,
      'date': date,
      'viewed': viewed,
      'whereID': whereID,
      'blinker': blinker,
      'blinked': blinked,
    }.withoutNulls,
  );

  return firestoreData;
}

class BlinkRecordDocumentEquality implements Equality<BlinkRecord> {
  const BlinkRecordDocumentEquality();

  @override
  bool equals(BlinkRecord? e1, BlinkRecord? e2) {
    return e1?.where == e2?.where &&
        e1?.matched == e2?.matched &&
        e1?.date == e2?.date &&
        e1?.viewed == e2?.viewed &&
        e1?.whereID == e2?.whereID &&
        e1?.blinker == e2?.blinker &&
        e1?.blinked == e2?.blinked;
  }

  @override
  int hash(BlinkRecord? e) => const ListEquality().hash([
        e?.where,
        e?.matched,
        e?.date,
        e?.viewed,
        e?.whereID,
        e?.blinker,
        e?.blinked
      ]);

  @override
  bool isValidKey(Object? o) => o is BlinkRecord;
}
