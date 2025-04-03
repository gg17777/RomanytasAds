import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ListeSerateRecord extends FirestoreRecord {
  ListeSerateRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "cognome" field.
  String? _cognome;
  String get cognome => _cognome ?? '';
  bool hasCognome() => _cognome != null;

  // "entrato" field.
  bool? _entrato;
  bool get entrato => _entrato ?? false;
  bool hasEntrato() => _entrato != null;

  // "createdBy" field.
  String? _createdBy;
  String get createdBy => _createdBy ?? '';
  bool hasCreatedBy() => _createdBy != null;

  // "app_name" field.
  String? _appName;
  String get appName => _appName ?? '';
  bool hasAppName() => _appName != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _nome = snapshotData['nome'] as String?;
    _cognome = snapshotData['cognome'] as String?;
    _entrato = snapshotData['entrato'] as bool?;
    _createdBy = snapshotData['createdBy'] as String?;
    _appName = snapshotData['app_name'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('listeSerate')
          : FirebaseFirestore.instance.collectionGroup('listeSerate');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('listeSerate').doc(id);

  static Stream<ListeSerateRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ListeSerateRecord.fromSnapshot(s));

  static Future<ListeSerateRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ListeSerateRecord.fromSnapshot(s));

  static ListeSerateRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ListeSerateRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ListeSerateRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ListeSerateRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ListeSerateRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ListeSerateRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createListeSerateRecordData({
  String? nome,
  String? cognome,
  bool? entrato,
  String? createdBy,
  String? appName,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
      'cognome': cognome,
      'entrato': entrato,
      'createdBy': createdBy,
      'app_name': appName,
      'userRef': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class ListeSerateRecordDocumentEquality implements Equality<ListeSerateRecord> {
  const ListeSerateRecordDocumentEquality();

  @override
  bool equals(ListeSerateRecord? e1, ListeSerateRecord? e2) {
    return e1?.nome == e2?.nome &&
        e1?.cognome == e2?.cognome &&
        e1?.entrato == e2?.entrato &&
        e1?.createdBy == e2?.createdBy &&
        e1?.appName == e2?.appName &&
        e1?.userRef == e2?.userRef;
  }

  @override
  int hash(ListeSerateRecord? e) => const ListEquality().hash(
      [e?.nome, e?.cognome, e?.entrato, e?.createdBy, e?.appName, e?.userRef]);

  @override
  bool isValidKey(Object? o) => o is ListeSerateRecord;
}
