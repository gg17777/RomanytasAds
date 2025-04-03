import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConcertiParticipatingRecord extends FirestoreRecord {
  ConcertiParticipatingRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "participatingConcertiUserRef" field.
  DocumentReference? _participatingConcertiUserRef;
  DocumentReference? get participatingConcertiUserRef =>
      _participatingConcertiUserRef;
  bool hasParticipatingConcertiUserRef() =>
      _participatingConcertiUserRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _participatingConcertiUserRef =
        snapshotData['participatingConcertiUserRef'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('ConcertiParticipating')
          : FirebaseFirestore.instance.collectionGroup('ConcertiParticipating');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('ConcertiParticipating').doc(id);

  static Stream<ConcertiParticipatingRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => ConcertiParticipatingRecord.fromSnapshot(s));

  static Future<ConcertiParticipatingRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ConcertiParticipatingRecord.fromSnapshot(s));

  static ConcertiParticipatingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ConcertiParticipatingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConcertiParticipatingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConcertiParticipatingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConcertiParticipatingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConcertiParticipatingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConcertiParticipatingRecordData({
  DocumentReference? participatingConcertiUserRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'participatingConcertiUserRef': participatingConcertiUserRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConcertiParticipatingRecordDocumentEquality
    implements Equality<ConcertiParticipatingRecord> {
  const ConcertiParticipatingRecordDocumentEquality();

  @override
  bool equals(
      ConcertiParticipatingRecord? e1, ConcertiParticipatingRecord? e2) {
    return e1?.participatingConcertiUserRef == e2?.participatingConcertiUserRef;
  }

  @override
  int hash(ConcertiParticipatingRecord? e) =>
      const ListEquality().hash([e?.participatingConcertiUserRef]);

  @override
  bool isValidKey(Object? o) => o is ConcertiParticipatingRecord;
}
