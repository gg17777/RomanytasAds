import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CountFemaleSwipesRecord extends FirestoreRecord {
  CountFemaleSwipesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "event_name" field.
  String? _eventName;
  String get eventName => _eventName ?? '';
  bool hasEventName() => _eventName != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "direction" field.
  String? _direction;
  String get direction => _direction ?? '';
  bool hasDirection() => _direction != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "swiped" field.
  DocumentReference? _swiped;
  DocumentReference? get swiped => _swiped;
  bool hasSwiped() => _swiped != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userName = snapshotData['user_name'] as String?;
    _eventName = snapshotData['event_name'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _direction = snapshotData['direction'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _swiped = snapshotData['swiped'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('countFemaleSwipes')
          : FirebaseFirestore.instance.collectionGroup('countFemaleSwipes');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('countFemaleSwipes').doc(id);

  static Stream<CountFemaleSwipesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CountFemaleSwipesRecord.fromSnapshot(s));

  static Future<CountFemaleSwipesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CountFemaleSwipesRecord.fromSnapshot(s));

  static CountFemaleSwipesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CountFemaleSwipesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CountFemaleSwipesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CountFemaleSwipesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CountFemaleSwipesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CountFemaleSwipesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCountFemaleSwipesRecordData({
  String? userName,
  String? eventName,
  DateTime? date,
  DocumentReference? userRef,
  String? direction,
  DateTime? createdTime,
  DocumentReference? swiped,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_name': userName,
      'event_name': eventName,
      'date': date,
      'userRef': userRef,
      'direction': direction,
      'created_time': createdTime,
      'swiped': swiped,
    }.withoutNulls,
  );

  return firestoreData;
}

class CountFemaleSwipesRecordDocumentEquality
    implements Equality<CountFemaleSwipesRecord> {
  const CountFemaleSwipesRecordDocumentEquality();

  @override
  bool equals(CountFemaleSwipesRecord? e1, CountFemaleSwipesRecord? e2) {
    return e1?.userName == e2?.userName &&
        e1?.eventName == e2?.eventName &&
        e1?.date == e2?.date &&
        e1?.userRef == e2?.userRef &&
        e1?.direction == e2?.direction &&
        e1?.createdTime == e2?.createdTime &&
        e1?.swiped == e2?.swiped;
  }

  @override
  int hash(CountFemaleSwipesRecord? e) => const ListEquality().hash([
        e?.userName,
        e?.eventName,
        e?.date,
        e?.userRef,
        e?.direction,
        e?.createdTime,
        e?.swiped
      ]);

  @override
  bool isValidKey(Object? o) => o is CountFemaleSwipesRecord;
}
