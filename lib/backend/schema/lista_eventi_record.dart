import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ListaEventiRecord extends FirestoreRecord {
  ListaEventiRecord._(
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

  // "entrato" field.
  bool? _entrato;
  bool get entrato => _entrato ?? false;
  bool hasEntrato() => _entrato != null;

  // "eventoRef" field.
  DocumentReference? _eventoRef;
  DocumentReference? get eventoRef => _eventoRef;
  bool hasEventoRef() => _eventoRef != null;

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
    _entrato = snapshotData['entrato'] as bool?;
    _eventoRef = snapshotData['eventoRef'] as DocumentReference?;
    _createdBy = snapshotData['createdBy'] as String?;
    _appName = snapshotData['app_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('listaEventi');

  static Stream<ListaEventiRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ListaEventiRecord.fromSnapshot(s));

  static Future<ListaEventiRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ListaEventiRecord.fromSnapshot(s));

  static ListaEventiRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ListaEventiRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ListaEventiRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ListaEventiRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ListaEventiRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ListaEventiRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createListaEventiRecordData({
  String? nome,
  String? cognome,
  bool? entrato,
  DocumentReference? eventoRef,
  String? createdBy,
  String? appName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
      'cognome': cognome,
      'entrato': entrato,
      'eventoRef': eventoRef,
      'createdBy': createdBy,
      'app_name': appName,
    }.withoutNulls,
  );

  return firestoreData;
}

class ListaEventiRecordDocumentEquality implements Equality<ListaEventiRecord> {
  const ListaEventiRecordDocumentEquality();

  @override
  bool equals(ListaEventiRecord? e1, ListaEventiRecord? e2) {
    return e1?.nome == e2?.nome &&
        e1?.cognome == e2?.cognome &&
        e1?.entrato == e2?.entrato &&
        e1?.eventoRef == e2?.eventoRef &&
        e1?.createdBy == e2?.createdBy &&
        e1?.appName == e2?.appName;
  }

  @override
  int hash(ListaEventiRecord? e) => const ListEquality().hash([
        e?.nome,
        e?.cognome,
        e?.entrato,
        e?.eventoRef,
        e?.createdBy,
        e?.appName
      ]);

  @override
  bool isValidKey(Object? o) => o is ListaEventiRecord;
}
