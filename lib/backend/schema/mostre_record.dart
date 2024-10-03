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

  // "closedMonday" field.
  bool? _closedMonday;
  bool get closedMonday => _closedMonday ?? false;
  bool hasClosedMonday() => _closedMonday != null;

  // "closedTuesday" field.
  bool? _closedTuesday;
  bool get closedTuesday => _closedTuesday ?? false;
  bool hasClosedTuesday() => _closedTuesday != null;

  // "closedWednesday" field.
  bool? _closedWednesday;
  bool get closedWednesday => _closedWednesday ?? false;
  bool hasClosedWednesday() => _closedWednesday != null;

  // "closedThursday" field.
  bool? _closedThursday;
  bool get closedThursday => _closedThursday ?? false;
  bool hasClosedThursday() => _closedThursday != null;

  // "closedFriday" field.
  bool? _closedFriday;
  bool get closedFriday => _closedFriday ?? false;
  bool hasClosedFriday() => _closedFriday != null;

  // "closedSaturday" field.
  bool? _closedSaturday;
  bool get closedSaturday => _closedSaturday ?? false;
  bool hasClosedSaturday() => _closedSaturday != null;

  // "closedSunday" field.
  bool? _closedSunday;
  bool get closedSunday => _closedSunday ?? false;
  bool hasClosedSunday() => _closedSunday != null;

  // "organizzatore" field.
  bool? _organizzatore;
  bool get organizzatore => _organizzatore ?? false;
  bool hasOrganizzatore() => _organizzatore != null;

  // "organizzatoreName" field.
  String? _organizzatoreName;
  String get organizzatoreName => _organizzatoreName ?? '';
  bool hasOrganizzatoreName() => _organizzatoreName != null;

  // "organizzatoreImg" field.
  String? _organizzatoreImg;
  String get organizzatoreImg => _organizzatoreImg ?? '';
  bool hasOrganizzatoreImg() => _organizzatoreImg != null;

  // "startMonday" field.
  String? _startMonday;
  String get startMonday => _startMonday ?? '';
  bool hasStartMonday() => _startMonday != null;

  // "endMonday" field.
  String? _endMonday;
  String get endMonday => _endMonday ?? '';
  bool hasEndMonday() => _endMonday != null;

  // "startTuesday" field.
  String? _startTuesday;
  String get startTuesday => _startTuesday ?? '';
  bool hasStartTuesday() => _startTuesday != null;

  // "endTuesday" field.
  String? _endTuesday;
  String get endTuesday => _endTuesday ?? '';
  bool hasEndTuesday() => _endTuesday != null;

  // "startWednesday" field.
  String? _startWednesday;
  String get startWednesday => _startWednesday ?? '';
  bool hasStartWednesday() => _startWednesday != null;

  // "endWednesday" field.
  String? _endWednesday;
  String get endWednesday => _endWednesday ?? '';
  bool hasEndWednesday() => _endWednesday != null;

  // "startThursday" field.
  String? _startThursday;
  String get startThursday => _startThursday ?? '';
  bool hasStartThursday() => _startThursday != null;

  // "endThursday" field.
  String? _endThursday;
  String get endThursday => _endThursday ?? '';
  bool hasEndThursday() => _endThursday != null;

  // "startFriday" field.
  String? _startFriday;
  String get startFriday => _startFriday ?? '';
  bool hasStartFriday() => _startFriday != null;

  // "endFriday" field.
  String? _endFriday;
  String get endFriday => _endFriday ?? '';
  bool hasEndFriday() => _endFriday != null;

  // "startSaturday" field.
  String? _startSaturday;
  String get startSaturday => _startSaturday ?? '';
  bool hasStartSaturday() => _startSaturday != null;

  // "endSaturday" field.
  String? _endSaturday;
  String get endSaturday => _endSaturday ?? '';
  bool hasEndSaturday() => _endSaturday != null;

  // "startSunday" field.
  String? _startSunday;
  String get startSunday => _startSunday ?? '';
  bool hasStartSunday() => _startSunday != null;

  // "endSunday" field.
  String? _endSunday;
  String get endSunday => _endSunday ?? '';
  bool hasEndSunday() => _endSunday != null;

  // "mostraMngRef" field.
  DocumentReference? _mostraMngRef;
  DocumentReference? get mostraMngRef => _mostraMngRef;
  bool hasMostraMngRef() => _mostraMngRef != null;

  // "ingresso2B" field.
  bool? _ingresso2B;
  bool get ingresso2B => _ingresso2B ?? false;
  bool hasIngresso2B() => _ingresso2B != null;

  // "ingresso3B" field.
  bool? _ingresso3B;
  bool get ingresso3B => _ingresso3B ?? false;
  bool hasIngresso3B() => _ingresso3B != null;

  // "usaOrariMuseo" field.
  bool? _usaOrariMuseo;
  bool get usaOrariMuseo => _usaOrariMuseo ?? false;
  bool hasUsaOrariMuseo() => _usaOrariMuseo != null;

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
    _closedMonday = snapshotData['closedMonday'] as bool?;
    _closedTuesday = snapshotData['closedTuesday'] as bool?;
    _closedWednesday = snapshotData['closedWednesday'] as bool?;
    _closedThursday = snapshotData['closedThursday'] as bool?;
    _closedFriday = snapshotData['closedFriday'] as bool?;
    _closedSaturday = snapshotData['closedSaturday'] as bool?;
    _closedSunday = snapshotData['closedSunday'] as bool?;
    _organizzatore = snapshotData['organizzatore'] as bool?;
    _organizzatoreName = snapshotData['organizzatoreName'] as String?;
    _organizzatoreImg = snapshotData['organizzatoreImg'] as String?;
    _startMonday = snapshotData['startMonday'] as String?;
    _endMonday = snapshotData['endMonday'] as String?;
    _startTuesday = snapshotData['startTuesday'] as String?;
    _endTuesday = snapshotData['endTuesday'] as String?;
    _startWednesday = snapshotData['startWednesday'] as String?;
    _endWednesday = snapshotData['endWednesday'] as String?;
    _startThursday = snapshotData['startThursday'] as String?;
    _endThursday = snapshotData['endThursday'] as String?;
    _startFriday = snapshotData['startFriday'] as String?;
    _endFriday = snapshotData['endFriday'] as String?;
    _startSaturday = snapshotData['startSaturday'] as String?;
    _endSaturday = snapshotData['endSaturday'] as String?;
    _startSunday = snapshotData['startSunday'] as String?;
    _endSunday = snapshotData['endSunday'] as String?;
    _mostraMngRef = snapshotData['mostraMngRef'] as DocumentReference?;
    _ingresso2B = snapshotData['ingresso2B'] as bool?;
    _ingresso3B = snapshotData['ingresso3B'] as bool?;
    _usaOrariMuseo = snapshotData['usaOrariMuseo'] as bool?;
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
  bool? closedMonday,
  bool? closedTuesday,
  bool? closedWednesday,
  bool? closedThursday,
  bool? closedFriday,
  bool? closedSaturday,
  bool? closedSunday,
  bool? organizzatore,
  String? organizzatoreName,
  String? organizzatoreImg,
  String? startMonday,
  String? endMonday,
  String? startTuesday,
  String? endTuesday,
  String? startWednesday,
  String? endWednesday,
  String? startThursday,
  String? endThursday,
  String? startFriday,
  String? endFriday,
  String? startSaturday,
  String? endSaturday,
  String? startSunday,
  String? endSunday,
  DocumentReference? mostraMngRef,
  bool? ingresso2B,
  bool? ingresso3B,
  bool? usaOrariMuseo,
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
      'closedMonday': closedMonday,
      'closedTuesday': closedTuesday,
      'closedWednesday': closedWednesday,
      'closedThursday': closedThursday,
      'closedFriday': closedFriday,
      'closedSaturday': closedSaturday,
      'closedSunday': closedSunday,
      'organizzatore': organizzatore,
      'organizzatoreName': organizzatoreName,
      'organizzatoreImg': organizzatoreImg,
      'startMonday': startMonday,
      'endMonday': endMonday,
      'startTuesday': startTuesday,
      'endTuesday': endTuesday,
      'startWednesday': startWednesday,
      'endWednesday': endWednesday,
      'startThursday': startThursday,
      'endThursday': endThursday,
      'startFriday': startFriday,
      'endFriday': endFriday,
      'startSaturday': startSaturday,
      'endSaturday': endSaturday,
      'startSunday': startSunday,
      'endSunday': endSunday,
      'mostraMngRef': mostraMngRef,
      'ingresso2B': ingresso2B,
      'ingresso3B': ingresso3B,
      'usaOrariMuseo': usaOrariMuseo,
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
        e1?.appName == e2?.appName &&
        e1?.closedMonday == e2?.closedMonday &&
        e1?.closedTuesday == e2?.closedTuesday &&
        e1?.closedWednesday == e2?.closedWednesday &&
        e1?.closedThursday == e2?.closedThursday &&
        e1?.closedFriday == e2?.closedFriday &&
        e1?.closedSaturday == e2?.closedSaturday &&
        e1?.closedSunday == e2?.closedSunday &&
        e1?.organizzatore == e2?.organizzatore &&
        e1?.organizzatoreName == e2?.organizzatoreName &&
        e1?.organizzatoreImg == e2?.organizzatoreImg &&
        e1?.startMonday == e2?.startMonday &&
        e1?.endMonday == e2?.endMonday &&
        e1?.startTuesday == e2?.startTuesday &&
        e1?.endTuesday == e2?.endTuesday &&
        e1?.startWednesday == e2?.startWednesday &&
        e1?.endWednesday == e2?.endWednesday &&
        e1?.startThursday == e2?.startThursday &&
        e1?.endThursday == e2?.endThursday &&
        e1?.startFriday == e2?.startFriday &&
        e1?.endFriday == e2?.endFriday &&
        e1?.startSaturday == e2?.startSaturday &&
        e1?.endSaturday == e2?.endSaturday &&
        e1?.startSunday == e2?.startSunday &&
        e1?.endSunday == e2?.endSunday &&
        e1?.mostraMngRef == e2?.mostraMngRef &&
        e1?.ingresso2B == e2?.ingresso2B &&
        e1?.ingresso3B == e2?.ingresso3B &&
        e1?.usaOrariMuseo == e2?.usaOrariMuseo;
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
        e?.appName,
        e?.closedMonday,
        e?.closedTuesday,
        e?.closedWednesday,
        e?.closedThursday,
        e?.closedFriday,
        e?.closedSaturday,
        e?.closedSunday,
        e?.organizzatore,
        e?.organizzatoreName,
        e?.organizzatoreImg,
        e?.startMonday,
        e?.endMonday,
        e?.startTuesday,
        e?.endTuesday,
        e?.startWednesday,
        e?.endWednesday,
        e?.startThursday,
        e?.endThursday,
        e?.startFriday,
        e?.endFriday,
        e?.startSaturday,
        e?.endSaturday,
        e?.startSunday,
        e?.endSunday,
        e?.mostraMngRef,
        e?.ingresso2B,
        e?.ingresso3B,
        e?.usaOrariMuseo
      ]);

  @override
  bool isValidKey(Object? o) => o is MostreRecord;
}
