import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MostreRecord extends FirestoreRecord {
  MostreRecord._(
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

  // "Ingresso1Descrizione" field.
  String? _ingresso1Descrizione;
  String get ingresso1Descrizione => _ingresso1Descrizione ?? '';
  bool hasIngresso1Descrizione() => _ingresso1Descrizione != null;

  // "Ingresso1Prezzo" field.
  String? _ingresso1Prezzo;
  String get ingresso1Prezzo => _ingresso1Prezzo ?? '';
  bool hasIngresso1Prezzo() => _ingresso1Prezzo != null;

  // "Ingresso2" field.
  String? _ingresso2;
  String get ingresso2 => _ingresso2 ?? '';
  bool hasIngresso2() => _ingresso2 != null;

  // "Ingresso2Descrizione" field.
  String? _ingresso2Descrizione;
  String get ingresso2Descrizione => _ingresso2Descrizione ?? '';
  bool hasIngresso2Descrizione() => _ingresso2Descrizione != null;

  // "Ingresso2Prezzo" field.
  String? _ingresso2Prezzo;
  String get ingresso2Prezzo => _ingresso2Prezzo ?? '';
  bool hasIngresso2Prezzo() => _ingresso2Prezzo != null;

  // "Ingresso3" field.
  String? _ingresso3;
  String get ingresso3 => _ingresso3 ?? '';
  bool hasIngresso3() => _ingresso3 != null;

  // "Ingresso3Descrizione" field.
  String? _ingresso3Descrizione;
  String get ingresso3Descrizione => _ingresso3Descrizione ?? '';
  bool hasIngresso3Descrizione() => _ingresso3Descrizione != null;

  // "Ingresso3Prezzo" field.
  String? _ingresso3Prezzo;
  String get ingresso3Prezzo => _ingresso3Prezzo ?? '';
  bool hasIngresso3Prezzo() => _ingresso3Prezzo != null;

  // "Indirizzo" field.
  LatLng? _indirizzo;
  LatLng? get indirizzo => _indirizzo;
  bool hasIndirizzo() => _indirizzo != null;

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

  // "dataInizio" field.
  DateTime? _dataInizio;
  DateTime? get dataInizio => _dataInizio;
  bool hasDataInizio() => _dataInizio != null;

  // "dataFine" field.
  DateTime? _dataFine;
  DateTime? get dataFine => _dataFine;
  bool hasDataFine() => _dataFine != null;

  // "addressText" field.
  String? _addressText;
  String get addressText => _addressText ?? '';
  bool hasAddressText() => _addressText != null;

  // "categoriaMostre" field.
  String? _categoriaMostre;
  String get categoriaMostre => _categoriaMostre ?? '';
  bool hasCategoriaMostre() => _categoriaMostre != null;

  // "gratis" field.
  bool? _gratis;
  bool get gratis => _gratis ?? false;
  bool hasGratis() => _gratis != null;

  // "ingressiGratisDescrizione" field.
  String? _ingressiGratisDescrizione;
  String get ingressiGratisDescrizione => _ingressiGratisDescrizione ?? '';
  bool hasIngressiGratisDescrizione() => _ingressiGratisDescrizione != null;

  // "views" field.
  int? _views;
  int get views => _views ?? 0;
  bool hasViews() => _views != null;

  // "shared" field.
  int? _shared;
  int get shared => _shared ?? 0;
  bool hasShared() => _shared != null;

  // "verificato" field.
  bool? _verificato;
  bool get verificato => _verificato ?? false;
  bool hasVerificato() => _verificato != null;

  // "mapViews" field.
  int? _mapViews;
  int get mapViews => _mapViews ?? 0;
  bool hasMapViews() => _mapViews != null;

  // "createdBy" field.
  String? _createdBy;
  String get createdBy => _createdBy ?? '';
  bool hasCreatedBy() => _createdBy != null;

  // "app_name" field.
  String? _appName;
  String get appName => _appName ?? '';
  bool hasAppName() => _appName != null;

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
    _ingresso1Descrizione = snapshotData['Ingresso1Descrizione'] as String?;
    _ingresso1Prezzo = snapshotData['Ingresso1Prezzo'] as String?;
    _ingresso2 = snapshotData['Ingresso2'] as String?;
    _ingresso2Descrizione = snapshotData['Ingresso2Descrizione'] as String?;
    _ingresso2Prezzo = snapshotData['Ingresso2Prezzo'] as String?;
    _ingresso3 = snapshotData['Ingresso3'] as String?;
    _ingresso3Descrizione = snapshotData['Ingresso3Descrizione'] as String?;
    _ingresso3Prezzo = snapshotData['Ingresso3Prezzo'] as String?;
    _indirizzo = snapshotData['Indirizzo'] as LatLng?;
    _urlMaps = snapshotData['urlMaps'] as String?;
    _urlBiglietti = snapshotData['urlBiglietti'] as String?;
    _biglietti = snapshotData['biglietti'] as bool?;
    _dataInizio = snapshotData['dataInizio'] as DateTime?;
    _dataFine = snapshotData['dataFine'] as DateTime?;
    _addressText = snapshotData['addressText'] as String?;
    _categoriaMostre = snapshotData['categoriaMostre'] as String?;
    _gratis = snapshotData['gratis'] as bool?;
    _ingressiGratisDescrizione =
        snapshotData['ingressiGratisDescrizione'] as String?;
    _views = castToType<int>(snapshotData['views']);
    _shared = castToType<int>(snapshotData['shared']);
    _verificato = snapshotData['verificato'] as bool?;
    _mapViews = castToType<int>(snapshotData['mapViews']);
    _createdBy = snapshotData['createdBy'] as String?;
    _appName = snapshotData['app_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Mostre');

  static Stream<MostreRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MostreRecord.fromSnapshot(s));

  static Future<MostreRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MostreRecord.fromSnapshot(s));

  static MostreRecord fromSnapshot(DocumentSnapshot snapshot) => MostreRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MostreRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MostreRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MostreRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MostreRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMostreRecordData({
  String? titolo,
  String? locandina,
  String? hashtag,
  String? orario,
  String? descrizione,
  String? locale,
  String? imgLocale,
  String? localita,
  String? ingresso1,
  String? ingresso1Descrizione,
  String? ingresso1Prezzo,
  String? ingresso2,
  String? ingresso2Descrizione,
  String? ingresso2Prezzo,
  String? ingresso3,
  String? ingresso3Descrizione,
  String? ingresso3Prezzo,
  LatLng? indirizzo,
  String? urlMaps,
  String? urlBiglietti,
  bool? biglietti,
  DateTime? dataInizio,
  DateTime? dataFine,
  String? addressText,
  String? categoriaMostre,
  bool? gratis,
  String? ingressiGratisDescrizione,
  int? views,
  int? shared,
  bool? verificato,
  int? mapViews,
  String? createdBy,
  String? appName,
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
      'Ingresso1Descrizione': ingresso1Descrizione,
      'Ingresso1Prezzo': ingresso1Prezzo,
      'Ingresso2': ingresso2,
      'Ingresso2Descrizione': ingresso2Descrizione,
      'Ingresso2Prezzo': ingresso2Prezzo,
      'Ingresso3': ingresso3,
      'Ingresso3Descrizione': ingresso3Descrizione,
      'Ingresso3Prezzo': ingresso3Prezzo,
      'Indirizzo': indirizzo,
      'urlMaps': urlMaps,
      'urlBiglietti': urlBiglietti,
      'biglietti': biglietti,
      'dataInizio': dataInizio,
      'dataFine': dataFine,
      'addressText': addressText,
      'categoriaMostre': categoriaMostre,
      'gratis': gratis,
      'ingressiGratisDescrizione': ingressiGratisDescrizione,
      'views': views,
      'shared': shared,
      'verificato': verificato,
      'mapViews': mapViews,
      'createdBy': createdBy,
      'app_name': appName,
    }.withoutNulls,
  );

  return firestoreData;
}

class MostreRecordDocumentEquality implements Equality<MostreRecord> {
  const MostreRecordDocumentEquality();

  @override
  bool equals(MostreRecord? e1, MostreRecord? e2) {
    return e1?.titolo == e2?.titolo &&
        e1?.locandina == e2?.locandina &&
        e1?.hashtag == e2?.hashtag &&
        e1?.orario == e2?.orario &&
        e1?.descrizione == e2?.descrizione &&
        e1?.locale == e2?.locale &&
        e1?.imgLocale == e2?.imgLocale &&
        e1?.localita == e2?.localita &&
        e1?.ingresso1 == e2?.ingresso1 &&
        e1?.ingresso1Descrizione == e2?.ingresso1Descrizione &&
        e1?.ingresso1Prezzo == e2?.ingresso1Prezzo &&
        e1?.ingresso2 == e2?.ingresso2 &&
        e1?.ingresso2Descrizione == e2?.ingresso2Descrizione &&
        e1?.ingresso2Prezzo == e2?.ingresso2Prezzo &&
        e1?.ingresso3 == e2?.ingresso3 &&
        e1?.ingresso3Descrizione == e2?.ingresso3Descrizione &&
        e1?.ingresso3Prezzo == e2?.ingresso3Prezzo &&
        e1?.indirizzo == e2?.indirizzo &&
        e1?.urlMaps == e2?.urlMaps &&
        e1?.urlBiglietti == e2?.urlBiglietti &&
        e1?.biglietti == e2?.biglietti &&
        e1?.dataInizio == e2?.dataInizio &&
        e1?.dataFine == e2?.dataFine &&
        e1?.addressText == e2?.addressText &&
        e1?.categoriaMostre == e2?.categoriaMostre &&
        e1?.gratis == e2?.gratis &&
        e1?.ingressiGratisDescrizione == e2?.ingressiGratisDescrizione &&
        e1?.views == e2?.views &&
        e1?.shared == e2?.shared &&
        e1?.verificato == e2?.verificato &&
        e1?.mapViews == e2?.mapViews &&
        e1?.createdBy == e2?.createdBy &&
        e1?.appName == e2?.appName;
  }

  @override
  int hash(MostreRecord? e) => const ListEquality().hash([
        e?.titolo,
        e?.locandina,
        e?.hashtag,
        e?.orario,
        e?.descrizione,
        e?.locale,
        e?.imgLocale,
        e?.localita,
        e?.ingresso1,
        e?.ingresso1Descrizione,
        e?.ingresso1Prezzo,
        e?.ingresso2,
        e?.ingresso2Descrizione,
        e?.ingresso2Prezzo,
        e?.ingresso3,
        e?.ingresso3Descrizione,
        e?.ingresso3Prezzo,
        e?.indirizzo,
        e?.urlMaps,
        e?.urlBiglietti,
        e?.biglietti,
        e?.dataInizio,
        e?.dataFine,
        e?.addressText,
        e?.categoriaMostre,
        e?.gratis,
        e?.ingressiGratisDescrizione,
        e?.views,
        e?.shared,
        e?.verificato,
        e?.mapViews,
        e?.createdBy,
        e?.appName
      ]);

  @override
  bool isValidKey(Object? o) => o is MostreRecord;
}
