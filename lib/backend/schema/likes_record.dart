import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LikesRecord extends FirestoreRecord {
  LikesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date_time" field.
  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;
  bool hasDateTime() => _dateTime != null;

  // "event_name" field.
  String? _eventName;
  String get eventName => _eventName ?? '';
  bool hasEventName() => _eventName != null;

  // "eventID" field.
  DocumentReference? _eventID;
  DocumentReference? get eventID => _eventID;
  bool hasEventID() => _eventID != null;

  // "viewed" field.
  bool? _viewed;
  bool get viewed => _viewed ?? false;
  bool hasViewed() => _viewed != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _dateTime = snapshotData['date_time'] as DateTime?;
    _eventName = snapshotData['event_name'] as String?;
    _eventID = snapshotData['eventID'] as DocumentReference?;
    _viewed = snapshotData['viewed'] as bool?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _createdTime = snapshotData['created_time'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('likes')
          : FirebaseFirestore.instance.collectionGroup('likes');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('likes').doc(id);

  static Stream<LikesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LikesRecord.fromSnapshot(s));

  static Future<LikesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LikesRecord.fromSnapshot(s));

  static LikesRecord fromSnapshot(DocumentSnapshot snapshot) => LikesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LikesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LikesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LikesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LikesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLikesRecordData({
  DateTime? dateTime,
  String? eventName,
  DocumentReference? eventID,
  bool? viewed,
  DocumentReference? userRef,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date_time': dateTime,
      'event_name': eventName,
      'eventID': eventID,
      'viewed': viewed,
      'userRef': userRef,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class LikesRecordDocumentEquality implements Equality<LikesRecord> {
  const LikesRecordDocumentEquality();

  @override
  bool equals(LikesRecord? e1, LikesRecord? e2) {
    return e1?.dateTime == e2?.dateTime &&
        e1?.eventName == e2?.eventName &&
        e1?.eventID == e2?.eventID &&
        e1?.viewed == e2?.viewed &&
        e1?.userRef == e2?.userRef &&
        e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(LikesRecord? e) => const ListEquality().hash([
        e?.dateTime,
        e?.eventName,
        e?.eventID,
        e?.viewed,
        e?.userRef,
        e?.createdTime
      ]);

  @override
  bool isValidKey(Object? o) => o is LikesRecord;
}
