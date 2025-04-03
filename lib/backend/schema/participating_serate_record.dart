import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ParticipatingSerateRecord extends FirestoreRecord {
  ParticipatingSerateRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userParticipatingSerateRef" field.
  DocumentReference? _userParticipatingSerateRef;
  DocumentReference? get userParticipatingSerateRef =>
      _userParticipatingSerateRef;
  bool hasUserParticipatingSerateRef() => _userParticipatingSerateRef != null;

  // "private_account" field.
  bool? _privateAccount;
  bool get privateAccount => _privateAccount ?? false;
  bool hasPrivateAccount() => _privateAccount != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userParticipatingSerateRef =
        snapshotData['userParticipatingSerateRef'] as DocumentReference?;
    _privateAccount = snapshotData['private_account'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('participatingSerate')
          : FirebaseFirestore.instance.collectionGroup('participatingSerate');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('participatingSerate').doc(id);

  static Stream<ParticipatingSerateRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ParticipatingSerateRecord.fromSnapshot(s));

  static Future<ParticipatingSerateRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ParticipatingSerateRecord.fromSnapshot(s));

  static ParticipatingSerateRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ParticipatingSerateRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ParticipatingSerateRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ParticipatingSerateRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ParticipatingSerateRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ParticipatingSerateRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createParticipatingSerateRecordData({
  DocumentReference? userParticipatingSerateRef,
  bool? privateAccount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userParticipatingSerateRef': userParticipatingSerateRef,
      'private_account': privateAccount,
    }.withoutNulls,
  );

  return firestoreData;
}

class ParticipatingSerateRecordDocumentEquality
    implements Equality<ParticipatingSerateRecord> {
  const ParticipatingSerateRecordDocumentEquality();

  @override
  bool equals(ParticipatingSerateRecord? e1, ParticipatingSerateRecord? e2) {
    return e1?.userParticipatingSerateRef == e2?.userParticipatingSerateRef &&
        e1?.privateAccount == e2?.privateAccount;
  }

  @override
  int hash(ParticipatingSerateRecord? e) => const ListEquality()
      .hash([e?.userParticipatingSerateRef, e?.privateAccount]);

  @override
  bool isValidKey(Object? o) => o is ParticipatingSerateRecord;
}
