import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SegnalazioniNasoniRecord extends FirestoreRecord {
  SegnalazioniNasoniRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Indirizzo" field.
  LatLng? _indirizzo;
  LatLng? get indirizzo => _indirizzo;
  bool hasIndirizzo() => _indirizzo != null;

  // "OrarioChiusura" field.
  String? _orarioChiusura;
  String get orarioChiusura => _orarioChiusura ?? '';
  bool hasOrarioChiusura() => _orarioChiusura != null;

  // "userEmail" field.
  String? _userEmail;
  String get userEmail => _userEmail ?? '';
  bool hasUserEmail() => _userEmail != null;

  // "descrizione" field.
  String? _descrizione;
  String get descrizione => _descrizione ?? '';
  bool hasDescrizione() => _descrizione != null;

  // "createDate" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "aggiungiOelimina" field.
  String? _aggiungiOelimina;
  String get aggiungiOelimina => _aggiungiOelimina ?? '';
  bool hasAggiungiOelimina() => _aggiungiOelimina != null;

  // "aggiungi" field.
  bool? _aggiungi;
  bool get aggiungi => _aggiungi ?? false;
  bool hasAggiungi() => _aggiungi != null;

  // "indirizzoText" field.
  String? _indirizzoText;
  String get indirizzoText => _indirizzoText ?? '';
  bool hasIndirizzoText() => _indirizzoText != null;

  // "createdBy" field.
  String? _createdBy;
  String get createdBy => _createdBy ?? '';
  bool hasCreatedBy() => _createdBy != null;

  // "app_name" field.
  String? _appName;
  String get appName => _appName ?? '';
  bool hasAppName() => _appName != null;

  // "userLoc" field.
  LatLng? _userLoc;
  LatLng? get userLoc => _userLoc;
  bool hasUserLoc() => _userLoc != null;

  void _initializeFields() {
    _indirizzo = snapshotData['Indirizzo'] as LatLng?;
    _orarioChiusura = snapshotData['OrarioChiusura'] as String?;
    _userEmail = snapshotData['userEmail'] as String?;
    _descrizione = snapshotData['descrizione'] as String?;
    _createDate = snapshotData['createDate'] as DateTime?;
    _aggiungiOelimina = snapshotData['aggiungiOelimina'] as String?;
    _aggiungi = snapshotData['aggiungi'] as bool?;
    _indirizzoText = snapshotData['indirizzoText'] as String?;
    _createdBy = snapshotData['createdBy'] as String?;
    _appName = snapshotData['app_name'] as String?;
    _userLoc = snapshotData['userLoc'] as LatLng?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('segnalazioniNasoni');

  static Stream<SegnalazioniNasoniRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SegnalazioniNasoniRecord.fromSnapshot(s));

  static Future<SegnalazioniNasoniRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => SegnalazioniNasoniRecord.fromSnapshot(s));

  static SegnalazioniNasoniRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SegnalazioniNasoniRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SegnalazioniNasoniRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SegnalazioniNasoniRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SegnalazioniNasoniRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SegnalazioniNasoniRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSegnalazioniNasoniRecordData({
  LatLng? indirizzo,
  String? orarioChiusura,
  String? userEmail,
  String? descrizione,
  DateTime? createDate,
  String? aggiungiOelimina,
  bool? aggiungi,
  String? indirizzoText,
  String? createdBy,
  String? appName,
  LatLng? userLoc,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Indirizzo': indirizzo,
      'OrarioChiusura': orarioChiusura,
      'userEmail': userEmail,
      'descrizione': descrizione,
      'createDate': createDate,
      'aggiungiOelimina': aggiungiOelimina,
      'aggiungi': aggiungi,
      'indirizzoText': indirizzoText,
      'createdBy': createdBy,
      'app_name': appName,
      'userLoc': userLoc,
    }.withoutNulls,
  );

  return firestoreData;
}

class SegnalazioniNasoniRecordDocumentEquality
    implements Equality<SegnalazioniNasoniRecord> {
  const SegnalazioniNasoniRecordDocumentEquality();

  @override
  bool equals(SegnalazioniNasoniRecord? e1, SegnalazioniNasoniRecord? e2) {
    return e1?.indirizzo == e2?.indirizzo &&
        e1?.orarioChiusura == e2?.orarioChiusura &&
        e1?.userEmail == e2?.userEmail &&
        e1?.descrizione == e2?.descrizione &&
        e1?.createDate == e2?.createDate &&
        e1?.aggiungiOelimina == e2?.aggiungiOelimina &&
        e1?.aggiungi == e2?.aggiungi &&
        e1?.indirizzoText == e2?.indirizzoText &&
        e1?.createdBy == e2?.createdBy &&
        e1?.appName == e2?.appName &&
        e1?.userLoc == e2?.userLoc;
  }

  @override
  int hash(SegnalazioniNasoniRecord? e) => const ListEquality().hash([
        e?.indirizzo,
        e?.orarioChiusura,
        e?.userEmail,
        e?.descrizione,
        e?.createDate,
        e?.aggiungiOelimina,
        e?.aggiungi,
        e?.indirizzoText,
        e?.createdBy,
        e?.appName,
        e?.userLoc
      ]);

  @override
  bool isValidKey(Object? o) => o is SegnalazioniNasoniRecord;
}
