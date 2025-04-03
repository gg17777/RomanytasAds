import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotMeInPhotoCountRecord extends FirestoreRecord {
  NotMeInPhotoCountRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "photoRef" field.
  DocumentReference? _photoRef;
  DocumentReference? get photoRef => _photoRef;
  bool hasPhotoRef() => _photoRef != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  void _initializeFields() {
    _photoRef = snapshotData['photoRef'] as DocumentReference?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _date = snapshotData['date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notMeInPhotoCount');

  static Stream<NotMeInPhotoCountRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotMeInPhotoCountRecord.fromSnapshot(s));

  static Future<NotMeInPhotoCountRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => NotMeInPhotoCountRecord.fromSnapshot(s));

  static NotMeInPhotoCountRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotMeInPhotoCountRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotMeInPhotoCountRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotMeInPhotoCountRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotMeInPhotoCountRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotMeInPhotoCountRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotMeInPhotoCountRecordData({
  DocumentReference? photoRef,
  DocumentReference? userRef,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'photoRef': photoRef,
      'userRef': userRef,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotMeInPhotoCountRecordDocumentEquality
    implements Equality<NotMeInPhotoCountRecord> {
  const NotMeInPhotoCountRecordDocumentEquality();

  @override
  bool equals(NotMeInPhotoCountRecord? e1, NotMeInPhotoCountRecord? e2) {
    return e1?.photoRef == e2?.photoRef &&
        e1?.userRef == e2?.userRef &&
        e1?.date == e2?.date;
  }

  @override
  int hash(NotMeInPhotoCountRecord? e) =>
      const ListEquality().hash([e?.photoRef, e?.userRef, e?.date]);

  @override
  bool isValidKey(Object? o) => o is NotMeInPhotoCountRecord;
}
