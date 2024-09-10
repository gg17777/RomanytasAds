import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SerateRecord extends FirestoreRecord {
  SerateRecord._(
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

  // "Dresscode" field.
  String? _dresscode;
  String get dresscode => _dresscode ?? '';
  bool hasDresscode() => _dresscode != null;

  // "Eta" field.
  String? _eta;
  String get eta => _eta ?? '';
  bool hasEta() => _eta != null;

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

  // "Lista" field.
  bool? _lista;
  bool get lista => _lista ?? false;
  bool hasLista() => _lista != null;

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

  // "ingresso1Drink" field.
  bool? _ingresso1Drink;
  bool get ingresso1Drink => _ingresso1Drink ?? false;
  bool hasIngresso1Drink() => _ingresso1Drink != null;

  // "ingresso2Drink" field.
  bool? _ingresso2Drink;
  bool get ingresso2Drink => _ingresso2Drink ?? false;
  bool hasIngresso2Drink() => _ingresso2Drink != null;

  // "ingresso3Drink" field.
  bool? _ingresso3Drink;
  bool get ingresso3Drink => _ingresso3Drink ?? false;
  bool hasIngresso3Drink() => _ingresso3Drink != null;

  // "biglietti" field.
  bool? _biglietti;
  bool get biglietti => _biglietti ?? false;
  bool hasBiglietti() => _biglietti != null;

  // "serateMngRef" field.
  DocumentReference? _serateMngRef;
  DocumentReference? get serateMngRef => _serateMngRef;
  bool hasSerateMngRef() => _serateMngRef != null;

  // "urlBiglietti" field.
  String? _urlBiglietti;
  String get urlBiglietti => _urlBiglietti ?? '';
  bool hasUrlBiglietti() => _urlBiglietti != null;

  // "verificato" field.
  bool? _verificato;
  bool get verificato => _verificato ?? false;
  bool hasVerificato() => _verificato != null;

  // "eventoManagerRef" field.
  DocumentReference? _eventoManagerRef;
  DocumentReference? get eventoManagerRef => _eventoManagerRef;
  bool hasEventoManagerRef() => _eventoManagerRef != null;

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

  // "tipo" field.
  List<String>? _tipo;
  List<String> get tipo => _tipo ?? const [];
  bool hasTipo() => _tipo != null;

  // "addressText" field.
  String? _addressText;
  String get addressText => _addressText ?? '';
  bool hasAddressText() => _addressText != null;

  // "tipoMusica" field.
  List<String>? _tipoMusica;
  List<String> get tipoMusica => _tipoMusica ?? const [];
  bool hasTipoMusica() => _tipoMusica != null;

  // "gratis" field.
  bool? _gratis;
  bool get gratis => _gratis ?? false;
  bool hasGratis() => _gratis != null;

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
    _hashtags = snapshotData['Hashtags'] as String?;
    _dresscode = snapshotData['Dresscode'] as String?;
    _eta = snapshotData['Eta'] as String?;
    _descrizione = snapshotData['Descrizione'] as String?;
    _locale = snapshotData['Locale'] as String?;
    _imgLocale = snapshotData['imgLocale'] as String?;
    _localita = snapshotData['Localita'] as String?;
    _data = snapshotData['Data'] as DateTime?;
    _indirizzo = snapshotData['Indirizzo'] as LatLng?;
    _urlMaps = snapshotData['urlMaps'] as String?;
    _lista = snapshotData['Lista'] as bool?;
    _ingresso1nome = snapshotData['Ingresso1nome'] as String?;
    _ingresso1Info = snapshotData['Ingresso1Info'] as String?;
    _ingresso1Costo = snapshotData['ingresso1Costo'] as String?;
    _ingresso2nome = snapshotData['ingresso2nome'] as String?;
    _ingresso2Info = snapshotData['ingresso2Info'] as String?;
    _ingresso2Costo = snapshotData['ingresso2Costo'] as String?;
    _ingresso3Nome = snapshotData['ingresso3Nome'] as String?;
    _ingresso3Info = snapshotData['ingresso3Info'] as String?;
    _ingresso3Costo = snapshotData['ingresso3Costo'] as String?;
    _ingresso1Drink = snapshotData['ingresso1Drink'] as bool?;
    _ingresso2Drink = snapshotData['ingresso2Drink'] as bool?;
    _ingresso3Drink = snapshotData['ingresso3Drink'] as bool?;
    _biglietti = snapshotData['biglietti'] as bool?;
    _serateMngRef = snapshotData['serateMngRef'] as DocumentReference?;
    _urlBiglietti = snapshotData['urlBiglietti'] as String?;
    _verificato = snapshotData['verificato'] as bool?;
    _eventoManagerRef = snapshotData['eventoManagerRef'] as DocumentReference?;
    _telefonoWa = snapshotData['telefonoWa'] as String?;
    _contatto = snapshotData['contatto'] as bool?;
    _inizioOrario = snapshotData['inizioOrario'] as DateTime?;
    _fineOrario = snapshotData['fineOrario'] as DateTime?;
    _eventoRicorrente = snapshotData['eventoRicorrente'] as bool?;
    _tipo = getDataList(snapshotData['tipo']);
    _addressText = snapshotData['addressText'] as String?;
    _tipoMusica = getDataList(snapshotData['tipoMusica']);
    _gratis = snapshotData['gratis'] as bool?;
    _views = castToType<int>(snapshotData['views']);
    _shared = castToType<int>(snapshotData['shared']);
    _mapViews = castToType<int>(snapshotData['mapViews']);
    _organizzatoreName = snapshotData['organizzatoreName'] as String?;
    _organizzatoreImg = snapshotData['organizzatoreImg'] as String?;
    _organizzatore = snapshotData['organizzatore'] as bool?;
    _appName = snapshotData['app_name'] as String?;
    _createdBy = snapshotData['createdBy'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Serate');

  static Stream<SerateRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SerateRecord.fromSnapshot(s));

  static Future<SerateRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SerateRecord.fromSnapshot(s));

  static SerateRecord fromSnapshot(DocumentSnapshot snapshot) => SerateRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SerateRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SerateRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SerateRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SerateRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSerateRecordData({
  String? titolo,
  String? locandina,
  String? hashtags,
  String? dresscode,
  String? eta,
  String? descrizione,
  String? locale,
  String? imgLocale,
  String? localita,
  DateTime? data,
  LatLng? indirizzo,
  String? urlMaps,
  bool? lista,
  String? ingresso1nome,
  String? ingresso1Info,
  String? ingresso1Costo,
  String? ingresso2nome,
  String? ingresso2Info,
  String? ingresso2Costo,
  String? ingresso3Nome,
  String? ingresso3Info,
  String? ingresso3Costo,
  bool? ingresso1Drink,
  bool? ingresso2Drink,
  bool? ingresso3Drink,
  bool? biglietti,
  DocumentReference? serateMngRef,
  String? urlBiglietti,
  bool? verificato,
  DocumentReference? eventoManagerRef,
  String? telefonoWa,
  bool? contatto,
  DateTime? inizioOrario,
  DateTime? fineOrario,
  bool? eventoRicorrente,
  String? addressText,
  bool? gratis,
  int? views,
  int? shared,
  int? mapViews,
  String? organizzatoreName,
  String? organizzatoreImg,
  bool? organizzatore,
  String? appName,
  String? createdBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Titolo': titolo,
      'Locandina': locandina,
      'Hashtags': hashtags,
      'Dresscode': dresscode,
      'Eta': eta,
      'Descrizione': descrizione,
      'Locale': locale,
      'imgLocale': imgLocale,
      'Localita': localita,
      'Data': data,
      'Indirizzo': indirizzo,
      'urlMaps': urlMaps,
      'Lista': lista,
      'Ingresso1nome': ingresso1nome,
      'Ingresso1Info': ingresso1Info,
      'ingresso1Costo': ingresso1Costo,
      'ingresso2nome': ingresso2nome,
      'ingresso2Info': ingresso2Info,
      'ingresso2Costo': ingresso2Costo,
      'ingresso3Nome': ingresso3Nome,
      'ingresso3Info': ingresso3Info,
      'ingresso3Costo': ingresso3Costo,
      'ingresso1Drink': ingresso1Drink,
      'ingresso2Drink': ingresso2Drink,
      'ingresso3Drink': ingresso3Drink,
      'biglietti': biglietti,
      'serateMngRef': serateMngRef,
      'urlBiglietti': urlBiglietti,
      'verificato': verificato,
      'eventoManagerRef': eventoManagerRef,
      'telefonoWa': telefonoWa,
      'contatto': contatto,
      'inizioOrario': inizioOrario,
      'fineOrario': fineOrario,
      'eventoRicorrente': eventoRicorrente,
      'addressText': addressText,
      'gratis': gratis,
      'views': views,
      'shared': shared,
      'mapViews': mapViews,
      'organizzatoreName': organizzatoreName,
      'organizzatoreImg': organizzatoreImg,
      'organizzatore': organizzatore,
      'app_name': appName,
      'createdBy': createdBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class SerateRecordDocumentEquality implements Equality<SerateRecord> {
  const SerateRecordDocumentEquality();

  @override
  bool equals(SerateRecord? e1, SerateRecord? e2) {
    const listEquality = ListEquality();
    return e1?.titolo == e2?.titolo &&
        e1?.locandina == e2?.locandina &&
        e1?.hashtags == e2?.hashtags &&
        e1?.dresscode == e2?.dresscode &&
        e1?.eta == e2?.eta &&
        e1?.descrizione == e2?.descrizione &&
        e1?.locale == e2?.locale &&
        e1?.imgLocale == e2?.imgLocale &&
        e1?.localita == e2?.localita &&
        e1?.data == e2?.data &&
        e1?.indirizzo == e2?.indirizzo &&
        e1?.urlMaps == e2?.urlMaps &&
        e1?.lista == e2?.lista &&
        e1?.ingresso1nome == e2?.ingresso1nome &&
        e1?.ingresso1Info == e2?.ingresso1Info &&
        e1?.ingresso1Costo == e2?.ingresso1Costo &&
        e1?.ingresso2nome == e2?.ingresso2nome &&
        e1?.ingresso2Info == e2?.ingresso2Info &&
        e1?.ingresso2Costo == e2?.ingresso2Costo &&
        e1?.ingresso3Nome == e2?.ingresso3Nome &&
        e1?.ingresso3Info == e2?.ingresso3Info &&
        e1?.ingresso3Costo == e2?.ingresso3Costo &&
        e1?.ingresso1Drink == e2?.ingresso1Drink &&
        e1?.ingresso2Drink == e2?.ingresso2Drink &&
        e1?.ingresso3Drink == e2?.ingresso3Drink &&
        e1?.biglietti == e2?.biglietti &&
        e1?.serateMngRef == e2?.serateMngRef &&
        e1?.urlBiglietti == e2?.urlBiglietti &&
        e1?.verificato == e2?.verificato &&
        e1?.eventoManagerRef == e2?.eventoManagerRef &&
        e1?.telefonoWa == e2?.telefonoWa &&
        e1?.contatto == e2?.contatto &&
        e1?.inizioOrario == e2?.inizioOrario &&
        e1?.fineOrario == e2?.fineOrario &&
        e1?.eventoRicorrente == e2?.eventoRicorrente &&
        listEquality.equals(e1?.tipo, e2?.tipo) &&
        e1?.addressText == e2?.addressText &&
        listEquality.equals(e1?.tipoMusica, e2?.tipoMusica) &&
        e1?.gratis == e2?.gratis &&
        e1?.views == e2?.views &&
        e1?.shared == e2?.shared &&
        e1?.mapViews == e2?.mapViews &&
        e1?.organizzatoreName == e2?.organizzatoreName &&
        e1?.organizzatoreImg == e2?.organizzatoreImg &&
        e1?.organizzatore == e2?.organizzatore &&
        e1?.appName == e2?.appName &&
        e1?.createdBy == e2?.createdBy;
  }

  @override
  int hash(SerateRecord? e) => const ListEquality().hash([
        e?.titolo,
        e?.locandina,
        e?.hashtags,
        e?.dresscode,
        e?.eta,
        e?.descrizione,
        e?.locale,
        e?.imgLocale,
        e?.localita,
        e?.data,
        e?.indirizzo,
        e?.urlMaps,
        e?.lista,
        e?.ingresso1nome,
        e?.ingresso1Info,
        e?.ingresso1Costo,
        e?.ingresso2nome,
        e?.ingresso2Info,
        e?.ingresso2Costo,
        e?.ingresso3Nome,
        e?.ingresso3Info,
        e?.ingresso3Costo,
        e?.ingresso1Drink,
        e?.ingresso2Drink,
        e?.ingresso3Drink,
        e?.biglietti,
        e?.serateMngRef,
        e?.urlBiglietti,
        e?.verificato,
        e?.eventoManagerRef,
        e?.telefonoWa,
        e?.contatto,
        e?.inizioOrario,
        e?.fineOrario,
        e?.eventoRicorrente,
        e?.tipo,
        e?.addressText,
        e?.tipoMusica,
        e?.gratis,
        e?.views,
        e?.shared,
        e?.mapViews,
        e?.organizzatoreName,
        e?.organizzatoreImg,
        e?.organizzatore,
        e?.appName,
        e?.createdBy
      ]);

  @override
  bool isValidKey(Object? o) => o is SerateRecord;
}
