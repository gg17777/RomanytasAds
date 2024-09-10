import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConcertiRecord extends FirestoreRecord {
  ConcertiRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Titolo" field.
  String? _titolo;
  String get titolo => _titolo ?? '';
  bool hasTitolo() => _titolo != null;

  // "Locandina" field.
  String? _locandina;
  String get locandina => _locandina ?? '';
  bool hasLocandina() => _locandina != null;

  // "Hashtag" field.
  String? _hashtag;
  String get hashtag => _hashtag ?? '';
  bool hasHashtag() => _hashtag != null;

  // "Orario" field.
  String? _orario;
  String get orario => _orario ?? '';
  bool hasOrario() => _orario != null;

  // "Descrizione" field.
  String? _descrizione;
  String get descrizione => _descrizione ?? '';
  bool hasDescrizione() => _descrizione != null;

  // "Locale" field.
  String? _locale;
  String get locale => _locale ?? '';
  bool hasLocale() => _locale != null;

  // "ImgLocale" field.
  String? _imgLocale;
  String get imgLocale => _imgLocale ?? '';
  bool hasImgLocale() => _imgLocale != null;

  // "Localita" field.
  String? _localita;
  String get localita => _localita ?? '';
  bool hasLocalita() => _localita != null;

  // "Ingresso1" field.
  String? _ingresso1;
  String get ingresso1 => _ingresso1 ?? '';
  bool hasIngresso1() => _ingresso1 != null;

  // "Ingresso1Prezzo" field.
  String? _ingresso1Prezzo;
  String get ingresso1Prezzo => _ingresso1Prezzo ?? '';
  bool hasIngresso1Prezzo() => _ingresso1Prezzo != null;

  // "Ingresso2" field.
  String? _ingresso2;
  String get ingresso2 => _ingresso2 ?? '';
  bool hasIngresso2() => _ingresso2 != null;

  // "Ingresso2Prezzo" field.
  String? _ingresso2Prezzo;
  String get ingresso2Prezzo => _ingresso2Prezzo ?? '';
  bool hasIngresso2Prezzo() => _ingresso2Prezzo != null;

  // "Ingresso3" field.
  String? _ingresso3;
  String get ingresso3 => _ingresso3 ?? '';
  bool hasIngresso3() => _ingresso3 != null;

  // "Ingresso3Prezzo" field.
  String? _ingresso3Prezzo;
  String get ingresso3Prezzo => _ingresso3Prezzo ?? '';
  bool hasIngresso3Prezzo() => _ingresso3Prezzo != null;

  // "Indirizzo" field.
  LatLng? _indirizzo;
  LatLng? get indirizzo => _indirizzo;
  bool hasIndirizzo() => _indirizzo != null;

  // "Data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  // "urlMaps" field.
  String? _urlMaps;
  String get urlMaps => _urlMaps ?? '';
  bool hasUrlMaps() => _urlMaps != null;

  // "urlBiglietti" field.
  String? _urlBiglietti;
  String get urlBiglietti => _urlBiglietti ?? '';
  bool hasUrlBiglietti() => _urlBiglietti != null;

  // "biglietti" field.
  bool? _biglietti;
  bool get biglietti => _biglietti ?? false;
  bool hasBiglietti() => _biglietti != null;

  // "addressText" field.
  String? _addressText;
  String get addressText => _addressText ?? '';
  bool hasAddressText() => _addressText != null;

  // "categoriaMusica" field.
  String? _categoriaMusica;
  String get categoriaMusica => _categoriaMusica ?? '';
  bool hasCategoriaMusica() => _categoriaMusica != null;

  // "views" field.
  int? _views;
  int get views => _views ?? 0;
  bool hasViews() => _views != null;

  // "shared" field.
  int? _shared;
  int get shared => _shared ?? 0;
  bool hasShared() => _shared != null;

  // "app_name" field.
  String? _appName;
  String get appName => _appName ?? '';
  bool hasAppName() => _appName != null;

  // "createdBy" field.
  String? _createdBy;
  String get createdBy => _createdBy ?? '';
  bool hasCreatedBy() => _createdBy != null;

  void _initializeFields() {
    _titolo = snapshotData['Titolo'] as String?;
    _locandina = snapshotData['Locandina'] as String?;
    _hashtag = snapshotData['Hashtag'] as String?;
    _orario = snapshotData['Orario'] as String?;
    _descrizione = snapshotData['Descrizione'] as String?;
    _locale = snapshotData['Locale'] as String?;
    _imgLocale = snapshotData['ImgLocale'] as String?;
    _localita = snapshotData['Localita'] as String?;
    _ingresso1 = snapshotData['Ingresso1'] as String?;
    _ingresso1Prezzo = snapshotData['Ingresso1Prezzo'] as String?;
    _ingresso2 = snapshotData['Ingresso2'] as String?;
    _ingresso2Prezzo = snapshotData['Ingresso2Prezzo'] as String?;
    _ingresso3 = snapshotData['Ingresso3'] as String?;
    _ingresso3Prezzo = snapshotData['Ingresso3Prezzo'] as String?;
    _indirizzo = snapshotData['Indirizzo'] as LatLng?;
    _data = snapshotData['Data'] as DateTime?;
    _urlMaps = snapshotData['urlMaps'] as String?;
    _urlBiglietti = snapshotData['urlBiglietti'] as String?;
    _biglietti = snapshotData['biglietti'] as bool?;
    _addressText = snapshotData['addressText'] as String?;
    _categoriaMusica = snapshotData['categoriaMusica'] as String?;
    _views = castToType<int>(snapshotData['views']);
    _shared = castToType<int>(snapshotData['shared']);
    _appName = snapshotData['app_name'] as String?;
    _createdBy = snapshotData['createdBy'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Concerti');

  static Stream<ConcertiRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConcertiRecord.fromSnapshot(s));

  static Future<ConcertiRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ConcertiRecord.fromSnapshot(s));

  static ConcertiRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ConcertiRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConcertiRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConcertiRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConcertiRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConcertiRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConcertiRecordData({
  String? titolo,
  String? locandina,
  String? hashtag,
  String? orario,
  String? descrizione,
  String? locale,
  String? imgLocale,
  String? localita,
  String? ingresso1,
  String? ingresso1Prezzo,
  String? ingresso2,
  String? ingresso2Prezzo,
  String? ingresso3,
  String? ingresso3Prezzo,
  LatLng? indirizzo,
  DateTime? data,
  String? urlMaps,
  String? urlBiglietti,
  bool? biglietti,
  String? addressText,
  String? categoriaMusica,
  int? views,
  int? shared,
  String? appName,
  String? createdBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Titolo': titolo,
      'Locandina': locandina,
      'Hashtag': hashtag,
      'Orario': orario,
      'Descrizione': descrizione,
      'Locale': locale,
      'ImgLocale': imgLocale,
      'Localita': localita,
      'Ingresso1': ingresso1,
      'Ingresso1Prezzo': ingresso1Prezzo,
      'Ingresso2': ingresso2,
      'Ingresso2Prezzo': ingresso2Prezzo,
      'Ingresso3': ingresso3,
      'Ingresso3Prezzo': ingresso3Prezzo,
      'Indirizzo': indirizzo,
      'Data': data,
      'urlMaps': urlMaps,
      'urlBiglietti': urlBiglietti,
      'biglietti': biglietti,
      'addressText': addressText,
      'categoriaMusica': categoriaMusica,
      'views': views,
      'shared': shared,
      'app_name': appName,
      'createdBy': createdBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConcertiRecordDocumentEquality implements Equality<ConcertiRecord> {
  const ConcertiRecordDocumentEquality();

  @override
  bool equals(ConcertiRecord? e1, ConcertiRecord? e2) {
    return e1?.titolo == e2?.titolo &&
        e1?.locandina == e2?.locandina &&
        e1?.hashtag == e2?.hashtag &&
        e1?.orario == e2?.orario &&
        e1?.descrizione == e2?.descrizione &&
        e1?.locale == e2?.locale &&
        e1?.imgLocale == e2?.imgLocale &&
        e1?.localita == e2?.localita &&
        e1?.ingresso1 == e2?.ingresso1 &&
        e1?.ingresso1Prezzo == e2?.ingresso1Prezzo &&
        e1?.ingresso2 == e2?.ingresso2 &&
        e1?.ingresso2Prezzo == e2?.ingresso2Prezzo &&
        e1?.ingresso3 == e2?.ingresso3 &&
        e1?.ingresso3Prezzo == e2?.ingresso3Prezzo &&
        e1?.indirizzo == e2?.indirizzo &&
        e1?.data == e2?.data &&
        e1?.urlMaps == e2?.urlMaps &&
        e1?.urlBiglietti == e2?.urlBiglietti &&
        e1?.biglietti == e2?.biglietti &&
        e1?.addressText == e2?.addressText &&
        e1?.categoriaMusica == e2?.categoriaMusica &&
        e1?.views == e2?.views &&
        e1?.shared == e2?.shared &&
        e1?.appName == e2?.appName &&
        e1?.createdBy == e2?.createdBy;
  }

  @override
  int hash(ConcertiRecord? e) => const ListEquality().hash([
        e?.titolo,
        e?.locandina,
        e?.hashtag,
        e?.orario,
        e?.descrizione,
        e?.locale,
        e?.imgLocale,
        e?.localita,
        e?.ingresso1,
        e?.ingresso1Prezzo,
        e?.ingresso2,
        e?.ingresso2Prezzo,
        e?.ingresso3,
        e?.ingresso3Prezzo,
        e?.indirizzo,
        e?.data,
        e?.urlMaps,
        e?.urlBiglietti,
        e?.biglietti,
        e?.addressText,
        e?.categoriaMusica,
        e?.views,
        e?.shared,
        e?.appName,
        e?.createdBy
      ]);

  @override
  bool isValidKey(Object? o) => o is ConcertiRecord;
}
