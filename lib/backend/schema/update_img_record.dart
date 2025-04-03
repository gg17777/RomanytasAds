import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UpdateImgRecord extends FirestoreRecord {
  UpdateImgRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('updateImg');

  static Stream<UpdateImgRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UpdateImgRecord.fromSnapshot(s));

  static Future<UpdateImgRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UpdateImgRecord.fromSnapshot(s));

  static UpdateImgRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UpdateImgRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UpdateImgRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UpdateImgRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UpdateImgRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UpdateImgRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUpdateImgRecordData({
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class UpdateImgRecordDocumentEquality implements Equality<UpdateImgRecord> {
  const UpdateImgRecordDocumentEquality();

  @override
  bool equals(UpdateImgRecord? e1, UpdateImgRecord? e2) {
    return e1?.userRef == e2?.userRef;
  }

  @override
  int hash(UpdateImgRecord? e) => const ListEquality().hash([e?.userRef]);

  @override
  bool isValidKey(Object? o) => o is UpdateImgRecord;
}
