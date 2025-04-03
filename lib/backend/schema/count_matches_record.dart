import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CountMatchesRecord extends FirestoreRecord {
  CountMatchesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "swiped" field.
  DocumentReference? _swiped;
  DocumentReference? get swiped => _swiped;
  bool hasSwiped() => _swiped != null;

  // "swiper" field.
  DocumentReference? _swiper;
  DocumentReference? get swiper => _swiper;
  bool hasSwiper() => _swiper != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "event_name" field.
  String? _eventName;
  String get eventName => _eventName ?? '';
  bool hasEventName() => _eventName != null;

  void _initializeFields() {
    _swiped = snapshotData['swiped'] as DocumentReference?;
    _swiper = snapshotData['swiper'] as DocumentReference?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _eventName = snapshotData['event_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('count_matches');

  static Stream<CountMatchesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CountMatchesRecord.fromSnapshot(s));

  static Future<CountMatchesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CountMatchesRecord.fromSnapshot(s));

  static CountMatchesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CountMatchesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CountMatchesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CountMatchesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CountMatchesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CountMatchesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCountMatchesRecordData({
  DocumentReference? swiped,
  DocumentReference? swiper,
  DateTime? createdTime,
  String? eventName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'swiped': swiped,
      'swiper': swiper,
      'created_time': createdTime,
      'event_name': eventName,
    }.withoutNulls,
  );

  return firestoreData;
}

class CountMatchesRecordDocumentEquality
    implements Equality<CountMatchesRecord> {
  const CountMatchesRecordDocumentEquality();

  @override
  bool equals(CountMatchesRecord? e1, CountMatchesRecord? e2) {
    return e1?.swiped == e2?.swiped &&
        e1?.swiper == e2?.swiper &&
        e1?.createdTime == e2?.createdTime &&
        e1?.eventName == e2?.eventName;
  }

  @override
  int hash(CountMatchesRecord? e) => const ListEquality()
      .hash([e?.swiped, e?.swiper, e?.createdTime, e?.eventName]);

  @override
  bool isValidKey(Object? o) => o is CountMatchesRecord;
}
