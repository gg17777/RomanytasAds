import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BugRecord extends FirestoreRecord {
  BugRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  bool hasImg() => _img != null;

  // "userEmail" field.
  String? _userEmail;
  String get userEmail => _userEmail ?? '';
  bool hasUserEmail() => _userEmail != null;

  void _initializeFields() {
    _text = snapshotData['text'] as String?;
    _img = snapshotData['img'] as String?;
    _userEmail = snapshotData['userEmail'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Bug');

  static Stream<BugRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BugRecord.fromSnapshot(s));

  static Future<BugRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BugRecord.fromSnapshot(s));

  static BugRecord fromSnapshot(DocumentSnapshot snapshot) => BugRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BugRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BugRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BugRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BugRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBugRecordData({
  String? text,
  String? img,
  String? userEmail,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'text': text,
      'img': img,
      'userEmail': userEmail,
    }.withoutNulls,
  );

  return firestoreData;
}

class BugRecordDocumentEquality implements Equality<BugRecord> {
  const BugRecordDocumentEquality();

  @override
  bool equals(BugRecord? e1, BugRecord? e2) {
    return e1?.text == e2?.text &&
        e1?.img == e2?.img &&
        e1?.userEmail == e2?.userEmail;
  }

  @override
  int hash(BugRecord? e) =>
      const ListEquality().hash([e?.text, e?.img, e?.userEmail]);

  @override
  bool isValidKey(Object? o) => o is BugRecord;
}
