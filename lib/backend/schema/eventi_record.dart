import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventiRecord extends FirestoreRecord {
  EventiRecord._(
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

  // "Hashtags" field.
  String? _hashtags;
  String get hashtags => _hashtags ?? '';
  bool hasHashtags() => _hashtags != null;

  // "Descrizione" field.
  String? _descrizione;
  String get descrizione => _descrizione ?? '';
  bool hasDescrizione() => _descrizione != null;

  // "Locale" field.
  String? _locale;
  String get locale => _locale ?? '';
  bool hasLocale() => _locale != null;

  // "imgLocale" field.
  String? _imgLocale;
  String get imgLocale => _imgLocale ?? '';
  bool hasImgLocale() => _imgLocale != null;

  // "Localita" field.
  String? _localita;
  String get localita => _localita ?? '';
  bool hasLocalita() => _localita != null;

  // "Data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  // "Indirizzo" field.
  LatLng? _indirizzo;
  LatLng? get indirizzo => _indirizzo;
  bool hasIndirizzo() => _indirizzo != null;

  // "urlMaps" field.
  String? _urlMaps;
  String get urlMaps => _urlMaps ?? '';
  bool hasUrlMaps() => _urlMaps != null;

  // "Ingresso1nome" field.
  String? _ingresso1nome;
  String get ingresso1nome => _ingresso1nome ?? '';
  bool hasIngresso1nome() => _ingresso1nome != null;

  // "Ingresso1Info" field.
  String? _ingresso1Info;
  String get ingresso1Info => _ingresso1Info ?? '';
  bool hasIngresso1Info() => _ingresso1Info != null;

  // "ingresso1Costo" field.
  String? _ingresso1Costo;
  String get ingresso1Costo => _ingresso1Costo ?? '';
  bool hasIngresso1Costo() => _ingresso1Costo != null;

  // "ingresso2nome" field.
  String? _ingresso2nome;
  String get ingresso2nome => _ingresso2nome ?? '';
  bool hasIngresso2nome() => _ingresso2nome != null;

  // "ingresso2Info" field.
  String? _ingresso2Info;
  String get ingresso2Info => _ingresso2Info ?? '';
  bool hasIngresso2Info() => _ingresso2Info != null;

  // "ingresso2Costo" field.
  String? _ingresso2Costo;
  String get ingresso2Costo => _ingresso2Costo ?? '';
  bool hasIngresso2Costo() => _ingresso2Costo != null;

  // "ingresso3Nome" field.
  String? _ingresso3Nome;
  String get ingresso3Nome => _ingresso3Nome ?? '';
  bool hasIngresso3Nome() => _ingresso3Nome != null;

  // "ingresso3Info" field.
  String? _ingresso3Info;
  String get ingresso3Info => _ingresso3Info ?? '';
  bool hasIngresso3Info() => _ingresso3Info != null;

  // "ingresso3Costo" field.
  String? _ingresso3Costo;
  String get ingresso3Costo => _ingresso3Costo ?? '';
  bool hasIngresso3Costo() => _ingresso3Costo != null;

  // "Biglietti" field.
  bool? _biglietti;
  bool get biglietti => _biglietti ?? false;
  bool hasBiglietti() => _biglietti != null;

  // "bigliettiUrl" field.
  String? _bigliettiUrl;
  String get bigliettiUrl => _bigliettiUrl ?? '';
  bool hasBigliettiUrl() => _bigliettiUrl != null;

  // "verificato" field.
  bool? _verificato;
  bool get verificato => _verificato ?? false;
  bool hasVerificato() => _verificato != null;

  // "telefonoWa" field.
  String? _telefonoWa;
  String get telefonoWa => _telefonoWa ?? '';
  bool hasTelefonoWa() => _telefonoWa != null;

  // "contatto" field.
  bool? _contatto;
  bool get contatto => _contatto ?? false;
  bool hasContatto() => _contatto != null;

  // "inizioOrario" field.
  DateTime? _inizioOrario;
  DateTime? get inizioOrario => _inizioOrario;
  bool hasInizioOrario() => _inizioOrario != null;

  // "fineOrario" field.
  DateTime? _fineOrario;
  DateTime? get fineOrario => _fineOrario;
  bool hasFineOrario() => _fineOrario != null;

  // "eventoRicorrente" field.
  bool? _eventoRicorrente;
  bool get eventoRicorrente => _eventoRicorrente ?? false;
  bool hasEventoRicorrente() => _eventoRicorrente != null;

  // "gratis" field.
  bool? _gratis;
  bool get gratis => _gratis ?? false;
  bool hasGratis() => _gratis != null;

  // "tipo" field.
  List<String>? _tipo;
  List<String> get tipo => _tipo ?? const [];
  bool hasTipo() => _tipo != null;

  // "addressText" field.
  String? _addressText;
  String get addressText => _addressText ?? '';
  bool hasAddressText() => _addressText != null;

  // "categoriaEvento" field.
  String? _categoriaEvento;
  String get categoriaEvento => _categoriaEvento ?? '';
  bool hasCategoriaEvento() => _categoriaEvento != null;

  // "hashtagsList" field.
  List<String>? _hashtagsList;
  List<String> get hashtagsList => _hashtagsList ?? const [];
  bool hasHashtagsList() => _hashtagsList != null;

  // "ingressoGratisDescrizione" field.
  String? _ingressoGratisDescrizione;
  String get ingressoGratisDescrizione => _ingressoGratisDescrizione ?? '';
  bool hasIngressoGratisDescrizione() => _ingressoGratisDescrizione != null;

  // "lista" field.
  bool? _lista;
  bool get lista => _lista ?? false;
  bool hasLista() => _lista != null;

  // "views" field.
  int? _views;
  int get views => _views ?? 0;
  bool hasViews() => _views != null;

  // "shared" field.
  int? _shared;
  int get shared => _shared ?? 0;
  bool hasShared() => _shared != null;

  // "mapViews" field.
  int? _mapViews;
  int get mapViews => _mapViews ?? 0;
  bool hasMapViews() => _mapViews != null;

  // "organizzatoreName" field.
  String? _organizzatoreName;
  String get organizzatoreName => _organizzatoreName ?? '';
  bool hasOrganizzatoreName() => _organizzatoreName != null;

  // "organizzatoreImg" field.
  String? _organizzatoreImg;
  String get organizzatoreImg => _organizzatoreImg ?? '';
  bool hasOrganizzatoreImg() => _organizzatoreImg != null;

  // "organizzatore" field.
  bool? _organizzatore;
  bool get organizzatore => _organizzatore ?? false;
  bool hasOrganizzatore() => _organizzatore != null;

  // "locationDiversa" field.
  bool? _locationDiversa;
  bool get locationDiversa => _locationDiversa ?? false;
  bool hasLocationDiversa() => _locationDiversa != null;

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
    _hashtags = snapshotData['Hashtags'] as String?;
    _descrizione = snapshotData['Descrizione'] as String?;
    _locale = snapshotData['Locale'] as String?;
    _imgLocale = snapshotData['imgLocale'] as String?;
    _localita = snapshotData['Localita'] as String?;
    _data = snapshotData['Data'] as DateTime?;
    _indirizzo = snapshotData['Indirizzo'] as LatLng?;
    _urlMaps = snapshotData['urlMaps'] as String?;
    _ingresso1nome = snapshotData['Ingresso1nome'] as String?;
    _ingresso1Info = snapshotData['Ingresso1Info'] as String?;
    _ingresso1Costo = snapshotData['ingresso1Costo'] as String?;
    _ingresso2nome = snapshotData['ingresso2nome'] as String?;
    _ingresso2Info = snapshotData['ingresso2Info'] as String?;
    _ingresso2Costo = snapshotData['ingresso2Costo'] as String?;
    _ingresso3Nome = snapshotData['ingresso3Nome'] as String?;
    _ingresso3Info = snapshotData['ingresso3Info'] as String?;
    _ingresso3Costo = snapshotData['ingresso3Costo'] as String?;
    _biglietti = snapshotData['Biglietti'] as bool?;
    _bigliettiUrl = snapshotData['bigliettiUrl'] as String?;
    _verificato = snapshotData['verificato'] as bool?;
    _telefonoWa = snapshotData['telefonoWa'] as String?;
    _contatto = snapshotData['contatto'] as bool?;
    _inizioOrario = snapshotData['inizioOrario'] as DateTime?;
    _fineOrario = snapshotData['fineOrario'] as DateTime?;
    _eventoRicorrente = snapshotData['eventoRicorrente'] as bool?;
    _gratis = snapshotData['gratis'] as bool?;
    _tipo = getDataList(snapshotData['tipo']);
    _addressText = snapshotData['addressText'] as String?;
    _categoriaEvento = snapshotData['categoriaEvento'] as String?;
    _hashtagsList = getDataList(snapshotData['hashtagsList']);
    _ingressoGratisDescrizione =
        snapshotData['ingressoGratisDescrizione'] as String?;
    _lista = snapshotData['lista'] as bool?;
    _views = castToType<int>(snapshotData['views']);
    _shared = castToType<int>(snapshotData['shared']);
    _mapViews = castToType<int>(snapshotData['mapViews']);
    _organizzatoreName = snapshotData['organizzatoreName'] as String?;
    _organizzatoreImg = snapshotData['organizzatoreImg'] as String?;
    _organizzatore = snapshotData['organizzatore'] as bool?;
    _locationDiversa = snapshotData['locationDiversa'] as bool?;
    _createdBy = snapshotData['createdBy'] as String?;
    _appName = snapshotData['app_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Eventi');

  static Stream<EventiRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventiRecord.fromSnapshot(s));

  static Future<EventiRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventiRecord.fromSnapshot(s));

  static EventiRecord fromSnapshot(DocumentSnapshot snapshot) => EventiRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventiRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventiRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventiRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventiRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventiRecordData({
  String? titolo,
  String? locandina,
  String? hashtags,
  String? descrizione,
  String? locale,
  String? imgLocale,
  String? localita,
  DateTime? data,
  LatLng? indirizzo,
  String? urlMaps,
  String? ingresso1nome,
  String? ingresso1Info,
  String? ingresso1Costo,
  String? ingresso2nome,
  String? ingresso2Info,
  String? ingresso2Costo,
  String? ingresso3Nome,
  String? ingresso3Info,
  String? ingresso3Costo,
  bool? biglietti,
  String? bigliettiUrl,
  bool? verificato,
  String? telefonoWa,
  bool? contatto,
  DateTime? inizioOrario,
  DateTime? fineOrario,
  bool? eventoRicorrente,
  bool? gratis,
  String? addressText,
  String? categoriaEvento,
  String? ingressoGratisDescrizione,
  bool? lista,
  int? views,
  int? shared,
  int? mapViews,
  String? organizzatoreName,
  String? organizzatoreImg,
  bool? organizzatore,
  bool? locationDiversa,
  String? createdBy,
  String? appName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Titolo': titolo,
      'Locandina': locandina,
      'Hashtags': hashtags,
      'Descrizione': descrizione,
      'Locale': locale,
      'imgLocale': imgLocale,
      'Localita': localita,
      'Data': data,
      'Indirizzo': indirizzo,
      'urlMaps': urlMaps,
      'Ingresso1nome': ingresso1nome,
      'Ingresso1Info': ingresso1Info,
      'ingresso1Costo': ingresso1Costo,
      'ingresso2nome': ingresso2nome,
      'ingresso2Info': ingresso2Info,
      'ingresso2Costo': ingresso2Costo,
      'ingresso3Nome': ingresso3Nome,
      'ingresso3Info': ingresso3Info,
      'ingresso3Costo': ingresso3Costo,
      'Biglietti': biglietti,
      'bigliettiUrl': bigliettiUrl,
      'verificato': verificato,
      'telefonoWa': telefonoWa,
      'contatto': contatto,
      'inizioOrario': inizioOrario,
      'fineOrario': fineOrario,
      'eventoRicorrente': eventoRicorrente,
      'gratis': gratis,
      'addressText': addressText,
      'categoriaEvento': categoriaEvento,
      'ingressoGratisDescrizione': ingressoGratisDescrizione,
      'lista': lista,
      'views': views,
      'shared': shared,
      'mapViews': mapViews,
      'organizzatoreName': organizzatoreName,
      'organizzatoreImg': organizzatoreImg,
      'organizzatore': organizzatore,
      'locationDiversa': locationDiversa,
      'createdBy': createdBy,
      'app_name': appName,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventiRecordDocumentEquality implements Equality<EventiRecord> {
  const EventiRecordDocumentEquality();

  @override
  bool equals(EventiRecord? e1, EventiRecord? e2) {
    const listEquality = ListEquality();
    return e1?.titolo == e2?.titolo &&
        e1?.locandina == e2?.locandina &&
        e1?.hashtags == e2?.hashtags &&
        e1?.descrizione == e2?.descrizione &&
        e1?.locale == e2?.locale &&
        e1?.imgLocale == e2?.imgLocale &&
        e1?.localita == e2?.localita &&
        e1?.data == e2?.data &&
        e1?.indirizzo == e2?.indirizzo &&
        e1?.urlMaps == e2?.urlMaps &&
        e1?.ingresso1nome == e2?.ingresso1nome &&
        e1?.ingresso1Info == e2?.ingresso1Info &&
        e1?.ingresso1Costo == e2?.ingresso1Costo &&
        e1?.ingresso2nome == e2?.ingresso2nome &&
        e1?.ingresso2Info == e2?.ingresso2Info &&
        e1?.ingresso2Costo == e2?.ingresso2Costo &&
        e1?.ingresso3Nome == e2?.ingresso3Nome &&
        e1?.ingresso3Info == e2?.ingresso3Info &&
        e1?.ingresso3Costo == e2?.ingresso3Costo &&
        e1?.biglietti == e2?.biglietti &&
        e1?.bigliettiUrl == e2?.bigliettiUrl &&
        e1?.verificato == e2?.verificato &&
        e1?.telefonoWa == e2?.telefonoWa &&
        e1?.contatto == e2?.contatto &&
        e1?.inizioOrario == e2?.inizioOrario &&
        e1?.fineOrario == e2?.fineOrario &&
        e1?.eventoRicorrente == e2?.eventoRicorrente &&
        e1?.gratis == e2?.gratis &&
        listEquality.equals(e1?.tipo, e2?.tipo) &&
        e1?.addressText == e2?.addressText &&
        e1?.categoriaEvento == e2?.categoriaEvento &&
        listEquality.equals(e1?.hashtagsList, e2?.hashtagsList) &&
        e1?.ingressoGratisDescrizione == e2?.ingressoGratisDescrizione &&
        e1?.lista == e2?.lista &&
        e1?.views == e2?.views &&
        e1?.shared == e2?.shared &&
        e1?.mapViews == e2?.mapViews &&
        e1?.organizzatoreName == e2?.organizzatoreName &&
        e1?.organizzatoreImg == e2?.organizzatoreImg &&
        e1?.organizzatore == e2?.organizzatore &&
        e1?.locationDiversa == e2?.locationDiversa &&
        e1?.createdBy == e2?.createdBy &&
        e1?.appName == e2?.appName;
  }

  @override
  int hash(EventiRecord? e) => const ListEquality().hash([
        e?.titolo,
        e?.locandina,
        e?.hashtags,
        e?.descrizione,
        e?.locale,
        e?.imgLocale,
        e?.localita,
        e?.data,
        e?.indirizzo,
        e?.urlMaps,
        e?.ingresso1nome,
        e?.ingresso1Info,
        e?.ingresso1Costo,
        e?.ingresso2nome,
        e?.ingresso2Info,
        e?.ingresso2Costo,
        e?.ingresso3Nome,
        e?.ingresso3Info,
        e?.ingresso3Costo,
        e?.biglietti,
        e?.bigliettiUrl,
        e?.verificato,
        e?.telefonoWa,
        e?.contatto,
        e?.inizioOrario,
        e?.fineOrario,
        e?.eventoRicorrente,
        e?.gratis,
        e?.tipo,
        e?.addressText,
        e?.categoriaEvento,
        e?.hashtagsList,
        e?.ingressoGratisDescrizione,
        e?.lista,
        e?.views,
        e?.shared,
        e?.mapViews,
        e?.organizzatoreName,
        e?.organizzatoreImg,
        e?.organizzatore,
        e?.locationDiversa,
        e?.createdBy,
        e?.appName
      ]);

  @override
  bool isValidKey(Object? o) => o is EventiRecord;
}
