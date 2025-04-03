import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SegnalazioneCiboRecord extends FirestoreRecord {
  SegnalazioneCiboRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nomeLocale" field.
  String? _nomeLocale;
  String get nomeLocale => _nomeLocale ?? '';
  bool hasNomeLocale() => _nomeLocale != null;

  // "indirizzo" field.
  LatLng? _indirizzo;
  LatLng? get indirizzo => _indirizzo;
  bool hasIndirizzo() => _indirizzo != null;

  // "userEmail" field.
  String? _userEmail;
  String get userEmail => _userEmail ?? '';
  bool hasUserEmail() => _userEmail != null;

  // "createDate" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "indirizzoText" field.
  String? _indirizzoText;
  String get indirizzoText => _indirizzoText ?? '';
  bool hasIndirizzoText() => _indirizzoText != null;

  // "elimina" field.
  bool? _elimina;
  bool get elimina => _elimina ?? false;
  bool hasElimina() => _elimina != null;

  // "descrizione" field.
  String? _descrizione;
  String get descrizione => _descrizione ?? '';
  bool hasDescrizione() => _descrizione != null;

  // "createdBy" field.
  String? _createdBy;
  String get createdBy => _createdBy ?? '';
  bool hasCreatedBy() => _createdBy != null;

  // "app_name" field.
  String? _appName;
  String get appName => _appName ?? '';
  bool hasAppName() => _appName != null;

  void _initializeFields() {
    _nomeLocale = snapshotData['nomeLocale'] as String?;
    _indirizzo = snapshotData['indirizzo'] as LatLng?;
    _userEmail = snapshotData['userEmail'] as String?;
    _createDate = snapshotData['createDate'] as DateTime?;
    _indirizzoText = snapshotData['indirizzoText'] as String?;
    _elimina = snapshotData['elimina'] as bool?;
    _descrizione = snapshotData['descrizione'] as String?;
    _createdBy = snapshotData['createdBy'] as String?;
    _appName = snapshotData['app_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('segnalazioneCibo');

  static Stream<SegnalazioneCiboRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SegnalazioneCiboRecord.fromSnapshot(s));

  static Future<SegnalazioneCiboRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => SegnalazioneCiboRecord.fromSnapshot(s));

  static SegnalazioneCiboRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SegnalazioneCiboRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SegnalazioneCiboRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SegnalazioneCiboRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SegnalazioneCiboRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SegnalazioneCiboRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSegnalazioneCiboRecordData({
  String? nomeLocale,
  LatLng? indirizzo,
  String? userEmail,
  DateTime? createDate,
  String? indirizzoText,
  bool? elimina,
  String? descrizione,
  String? createdBy,
  String? appName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nomeLocale': nomeLocale,
      'indirizzo': indirizzo,
      'userEmail': userEmail,
      'createDate': createDate,
      'indirizzoText': indirizzoText,
      'elimina': elimina,
      'descrizione': descrizione,
      'createdBy': createdBy,
      'app_name': appName,
    }.withoutNulls,
  );

  return firestoreData;
}

class SegnalazioneCiboRecordDocumentEquality
    implements Equality<SegnalazioneCiboRecord> {
  const SegnalazioneCiboRecordDocumentEquality();

  @override
  bool equals(SegnalazioneCiboRecord? e1, SegnalazioneCiboRecord? e2) {
    return e1?.nomeLocale == e2?.nomeLocale &&
        e1?.indirizzo == e2?.indirizzo &&
        e1?.userEmail == e2?.userEmail &&
        e1?.createDate == e2?.createDate &&
        e1?.indirizzoText == e2?.indirizzoText &&
        e1?.elimina == e2?.elimina &&
        e1?.descrizione == e2?.descrizione &&
        e1?.createdBy == e2?.createdBy &&
        e1?.appName == e2?.appName;
  }

  @override
  int hash(SegnalazioneCiboRecord? e) => const ListEquality().hash([
        e?.nomeLocale,
        e?.indirizzo,
        e?.userEmail,
        e?.createDate,
        e?.indirizzoText,
        e?.elimina,
        e?.descrizione,
        e?.createdBy,
        e?.appName
      ]);

  @override
  bool isValidKey(Object? o) => o is SegnalazioneCiboRecord;
}
