import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProposingConcertiRecord extends FirestoreRecord {
  ProposingConcertiRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "proposingConcertiUserRef" field.
  DocumentReference? _proposingConcertiUserRef;
  DocumentReference? get proposingConcertiUserRef => _proposingConcertiUserRef;
  bool hasProposingConcertiUserRef() => _proposingConcertiUserRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _proposingConcertiUserRef =
        snapshotData['proposingConcertiUserRef'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('ProposingConcerti')
          : FirebaseFirestore.instance.collectionGroup('ProposingConcerti');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('ProposingConcerti').doc(id);

  static Stream<ProposingConcertiRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProposingConcertiRecord.fromSnapshot(s));

  static Future<ProposingConcertiRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ProposingConcertiRecord.fromSnapshot(s));

  static ProposingConcertiRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProposingConcertiRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProposingConcertiRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProposingConcertiRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProposingConcertiRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProposingConcertiRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProposingConcertiRecordData({
  DocumentReference? proposingConcertiUserRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'proposingConcertiUserRef': proposingConcertiUserRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProposingConcertiRecordDocumentEquality
    implements Equality<ProposingConcertiRecord> {
  const ProposingConcertiRecordDocumentEquality();

  @override
  bool equals(ProposingConcertiRecord? e1, ProposingConcertiRecord? e2) {
    return e1?.proposingConcertiUserRef == e2?.proposingConcertiUserRef;
  }

  @override
  int hash(ProposingConcertiRecord? e) =>
      const ListEquality().hash([e?.proposingConcertiUserRef]);

  @override
  bool isValidKey(Object? o) => o is ProposingConcertiRecord;
}
