import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ListeSerateRecord extends FirestoreRecord {
  ListeSerateRecord._(
    super.reference,
    super.data,
  ) {
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

  // "serataRef" field.
  DocumentReference? _serataRef;
  DocumentReference? get serataRef => _serataRef;
  bool hasSerataRef() => _serataRef != null;

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

  void _initializeFields() {
    _nome = snapshotData['nome'] as String?;
    _cognome = snapshotData['cognome'] as String?;
    _serataRef = snapshotData['serataRef'] as DocumentReference?;
    _entrato = snapshotData['entrato'] as bool?;
    _createdBy = snapshotData['createdBy'] as String?;
    _appName = snapshotData['app_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('listeSerate');

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
  DocumentReference? serataRef,
  bool? entrato,
  String? createdBy,
  String? appName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
      'cognome': cognome,
      'serataRef': serataRef,
      'entrato': entrato,
      'createdBy': createdBy,
      'app_name': appName,
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
        e1?.serataRef == e2?.serataRef &&
        e1?.entrato == e2?.entrato &&
        e1?.createdBy == e2?.createdBy &&
        e1?.appName == e2?.appName;
  }

  @override
  int hash(ListeSerateRecord? e) => const ListEquality().hash([
        e?.nome,
        e?.cognome,
        e?.serataRef,
        e?.entrato,
        e?.createdBy,
        e?.appName
      ]);

  @override
  bool isValidKey(Object? o) => o is ListeSerateRecord;
}
