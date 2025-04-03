import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventiRecord extends FirestoreRecord {
  EventiRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
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

  // "eventoAnnullato" field.
  bool? _eventoAnnullato;
  bool get eventoAnnullato => _eventoAnnullato ?? false;
  bool hasEventoAnnullato() => _eventoAnnullato != null;

  // "meetUpLocation" field.
  bool? _meetUpLocation;
  bool get meetUpLocation => _meetUpLocation ?? false;
  bool hasMeetUpLocation() => _meetUpLocation != null;

  // "marker" field.
  String? _marker;
  String get marker => _marker ?? '';
  bool hasMarker() => _marker != null;

  // "video" field.
  bool? _video;
  bool get video => _video ?? false;
  bool hasVideo() => _video != null;

  // "videoPath" field.
  String? _videoPath;
  String get videoPath => _videoPath ?? '';
  bool hasVideoPath() => _videoPath != null;

  // "blinkEvent" field.
  bool? _blinkEvent;
  bool get blinkEvent => _blinkEvent ?? false;
  bool hasBlinkEvent() => _blinkEvent != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "survey" field.
  bool? _survey;
  bool get survey => _survey ?? false;
  bool hasSurvey() => _survey != null;

  // "survey_title" field.
  String? _surveyTitle;
  String get surveyTitle => _surveyTitle ?? '';
  bool hasSurveyTitle() => _surveyTitle != null;

  // "survey_hook" field.
  String? _surveyHook;
  String get surveyHook => _surveyHook ?? '';
  bool hasSurveyHook() => _surveyHook != null;

  // "function_photo_AI" field.
  bool? _functionPhotoAI;
  bool get functionPhotoAI => _functionPhotoAI ?? false;
  bool hasFunctionPhotoAI() => _functionPhotoAI != null;

  // "event_type" field.
  String? _eventType;
  String get eventType => _eventType ?? '';
  bool hasEventType() => _eventType != null;

  // "dresscode" field.
  String? _dresscode;
  String get dresscode => _dresscode ?? '';
  bool hasDresscode() => _dresscode != null;

  // "age" field.
  String? _age;
  String get age => _age ?? '';
  bool hasAge() => _age != null;

  // "music_type" field.
  List<String>? _musicType;
  List<String> get musicType => _musicType ?? const [];
  bool hasMusicType() => _musicType != null;

  // "ingresso1drink" field.
  bool? _ingresso1drink;
  bool get ingresso1drink => _ingresso1drink ?? false;
  bool hasIngresso1drink() => _ingresso1drink != null;

  // "ingresso2drink" field.
  bool? _ingresso2drink;
  bool get ingresso2drink => _ingresso2drink ?? false;
  bool hasIngresso2drink() => _ingresso2drink != null;

  // "ingresso3drink" field.
  bool? _ingresso3drink;
  bool get ingresso3drink => _ingresso3drink ?? false;
  bool hasIngresso3drink() => _ingresso3drink != null;

  // "tables_function" field.
  bool? _tablesFunction;
  bool get tablesFunction => _tablesFunction ?? false;
  bool hasTablesFunction() => _tablesFunction != null;

  // "table1_title" field.
  String? _table1Title;
  String get table1Title => _table1Title ?? '';
  bool hasTable1Title() => _table1Title != null;

  // "table1_description" field.
  String? _table1Description;
  String get table1Description => _table1Description ?? '';
  bool hasTable1Description() => _table1Description != null;

  // "table1_price" field.
  String? _table1Price;
  String get table1Price => _table1Price ?? '';
  bool hasTable1Price() => _table1Price != null;

  // "table2_title" field.
  String? _table2Title;
  String get table2Title => _table2Title ?? '';
  bool hasTable2Title() => _table2Title != null;

  // "table2_description" field.
  String? _table2Description;
  String get table2Description => _table2Description ?? '';
  bool hasTable2Description() => _table2Description != null;

  // "table2_price" field.
  String? _table2Price;
  String get table2Price => _table2Price ?? '';
  bool hasTable2Price() => _table2Price != null;

  // "table3_title" field.
  String? _table3Title;
  String get table3Title => _table3Title ?? '';
  bool hasTable3Title() => _table3Title != null;

  // "table3_description" field.
  String? _table3Description;
  String get table3Description => _table3Description ?? '';
  bool hasTable3Description() => _table3Description != null;

  // "table3_price" field.
  String? _table3Price;
  String get table3Price => _table3Price ?? '';
  bool hasTable3Price() => _table3Price != null;

  // "withDrink" field.
  bool? _withDrink;
  bool get withDrink => _withDrink ?? false;
  bool hasWithDrink() => _withDrink != null;

  // "open" field.
  bool? _open;
  bool get open => _open ?? false;
  bool hasOpen() => _open != null;

  // "eventoManagerRef" field.
  DocumentReference? _eventoManagerRef;
  DocumentReference? get eventoManagerRef => _eventoManagerRef;
  bool hasEventoManagerRef() => _eventoManagerRef != null;

  // "saltafila_category1_name" field.
  String? _saltafilaCategory1Name;
  String get saltafilaCategory1Name => _saltafilaCategory1Name ?? '';
  bool hasSaltafilaCategory1Name() => _saltafilaCategory1Name != null;

  // "saltafila_category1_item1_name" field.
  String? _saltafilaCategory1Item1Name;
  String get saltafilaCategory1Item1Name => _saltafilaCategory1Item1Name ?? '';
  bool hasSaltafilaCategory1Item1Name() => _saltafilaCategory1Item1Name != null;

  // "saltafila_category1_item1_price" field.
  double? _saltafilaCategory1Item1Price;
  double get saltafilaCategory1Item1Price =>
      _saltafilaCategory1Item1Price ?? 0.0;
  bool hasSaltafilaCategory1Item1Price() =>
      _saltafilaCategory1Item1Price != null;

  // "saltafila_category1_item2_name" field.
  String? _saltafilaCategory1Item2Name;
  String get saltafilaCategory1Item2Name => _saltafilaCategory1Item2Name ?? '';
  bool hasSaltafilaCategory1Item2Name() => _saltafilaCategory1Item2Name != null;

  // "saltafila_category1_item2_price" field.
  double? _saltafilaCategory1Item2Price;
  double get saltafilaCategory1Item2Price =>
      _saltafilaCategory1Item2Price ?? 0.0;
  bool hasSaltafilaCategory1Item2Price() =>
      _saltafilaCategory1Item2Price != null;

  // "saltafila_category1_item3_name" field.
  String? _saltafilaCategory1Item3Name;
  String get saltafilaCategory1Item3Name => _saltafilaCategory1Item3Name ?? '';
  bool hasSaltafilaCategory1Item3Name() => _saltafilaCategory1Item3Name != null;

  // "saltafila_category1_item3_price" field.
  double? _saltafilaCategory1Item3Price;
  double get saltafilaCategory1Item3Price =>
      _saltafilaCategory1Item3Price ?? 0.0;
  bool hasSaltafilaCategory1Item3Price() =>
      _saltafilaCategory1Item3Price != null;

  // "saltafila_category1_item4_name" field.
  String? _saltafilaCategory1Item4Name;
  String get saltafilaCategory1Item4Name => _saltafilaCategory1Item4Name ?? '';
  bool hasSaltafilaCategory1Item4Name() => _saltafilaCategory1Item4Name != null;

  // "saltafila_category1_item4_price" field.
  double? _saltafilaCategory1Item4Price;
  double get saltafilaCategory1Item4Price =>
      _saltafilaCategory1Item4Price ?? 0.0;
  bool hasSaltafilaCategory1Item4Price() =>
      _saltafilaCategory1Item4Price != null;

  // "saltafila_category1_item5_name" field.
  String? _saltafilaCategory1Item5Name;
  String get saltafilaCategory1Item5Name => _saltafilaCategory1Item5Name ?? '';
  bool hasSaltafilaCategory1Item5Name() => _saltafilaCategory1Item5Name != null;

  // "saltafila_category1_item5_price" field.
  double? _saltafilaCategory1Item5Price;
  double get saltafilaCategory1Item5Price =>
      _saltafilaCategory1Item5Price ?? 0.0;
  bool hasSaltafilaCategory1Item5Price() =>
      _saltafilaCategory1Item5Price != null;

  // "saltafila_category1_item6_name" field.
  String? _saltafilaCategory1Item6Name;
  String get saltafilaCategory1Item6Name => _saltafilaCategory1Item6Name ?? '';
  bool hasSaltafilaCategory1Item6Name() => _saltafilaCategory1Item6Name != null;

  // "saltafila_category1_item6_price" field.
  double? _saltafilaCategory1Item6Price;
  double get saltafilaCategory1Item6Price =>
      _saltafilaCategory1Item6Price ?? 0.0;
  bool hasSaltafilaCategory1Item6Price() =>
      _saltafilaCategory1Item6Price != null;

  // "saltafila_category1_item7_name" field.
  String? _saltafilaCategory1Item7Name;
  String get saltafilaCategory1Item7Name => _saltafilaCategory1Item7Name ?? '';
  bool hasSaltafilaCategory1Item7Name() => _saltafilaCategory1Item7Name != null;

  // "saltafila_category1_item7_price" field.
  double? _saltafilaCategory1Item7Price;
  double get saltafilaCategory1Item7Price =>
      _saltafilaCategory1Item7Price ?? 0.0;
  bool hasSaltafilaCategory1Item7Price() =>
      _saltafilaCategory1Item7Price != null;

  // "saltafila_category1_item8_name" field.
  String? _saltafilaCategory1Item8Name;
  String get saltafilaCategory1Item8Name => _saltafilaCategory1Item8Name ?? '';
  bool hasSaltafilaCategory1Item8Name() => _saltafilaCategory1Item8Name != null;

  // "saltafila_category1_item8_price" field.
  double? _saltafilaCategory1Item8Price;
  double get saltafilaCategory1Item8Price =>
      _saltafilaCategory1Item8Price ?? 0.0;
  bool hasSaltafilaCategory1Item8Price() =>
      _saltafilaCategory1Item8Price != null;

  // "saltafila_category1_item9_name" field.
  String? _saltafilaCategory1Item9Name;
  String get saltafilaCategory1Item9Name => _saltafilaCategory1Item9Name ?? '';
  bool hasSaltafilaCategory1Item9Name() => _saltafilaCategory1Item9Name != null;

  // "saltafila_category1_item9_price" field.
  double? _saltafilaCategory1Item9Price;
  double get saltafilaCategory1Item9Price =>
      _saltafilaCategory1Item9Price ?? 0.0;
  bool hasSaltafilaCategory1Item9Price() =>
      _saltafilaCategory1Item9Price != null;

  // "saltafila_category1_item10_name" field.
  String? _saltafilaCategory1Item10Name;
  String get saltafilaCategory1Item10Name =>
      _saltafilaCategory1Item10Name ?? '';
  bool hasSaltafilaCategory1Item10Name() =>
      _saltafilaCategory1Item10Name != null;

  // "saltafila_category1_item10_price" field.
  double? _saltafilaCategory1Item10Price;
  double get saltafilaCategory1Item10Price =>
      _saltafilaCategory1Item10Price ?? 0.0;
  bool hasSaltafilaCategory1Item10Price() =>
      _saltafilaCategory1Item10Price != null;

  // "saltafila_category2_name" field.
  String? _saltafilaCategory2Name;
  String get saltafilaCategory2Name => _saltafilaCategory2Name ?? '';
  bool hasSaltafilaCategory2Name() => _saltafilaCategory2Name != null;

  // "saltafila_category2_item1_name" field.
  String? _saltafilaCategory2Item1Name;
  String get saltafilaCategory2Item1Name => _saltafilaCategory2Item1Name ?? '';
  bool hasSaltafilaCategory2Item1Name() => _saltafilaCategory2Item1Name != null;

  // "saltafila_category2_item1_price" field.
  double? _saltafilaCategory2Item1Price;
  double get saltafilaCategory2Item1Price =>
      _saltafilaCategory2Item1Price ?? 0.0;
  bool hasSaltafilaCategory2Item1Price() =>
      _saltafilaCategory2Item1Price != null;

  // "saltafila_category2_item2_name" field.
  String? _saltafilaCategory2Item2Name;
  String get saltafilaCategory2Item2Name => _saltafilaCategory2Item2Name ?? '';
  bool hasSaltafilaCategory2Item2Name() => _saltafilaCategory2Item2Name != null;

  // "saltafila_category2_item2_price" field.
  double? _saltafilaCategory2Item2Price;
  double get saltafilaCategory2Item2Price =>
      _saltafilaCategory2Item2Price ?? 0.0;
  bool hasSaltafilaCategory2Item2Price() =>
      _saltafilaCategory2Item2Price != null;

  // "saltafila_category2_item3_name" field.
  String? _saltafilaCategory2Item3Name;
  String get saltafilaCategory2Item3Name => _saltafilaCategory2Item3Name ?? '';
  bool hasSaltafilaCategory2Item3Name() => _saltafilaCategory2Item3Name != null;

  // "saltafila_category2_item3_price" field.
  double? _saltafilaCategory2Item3Price;
  double get saltafilaCategory2Item3Price =>
      _saltafilaCategory2Item3Price ?? 0.0;
  bool hasSaltafilaCategory2Item3Price() =>
      _saltafilaCategory2Item3Price != null;

  // "saltafila_category2_item4_name" field.
  String? _saltafilaCategory2Item4Name;
  String get saltafilaCategory2Item4Name => _saltafilaCategory2Item4Name ?? '';
  bool hasSaltafilaCategory2Item4Name() => _saltafilaCategory2Item4Name != null;

  // "saltafila_category2_item4_price" field.
  double? _saltafilaCategory2Item4Price;
  double get saltafilaCategory2Item4Price =>
      _saltafilaCategory2Item4Price ?? 0.0;
  bool hasSaltafilaCategory2Item4Price() =>
      _saltafilaCategory2Item4Price != null;

  // "saltafila_category2_item5_name" field.
  String? _saltafilaCategory2Item5Name;
  String get saltafilaCategory2Item5Name => _saltafilaCategory2Item5Name ?? '';
  bool hasSaltafilaCategory2Item5Name() => _saltafilaCategory2Item5Name != null;

  // "saltafila_category2_item5_price" field.
  double? _saltafilaCategory2Item5Price;
  double get saltafilaCategory2Item5Price =>
      _saltafilaCategory2Item5Price ?? 0.0;
  bool hasSaltafilaCategory2Item5Price() =>
      _saltafilaCategory2Item5Price != null;

  // "saltafila_category2_item6_name" field.
  String? _saltafilaCategory2Item6Name;
  String get saltafilaCategory2Item6Name => _saltafilaCategory2Item6Name ?? '';
  bool hasSaltafilaCategory2Item6Name() => _saltafilaCategory2Item6Name != null;

  // "saltafila_category2_item6_price" field.
  double? _saltafilaCategory2Item6Price;
  double get saltafilaCategory2Item6Price =>
      _saltafilaCategory2Item6Price ?? 0.0;
  bool hasSaltafilaCategory2Item6Price() =>
      _saltafilaCategory2Item6Price != null;

  // "saltafila_category2_item7_name" field.
  String? _saltafilaCategory2Item7Name;
  String get saltafilaCategory2Item7Name => _saltafilaCategory2Item7Name ?? '';
  bool hasSaltafilaCategory2Item7Name() => _saltafilaCategory2Item7Name != null;

  // "saltafila_category2_item7_price" field.
  double? _saltafilaCategory2Item7Price;
  double get saltafilaCategory2Item7Price =>
      _saltafilaCategory2Item7Price ?? 0.0;
  bool hasSaltafilaCategory2Item7Price() =>
      _saltafilaCategory2Item7Price != null;

  // "saltafila_category2_item8_name" field.
  String? _saltafilaCategory2Item8Name;
  String get saltafilaCategory2Item8Name => _saltafilaCategory2Item8Name ?? '';
  bool hasSaltafilaCategory2Item8Name() => _saltafilaCategory2Item8Name != null;

  // "saltafila_category2_item8_price" field.
  double? _saltafilaCategory2Item8Price;
  double get saltafilaCategory2Item8Price =>
      _saltafilaCategory2Item8Price ?? 0.0;
  bool hasSaltafilaCategory2Item8Price() =>
      _saltafilaCategory2Item8Price != null;

  // "saltafila_category2_item9_name" field.
  String? _saltafilaCategory2Item9Name;
  String get saltafilaCategory2Item9Name => _saltafilaCategory2Item9Name ?? '';
  bool hasSaltafilaCategory2Item9Name() => _saltafilaCategory2Item9Name != null;

  // "saltafila_category2_item9_price" field.
  double? _saltafilaCategory2Item9Price;
  double get saltafilaCategory2Item9Price =>
      _saltafilaCategory2Item9Price ?? 0.0;
  bool hasSaltafilaCategory2Item9Price() =>
      _saltafilaCategory2Item9Price != null;

  // "saltafila_category2_item10_name" field.
  String? _saltafilaCategory2Item10Name;
  String get saltafilaCategory2Item10Name =>
      _saltafilaCategory2Item10Name ?? '';
  bool hasSaltafilaCategory2Item10Name() =>
      _saltafilaCategory2Item10Name != null;

  // "saltafila_category2_item10_price" field.
  double? _saltafilaCategory2Item10Price;
  double get saltafilaCategory2Item10Price =>
      _saltafilaCategory2Item10Price ?? 0.0;
  bool hasSaltafilaCategory2Item10Price() =>
      _saltafilaCategory2Item10Price != null;

  // "saltafila_category3_name" field.
  String? _saltafilaCategory3Name;
  String get saltafilaCategory3Name => _saltafilaCategory3Name ?? '';
  bool hasSaltafilaCategory3Name() => _saltafilaCategory3Name != null;

  // "saltafila_category3_item1_name" field.
  String? _saltafilaCategory3Item1Name;
  String get saltafilaCategory3Item1Name => _saltafilaCategory3Item1Name ?? '';
  bool hasSaltafilaCategory3Item1Name() => _saltafilaCategory3Item1Name != null;

  // "saltafila_category3_item1_price" field.
  double? _saltafilaCategory3Item1Price;
  double get saltafilaCategory3Item1Price =>
      _saltafilaCategory3Item1Price ?? 0.0;
  bool hasSaltafilaCategory3Item1Price() =>
      _saltafilaCategory3Item1Price != null;

  // "saltafila_category3_item2_name" field.
  String? _saltafilaCategory3Item2Name;
  String get saltafilaCategory3Item2Name => _saltafilaCategory3Item2Name ?? '';
  bool hasSaltafilaCategory3Item2Name() => _saltafilaCategory3Item2Name != null;

  // "saltafila_category3_item2_price" field.
  double? _saltafilaCategory3Item2Price;
  double get saltafilaCategory3Item2Price =>
      _saltafilaCategory3Item2Price ?? 0.0;
  bool hasSaltafilaCategory3Item2Price() =>
      _saltafilaCategory3Item2Price != null;

  // "saltafila_category3_item3_name" field.
  String? _saltafilaCategory3Item3Name;
  String get saltafilaCategory3Item3Name => _saltafilaCategory3Item3Name ?? '';
  bool hasSaltafilaCategory3Item3Name() => _saltafilaCategory3Item3Name != null;

  // "saltafila_category3_item3_price" field.
  double? _saltafilaCategory3Item3Price;
  double get saltafilaCategory3Item3Price =>
      _saltafilaCategory3Item3Price ?? 0.0;
  bool hasSaltafilaCategory3Item3Price() =>
      _saltafilaCategory3Item3Price != null;

  // "saltafila_category3_item4_name" field.
  String? _saltafilaCategory3Item4Name;
  String get saltafilaCategory3Item4Name => _saltafilaCategory3Item4Name ?? '';
  bool hasSaltafilaCategory3Item4Name() => _saltafilaCategory3Item4Name != null;

  // "saltafila_category3_item4_price" field.
  double? _saltafilaCategory3Item4Price;
  double get saltafilaCategory3Item4Price =>
      _saltafilaCategory3Item4Price ?? 0.0;
  bool hasSaltafilaCategory3Item4Price() =>
      _saltafilaCategory3Item4Price != null;

  // "saltafila_category3_item5_name" field.
  String? _saltafilaCategory3Item5Name;
  String get saltafilaCategory3Item5Name => _saltafilaCategory3Item5Name ?? '';
  bool hasSaltafilaCategory3Item5Name() => _saltafilaCategory3Item5Name != null;

  // "saltafila_category3_item5_price" field.
  double? _saltafilaCategory3Item5Price;
  double get saltafilaCategory3Item5Price =>
      _saltafilaCategory3Item5Price ?? 0.0;
  bool hasSaltafilaCategory3Item5Price() =>
      _saltafilaCategory3Item5Price != null;

  // "saltafila_category3_item6_name" field.
  String? _saltafilaCategory3Item6Name;
  String get saltafilaCategory3Item6Name => _saltafilaCategory3Item6Name ?? '';
  bool hasSaltafilaCategory3Item6Name() => _saltafilaCategory3Item6Name != null;

  // "saltafila_category3_item6_price" field.
  double? _saltafilaCategory3Item6Price;
  double get saltafilaCategory3Item6Price =>
      _saltafilaCategory3Item6Price ?? 0.0;
  bool hasSaltafilaCategory3Item6Price() =>
      _saltafilaCategory3Item6Price != null;

  // "saltafila_category3_item7_name" field.
  String? _saltafilaCategory3Item7Name;
  String get saltafilaCategory3Item7Name => _saltafilaCategory3Item7Name ?? '';
  bool hasSaltafilaCategory3Item7Name() => _saltafilaCategory3Item7Name != null;

  // "saltafila_category3_item7_price" field.
  double? _saltafilaCategory3Item7Price;
  double get saltafilaCategory3Item7Price =>
      _saltafilaCategory3Item7Price ?? 0.0;
  bool hasSaltafilaCategory3Item7Price() =>
      _saltafilaCategory3Item7Price != null;

  // "saltafila_category3_item8_name" field.
  String? _saltafilaCategory3Item8Name;
  String get saltafilaCategory3Item8Name => _saltafilaCategory3Item8Name ?? '';
  bool hasSaltafilaCategory3Item8Name() => _saltafilaCategory3Item8Name != null;

  // "saltafila_category3_item8_price" field.
  double? _saltafilaCategory3Item8Price;
  double get saltafilaCategory3Item8Price =>
      _saltafilaCategory3Item8Price ?? 0.0;
  bool hasSaltafilaCategory3Item8Price() =>
      _saltafilaCategory3Item8Price != null;

  // "saltafila_category3_item9_name" field.
  String? _saltafilaCategory3Item9Name;
  String get saltafilaCategory3Item9Name => _saltafilaCategory3Item9Name ?? '';
  bool hasSaltafilaCategory3Item9Name() => _saltafilaCategory3Item9Name != null;

  // "saltafila_category3_item9_price" field.
  double? _saltafilaCategory3Item9Price;
  double get saltafilaCategory3Item9Price =>
      _saltafilaCategory3Item9Price ?? 0.0;
  bool hasSaltafilaCategory3Item9Price() =>
      _saltafilaCategory3Item9Price != null;

  // "saltafila_category3_item10_name" field.
  String? _saltafilaCategory3Item10Name;
  String get saltafilaCategory3Item10Name =>
      _saltafilaCategory3Item10Name ?? '';
  bool hasSaltafilaCategory3Item10Name() =>
      _saltafilaCategory3Item10Name != null;

  // "saltafila_category3_item10_price" field.
  double? _saltafilaCategory3Item10Price;
  double get saltafilaCategory3Item10Price =>
      _saltafilaCategory3Item10Price ?? 0.0;
  bool hasSaltafilaCategory3Item10Price() =>
      _saltafilaCategory3Item10Price != null;

  // "ticketing" field.
  bool? _ticketing;
  bool get ticketing => _ticketing ?? false;
  bool hasTicketing() => _ticketing != null;

  // "ticket_price" field.
  double? _ticketPrice;
  double get ticketPrice => _ticketPrice ?? 0.0;
  bool hasTicketPrice() => _ticketPrice != null;

  // "maxTickets" field.
  int? _maxTickets;
  int get maxTickets => _maxTickets ?? 0;
  bool hasMaxTickets() => _maxTickets != null;

  // "priceOnlyInLista" field.
  bool? _priceOnlyInLista;
  bool get priceOnlyInLista => _priceOnlyInLista ?? false;
  bool hasPriceOnlyInLista() => _priceOnlyInLista != null;

  // "profileVisible" field.
  bool? _profileVisible;
  bool get profileVisible => _profileVisible ?? false;
  bool hasProfileVisible() => _profileVisible != null;

  // "saltafila" field.
  bool? _saltafila;
  bool get saltafila => _saltafila ?? false;
  bool hasSaltafila() => _saltafila != null;

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
    _eventoAnnullato = snapshotData['eventoAnnullato'] as bool?;
    _meetUpLocation = snapshotData['meetUpLocation'] as bool?;
    _marker = snapshotData['marker'] as String?;
    _video = snapshotData['video'] as bool?;
    _videoPath = snapshotData['videoPath'] as String?;
    _blinkEvent = snapshotData['blinkEvent'] as bool?;
    _city = snapshotData['city'] as String?;
    _survey = snapshotData['survey'] as bool?;
    _surveyTitle = snapshotData['survey_title'] as String?;
    _surveyHook = snapshotData['survey_hook'] as String?;
    _functionPhotoAI = snapshotData['function_photo_AI'] as bool?;
    _eventType = snapshotData['event_type'] as String?;
    _dresscode = snapshotData['dresscode'] as String?;
    _age = snapshotData['age'] as String?;
    _musicType = getDataList(snapshotData['music_type']);
    _ingresso1drink = snapshotData['ingresso1drink'] as bool?;
    _ingresso2drink = snapshotData['ingresso2drink'] as bool?;
    _ingresso3drink = snapshotData['ingresso3drink'] as bool?;
    _tablesFunction = snapshotData['tables_function'] as bool?;
    _table1Title = snapshotData['table1_title'] as String?;
    _table1Description = snapshotData['table1_description'] as String?;
    _table1Price = snapshotData['table1_price'] as String?;
    _table2Title = snapshotData['table2_title'] as String?;
    _table2Description = snapshotData['table2_description'] as String?;
    _table2Price = snapshotData['table2_price'] as String?;
    _table3Title = snapshotData['table3_title'] as String?;
    _table3Description = snapshotData['table3_description'] as String?;
    _table3Price = snapshotData['table3_price'] as String?;
    _withDrink = snapshotData['withDrink'] as bool?;
    _open = snapshotData['open'] as bool?;
    _eventoManagerRef = snapshotData['eventoManagerRef'] as DocumentReference?;
    _saltafilaCategory1Name =
        snapshotData['saltafila_category1_name'] as String?;
    _saltafilaCategory1Item1Name =
        snapshotData['saltafila_category1_item1_name'] as String?;
    _saltafilaCategory1Item1Price =
        castToType<double>(snapshotData['saltafila_category1_item1_price']);
    _saltafilaCategory1Item2Name =
        snapshotData['saltafila_category1_item2_name'] as String?;
    _saltafilaCategory1Item2Price =
        castToType<double>(snapshotData['saltafila_category1_item2_price']);
    _saltafilaCategory1Item3Name =
        snapshotData['saltafila_category1_item3_name'] as String?;
    _saltafilaCategory1Item3Price =
        castToType<double>(snapshotData['saltafila_category1_item3_price']);
    _saltafilaCategory1Item4Name =
        snapshotData['saltafila_category1_item4_name'] as String?;
    _saltafilaCategory1Item4Price =
        castToType<double>(snapshotData['saltafila_category1_item4_price']);
    _saltafilaCategory1Item5Name =
        snapshotData['saltafila_category1_item5_name'] as String?;
    _saltafilaCategory1Item5Price =
        castToType<double>(snapshotData['saltafila_category1_item5_price']);
    _saltafilaCategory1Item6Name =
        snapshotData['saltafila_category1_item6_name'] as String?;
    _saltafilaCategory1Item6Price =
        castToType<double>(snapshotData['saltafila_category1_item6_price']);
    _saltafilaCategory1Item7Name =
        snapshotData['saltafila_category1_item7_name'] as String?;
    _saltafilaCategory1Item7Price =
        castToType<double>(snapshotData['saltafila_category1_item7_price']);
    _saltafilaCategory1Item8Name =
        snapshotData['saltafila_category1_item8_name'] as String?;
    _saltafilaCategory1Item8Price =
        castToType<double>(snapshotData['saltafila_category1_item8_price']);
    _saltafilaCategory1Item9Name =
        snapshotData['saltafila_category1_item9_name'] as String?;
    _saltafilaCategory1Item9Price =
        castToType<double>(snapshotData['saltafila_category1_item9_price']);
    _saltafilaCategory1Item10Name =
        snapshotData['saltafila_category1_item10_name'] as String?;
    _saltafilaCategory1Item10Price =
        castToType<double>(snapshotData['saltafila_category1_item10_price']);
    _saltafilaCategory2Name =
        snapshotData['saltafila_category2_name'] as String?;
    _saltafilaCategory2Item1Name =
        snapshotData['saltafila_category2_item1_name'] as String?;
    _saltafilaCategory2Item1Price =
        castToType<double>(snapshotData['saltafila_category2_item1_price']);
    _saltafilaCategory2Item2Name =
        snapshotData['saltafila_category2_item2_name'] as String?;
    _saltafilaCategory2Item2Price =
        castToType<double>(snapshotData['saltafila_category2_item2_price']);
    _saltafilaCategory2Item3Name =
        snapshotData['saltafila_category2_item3_name'] as String?;
    _saltafilaCategory2Item3Price =
        castToType<double>(snapshotData['saltafila_category2_item3_price']);
    _saltafilaCategory2Item4Name =
        snapshotData['saltafila_category2_item4_name'] as String?;
    _saltafilaCategory2Item4Price =
        castToType<double>(snapshotData['saltafila_category2_item4_price']);
    _saltafilaCategory2Item5Name =
        snapshotData['saltafila_category2_item5_name'] as String?;
    _saltafilaCategory2Item5Price =
        castToType<double>(snapshotData['saltafila_category2_item5_price']);
    _saltafilaCategory2Item6Name =
        snapshotData['saltafila_category2_item6_name'] as String?;
    _saltafilaCategory2Item6Price =
        castToType<double>(snapshotData['saltafila_category2_item6_price']);
    _saltafilaCategory2Item7Name =
        snapshotData['saltafila_category2_item7_name'] as String?;
    _saltafilaCategory2Item7Price =
        castToType<double>(snapshotData['saltafila_category2_item7_price']);
    _saltafilaCategory2Item8Name =
        snapshotData['saltafila_category2_item8_name'] as String?;
    _saltafilaCategory2Item8Price =
        castToType<double>(snapshotData['saltafila_category2_item8_price']);
    _saltafilaCategory2Item9Name =
        snapshotData['saltafila_category2_item9_name'] as String?;
    _saltafilaCategory2Item9Price =
        castToType<double>(snapshotData['saltafila_category2_item9_price']);
    _saltafilaCategory2Item10Name =
        snapshotData['saltafila_category2_item10_name'] as String?;
    _saltafilaCategory2Item10Price =
        castToType<double>(snapshotData['saltafila_category2_item10_price']);
    _saltafilaCategory3Name =
        snapshotData['saltafila_category3_name'] as String?;
    _saltafilaCategory3Item1Name =
        snapshotData['saltafila_category3_item1_name'] as String?;
    _saltafilaCategory3Item1Price =
        castToType<double>(snapshotData['saltafila_category3_item1_price']);
    _saltafilaCategory3Item2Name =
        snapshotData['saltafila_category3_item2_name'] as String?;
    _saltafilaCategory3Item2Price =
        castToType<double>(snapshotData['saltafila_category3_item2_price']);
    _saltafilaCategory3Item3Name =
        snapshotData['saltafila_category3_item3_name'] as String?;
    _saltafilaCategory3Item3Price =
        castToType<double>(snapshotData['saltafila_category3_item3_price']);
    _saltafilaCategory3Item4Name =
        snapshotData['saltafila_category3_item4_name'] as String?;
    _saltafilaCategory3Item4Price =
        castToType<double>(snapshotData['saltafila_category3_item4_price']);
    _saltafilaCategory3Item5Name =
        snapshotData['saltafila_category3_item5_name'] as String?;
    _saltafilaCategory3Item5Price =
        castToType<double>(snapshotData['saltafila_category3_item5_price']);
    _saltafilaCategory3Item6Name =
        snapshotData['saltafila_category3_item6_name'] as String?;
    _saltafilaCategory3Item6Price =
        castToType<double>(snapshotData['saltafila_category3_item6_price']);
    _saltafilaCategory3Item7Name =
        snapshotData['saltafila_category3_item7_name'] as String?;
    _saltafilaCategory3Item7Price =
        castToType<double>(snapshotData['saltafila_category3_item7_price']);
    _saltafilaCategory3Item8Name =
        snapshotData['saltafila_category3_item8_name'] as String?;
    _saltafilaCategory3Item8Price =
        castToType<double>(snapshotData['saltafila_category3_item8_price']);
    _saltafilaCategory3Item9Name =
        snapshotData['saltafila_category3_item9_name'] as String?;
    _saltafilaCategory3Item9Price =
        castToType<double>(snapshotData['saltafila_category3_item9_price']);
    _saltafilaCategory3Item10Name =
        snapshotData['saltafila_category3_item10_name'] as String?;
    _saltafilaCategory3Item10Price =
        castToType<double>(snapshotData['saltafila_category3_item10_price']);
    _ticketing = snapshotData['ticketing'] as bool?;
    _ticketPrice = castToType<double>(snapshotData['ticket_price']);
    _maxTickets = castToType<int>(snapshotData['maxTickets']);
    _priceOnlyInLista = snapshotData['priceOnlyInLista'] as bool?;
    _profileVisible = snapshotData['profileVisible'] as bool?;
    _saltafila = snapshotData['saltafila'] as bool?;
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

  static EventiRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      EventiRecord.getDocumentFromData(
        {
          'Titolo': snapshot.data['Titolo'],
          'Locandina': snapshot.data['Locandina'],
          'Hashtags': snapshot.data['Hashtags'],
          'Descrizione': snapshot.data['Descrizione'],
          'Locale': snapshot.data['Locale'],
          'imgLocale': snapshot.data['imgLocale'],
          'Localita': snapshot.data['Localita'],
          'Data': convertAlgoliaParam(
            snapshot.data['Data'],
            ParamType.DateTime,
            false,
          ),
          'Indirizzo': convertAlgoliaParam(
            snapshot.data,
            ParamType.LatLng,
            false,
          ),
          'urlMaps': snapshot.data['urlMaps'],
          'Ingresso1nome': snapshot.data['Ingresso1nome'],
          'Ingresso1Info': snapshot.data['Ingresso1Info'],
          'ingresso1Costo': snapshot.data['ingresso1Costo'],
          'ingresso2nome': snapshot.data['ingresso2nome'],
          'ingresso2Info': snapshot.data['ingresso2Info'],
          'ingresso2Costo': snapshot.data['ingresso2Costo'],
          'ingresso3Nome': snapshot.data['ingresso3Nome'],
          'ingresso3Info': snapshot.data['ingresso3Info'],
          'ingresso3Costo': snapshot.data['ingresso3Costo'],
          'Biglietti': snapshot.data['Biglietti'],
          'bigliettiUrl': snapshot.data['bigliettiUrl'],
          'verificato': snapshot.data['verificato'],
          'telefonoWa': snapshot.data['telefonoWa'],
          'contatto': snapshot.data['contatto'],
          'inizioOrario': convertAlgoliaParam(
            snapshot.data['inizioOrario'],
            ParamType.DateTime,
            false,
          ),
          'fineOrario': convertAlgoliaParam(
            snapshot.data['fineOrario'],
            ParamType.DateTime,
            false,
          ),
          'eventoRicorrente': snapshot.data['eventoRicorrente'],
          'gratis': snapshot.data['gratis'],
          'tipo': safeGet(
            () => snapshot.data['tipo'].toList(),
          ),
          'addressText': snapshot.data['addressText'],
          'categoriaEvento': snapshot.data['categoriaEvento'],
          'hashtagsList': safeGet(
            () => snapshot.data['hashtagsList'].toList(),
          ),
          'ingressoGratisDescrizione':
              snapshot.data['ingressoGratisDescrizione'],
          'lista': snapshot.data['lista'],
          'views': convertAlgoliaParam(
            snapshot.data['views'],
            ParamType.int,
            false,
          ),
          'shared': convertAlgoliaParam(
            snapshot.data['shared'],
            ParamType.int,
            false,
          ),
          'mapViews': convertAlgoliaParam(
            snapshot.data['mapViews'],
            ParamType.int,
            false,
          ),
          'organizzatoreName': snapshot.data['organizzatoreName'],
          'organizzatoreImg': snapshot.data['organizzatoreImg'],
          'organizzatore': snapshot.data['organizzatore'],
          'locationDiversa': snapshot.data['locationDiversa'],
          'createdBy': snapshot.data['createdBy'],
          'app_name': snapshot.data['app_name'],
          'eventoAnnullato': snapshot.data['eventoAnnullato'],
          'meetUpLocation': snapshot.data['meetUpLocation'],
          'marker': snapshot.data['marker'],
          'video': snapshot.data['video'],
          'videoPath': snapshot.data['videoPath'],
          'blinkEvent': snapshot.data['blinkEvent'],
          'city': snapshot.data['city'],
          'survey': snapshot.data['survey'],
          'survey_title': snapshot.data['survey_title'],
          'survey_hook': snapshot.data['survey_hook'],
          'function_photo_AI': snapshot.data['function_photo_AI'],
          'event_type': snapshot.data['event_type'],
          'dresscode': snapshot.data['dresscode'],
          'age': snapshot.data['age'],
          'music_type': safeGet(
            () => snapshot.data['music_type'].toList(),
          ),
          'ingresso1drink': snapshot.data['ingresso1drink'],
          'ingresso2drink': snapshot.data['ingresso2drink'],
          'ingresso3drink': snapshot.data['ingresso3drink'],
          'tables_function': snapshot.data['tables_function'],
          'table1_title': snapshot.data['table1_title'],
          'table1_description': snapshot.data['table1_description'],
          'table1_price': snapshot.data['table1_price'],
          'table2_title': snapshot.data['table2_title'],
          'table2_description': snapshot.data['table2_description'],
          'table2_price': snapshot.data['table2_price'],
          'table3_title': snapshot.data['table3_title'],
          'table3_description': snapshot.data['table3_description'],
          'table3_price': snapshot.data['table3_price'],
          'withDrink': snapshot.data['withDrink'],
          'open': snapshot.data['open'],
          'eventoManagerRef': convertAlgoliaParam(
            snapshot.data['eventoManagerRef'],
            ParamType.DocumentReference,
            false,
          ),
          'saltafila_category1_name': snapshot.data['saltafila_category1_name'],
          'saltafila_category1_item1_name':
              snapshot.data['saltafila_category1_item1_name'],
          'saltafila_category1_item1_price': convertAlgoliaParam(
            snapshot.data['saltafila_category1_item1_price'],
            ParamType.double,
            false,
          ),
          'saltafila_category1_item2_name':
              snapshot.data['saltafila_category1_item2_name'],
          'saltafila_category1_item2_price': convertAlgoliaParam(
            snapshot.data['saltafila_category1_item2_price'],
            ParamType.double,
            false,
          ),
          'saltafila_category1_item3_name':
              snapshot.data['saltafila_category1_item3_name'],
          'saltafila_category1_item3_price': convertAlgoliaParam(
            snapshot.data['saltafila_category1_item3_price'],
            ParamType.double,
            false,
          ),
          'saltafila_category1_item4_name':
              snapshot.data['saltafila_category1_item4_name'],
          'saltafila_category1_item4_price': convertAlgoliaParam(
            snapshot.data['saltafila_category1_item4_price'],
            ParamType.double,
            false,
          ),
          'saltafila_category1_item5_name':
              snapshot.data['saltafila_category1_item5_name'],
          'saltafila_category1_item5_price': convertAlgoliaParam(
            snapshot.data['saltafila_category1_item5_price'],
            ParamType.double,
            false,
          ),
          'saltafila_category1_item6_name':
              snapshot.data['saltafila_category1_item6_name'],
          'saltafila_category1_item6_price': convertAlgoliaParam(
            snapshot.data['saltafila_category1_item6_price'],
            ParamType.double,
            false,
          ),
          'saltafila_category1_item7_name':
              snapshot.data['saltafila_category1_item7_name'],
          'saltafila_category1_item7_price': convertAlgoliaParam(
            snapshot.data['saltafila_category1_item7_price'],
            ParamType.double,
            false,
          ),
          'saltafila_category1_item8_name':
              snapshot.data['saltafila_category1_item8_name'],
          'saltafila_category1_item8_price': convertAlgoliaParam(
            snapshot.data['saltafila_category1_item8_price'],
            ParamType.double,
            false,
          ),
          'saltafila_category1_item9_name':
              snapshot.data['saltafila_category1_item9_name'],
          'saltafila_category1_item9_price': convertAlgoliaParam(
            snapshot.data['saltafila_category1_item9_price'],
            ParamType.double,
            false,
          ),
          'saltafila_category1_item10_name':
              snapshot.data['saltafila_category1_item10_name'],
          'saltafila_category1_item10_price': convertAlgoliaParam(
            snapshot.data['saltafila_category1_item10_price'],
            ParamType.double,
            false,
          ),
          'saltafila_category2_name': snapshot.data['saltafila_category2_name'],
          'saltafila_category2_item1_name':
              snapshot.data['saltafila_category2_item1_name'],
          'saltafila_category2_item1_price': convertAlgoliaParam(
            snapshot.data['saltafila_category2_item1_price'],
            ParamType.double,
            false,
          ),
          'saltafila_category2_item2_name':
              snapshot.data['saltafila_category2_item2_name'],
          'saltafila_category2_item2_price': convertAlgoliaParam(
            snapshot.data['saltafila_category2_item2_price'],
            ParamType.double,
            false,
          ),
          'saltafila_category2_item3_name':
              snapshot.data['saltafila_category2_item3_name'],
          'saltafila_category2_item3_price': convertAlgoliaParam(
            snapshot.data['saltafila_category2_item3_price'],
            ParamType.double,
            false,
          ),
          'saltafila_category2_item4_name':
              snapshot.data['saltafila_category2_item4_name'],
          'saltafila_category2_item4_price': convertAlgoliaParam(
            snapshot.data['saltafila_category2_item4_price'],
            ParamType.double,
            false,
          ),
          'saltafila_category2_item5_name':
              snapshot.data['saltafila_category2_item5_name'],
          'saltafila_category2_item5_price': convertAlgoliaParam(
            snapshot.data['saltafila_category2_item5_price'],
            ParamType.double,
            false,
          ),
          'saltafila_category2_item6_name':
              snapshot.data['saltafila_category2_item6_name'],
          'saltafila_category2_item6_price': convertAlgoliaParam(
            snapshot.data['saltafila_category2_item6_price'],
            ParamType.double,
            false,
          ),
          'saltafila_category2_item7_name':
              snapshot.data['saltafila_category2_item7_name'],
          'saltafila_category2_item7_price': convertAlgoliaParam(
            snapshot.data['saltafila_category2_item7_price'],
            ParamType.double,
            false,
          ),
          'saltafila_category2_item8_name':
              snapshot.data['saltafila_category2_item8_name'],
          'saltafila_category2_item8_price': convertAlgoliaParam(
            snapshot.data['saltafila_category2_item8_price'],
            ParamType.double,
            false,
          ),
          'saltafila_category2_item9_name':
              snapshot.data['saltafila_category2_item9_name'],
          'saltafila_category2_item9_price': convertAlgoliaParam(
            snapshot.data['saltafila_category2_item9_price'],
            ParamType.double,
            false,
          ),
          'saltafila_category2_item10_name':
              snapshot.data['saltafila_category2_item10_name'],
          'saltafila_category2_item10_price': convertAlgoliaParam(
            snapshot.data['saltafila_category2_item10_price'],
            ParamType.double,
            false,
          ),
          'saltafila_category3_name': snapshot.data['saltafila_category3_name'],
          'saltafila_category3_item1_name':
              snapshot.data['saltafila_category3_item1_name'],
          'saltafila_category3_item1_price': convertAlgoliaParam(
            snapshot.data['saltafila_category3_item1_price'],
            ParamType.double,
            false,
          ),
          'saltafila_category3_item2_name':
              snapshot.data['saltafila_category3_item2_name'],
          'saltafila_category3_item2_price': convertAlgoliaParam(
            snapshot.data['saltafila_category3_item2_price'],
            ParamType.double,
            false,
          ),
          'saltafila_category3_item3_name':
              snapshot.data['saltafila_category3_item3_name'],
          'saltafila_category3_item3_price': convertAlgoliaParam(
            snapshot.data['saltafila_category3_item3_price'],
            ParamType.double,
            false,
          ),
          'saltafila_category3_item4_name':
              snapshot.data['saltafila_category3_item4_name'],
          'saltafila_category3_item4_price': convertAlgoliaParam(
            snapshot.data['saltafila_category3_item4_price'],
            ParamType.double,
            false,
          ),
          'saltafila_category3_item5_name':
              snapshot.data['saltafila_category3_item5_name'],
          'saltafila_category3_item5_price': convertAlgoliaParam(
            snapshot.data['saltafila_category3_item5_price'],
            ParamType.double,
            false,
          ),
          'saltafila_category3_item6_name':
              snapshot.data['saltafila_category3_item6_name'],
          'saltafila_category3_item6_price': convertAlgoliaParam(
            snapshot.data['saltafila_category3_item6_price'],
            ParamType.double,
            false,
          ),
          'saltafila_category3_item7_name':
              snapshot.data['saltafila_category3_item7_name'],
          'saltafila_category3_item7_price': convertAlgoliaParam(
            snapshot.data['saltafila_category3_item7_price'],
            ParamType.double,
            false,
          ),
          'saltafila_category3_item8_name':
              snapshot.data['saltafila_category3_item8_name'],
          'saltafila_category3_item8_price': convertAlgoliaParam(
            snapshot.data['saltafila_category3_item8_price'],
            ParamType.double,
            false,
          ),
          'saltafila_category3_item9_name':
              snapshot.data['saltafila_category3_item9_name'],
          'saltafila_category3_item9_price': convertAlgoliaParam(
            snapshot.data['saltafila_category3_item9_price'],
            ParamType.double,
            false,
          ),
          'saltafila_category3_item10_name':
              snapshot.data['saltafila_category3_item10_name'],
          'saltafila_category3_item10_price': convertAlgoliaParam(
            snapshot.data['saltafila_category3_item10_price'],
            ParamType.double,
            false,
          ),
          'ticketing': snapshot.data['ticketing'],
          'ticket_price': convertAlgoliaParam(
            snapshot.data['ticket_price'],
            ParamType.double,
            false,
          ),
          'maxTickets': convertAlgoliaParam(
            snapshot.data['maxTickets'],
            ParamType.int,
            false,
          ),
          'priceOnlyInLista': snapshot.data['priceOnlyInLista'],
          'profileVisible': snapshot.data['profileVisible'],
          'saltafila': snapshot.data['saltafila'],
        },
        EventiRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<EventiRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'Eventi',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

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
  bool? eventoAnnullato,
  bool? meetUpLocation,
  String? marker,
  bool? video,
  String? videoPath,
  bool? blinkEvent,
  String? city,
  bool? survey,
  String? surveyTitle,
  String? surveyHook,
  bool? functionPhotoAI,
  String? eventType,
  String? dresscode,
  String? age,
  bool? ingresso1drink,
  bool? ingresso2drink,
  bool? ingresso3drink,
  bool? tablesFunction,
  String? table1Title,
  String? table1Description,
  String? table1Price,
  String? table2Title,
  String? table2Description,
  String? table2Price,
  String? table3Title,
  String? table3Description,
  String? table3Price,
  bool? withDrink,
  bool? open,
  DocumentReference? eventoManagerRef,
  String? saltafilaCategory1Name,
  String? saltafilaCategory1Item1Name,
  double? saltafilaCategory1Item1Price,
  String? saltafilaCategory1Item2Name,
  double? saltafilaCategory1Item2Price,
  String? saltafilaCategory1Item3Name,
  double? saltafilaCategory1Item3Price,
  String? saltafilaCategory1Item4Name,
  double? saltafilaCategory1Item4Price,
  String? saltafilaCategory1Item5Name,
  double? saltafilaCategory1Item5Price,
  String? saltafilaCategory1Item6Name,
  double? saltafilaCategory1Item6Price,
  String? saltafilaCategory1Item7Name,
  double? saltafilaCategory1Item7Price,
  String? saltafilaCategory1Item8Name,
  double? saltafilaCategory1Item8Price,
  String? saltafilaCategory1Item9Name,
  double? saltafilaCategory1Item9Price,
  String? saltafilaCategory1Item10Name,
  double? saltafilaCategory1Item10Price,
  String? saltafilaCategory2Name,
  String? saltafilaCategory2Item1Name,
  double? saltafilaCategory2Item1Price,
  String? saltafilaCategory2Item2Name,
  double? saltafilaCategory2Item2Price,
  String? saltafilaCategory2Item3Name,
  double? saltafilaCategory2Item3Price,
  String? saltafilaCategory2Item4Name,
  double? saltafilaCategory2Item4Price,
  String? saltafilaCategory2Item5Name,
  double? saltafilaCategory2Item5Price,
  String? saltafilaCategory2Item6Name,
  double? saltafilaCategory2Item6Price,
  String? saltafilaCategory2Item7Name,
  double? saltafilaCategory2Item7Price,
  String? saltafilaCategory2Item8Name,
  double? saltafilaCategory2Item8Price,
  String? saltafilaCategory2Item9Name,
  double? saltafilaCategory2Item9Price,
  String? saltafilaCategory2Item10Name,
  double? saltafilaCategory2Item10Price,
  String? saltafilaCategory3Name,
  String? saltafilaCategory3Item1Name,
  double? saltafilaCategory3Item1Price,
  String? saltafilaCategory3Item2Name,
  double? saltafilaCategory3Item2Price,
  String? saltafilaCategory3Item3Name,
  double? saltafilaCategory3Item3Price,
  String? saltafilaCategory3Item4Name,
  double? saltafilaCategory3Item4Price,
  String? saltafilaCategory3Item5Name,
  double? saltafilaCategory3Item5Price,
  String? saltafilaCategory3Item6Name,
  double? saltafilaCategory3Item6Price,
  String? saltafilaCategory3Item7Name,
  double? saltafilaCategory3Item7Price,
  String? saltafilaCategory3Item8Name,
  double? saltafilaCategory3Item8Price,
  String? saltafilaCategory3Item9Name,
  double? saltafilaCategory3Item9Price,
  String? saltafilaCategory3Item10Name,
  double? saltafilaCategory3Item10Price,
  bool? ticketing,
  double? ticketPrice,
  int? maxTickets,
  bool? priceOnlyInLista,
  bool? profileVisible,
  bool? saltafila,
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
      'eventoAnnullato': eventoAnnullato,
      'meetUpLocation': meetUpLocation,
      'marker': marker,
      'video': video,
      'videoPath': videoPath,
      'blinkEvent': blinkEvent,
      'city': city,
      'survey': survey,
      'survey_title': surveyTitle,
      'survey_hook': surveyHook,
      'function_photo_AI': functionPhotoAI,
      'event_type': eventType,
      'dresscode': dresscode,
      'age': age,
      'ingresso1drink': ingresso1drink,
      'ingresso2drink': ingresso2drink,
      'ingresso3drink': ingresso3drink,
      'tables_function': tablesFunction,
      'table1_title': table1Title,
      'table1_description': table1Description,
      'table1_price': table1Price,
      'table2_title': table2Title,
      'table2_description': table2Description,
      'table2_price': table2Price,
      'table3_title': table3Title,
      'table3_description': table3Description,
      'table3_price': table3Price,
      'withDrink': withDrink,
      'open': open,
      'eventoManagerRef': eventoManagerRef,
      'saltafila_category1_name': saltafilaCategory1Name,
      'saltafila_category1_item1_name': saltafilaCategory1Item1Name,
      'saltafila_category1_item1_price': saltafilaCategory1Item1Price,
      'saltafila_category1_item2_name': saltafilaCategory1Item2Name,
      'saltafila_category1_item2_price': saltafilaCategory1Item2Price,
      'saltafila_category1_item3_name': saltafilaCategory1Item3Name,
      'saltafila_category1_item3_price': saltafilaCategory1Item3Price,
      'saltafila_category1_item4_name': saltafilaCategory1Item4Name,
      'saltafila_category1_item4_price': saltafilaCategory1Item4Price,
      'saltafila_category1_item5_name': saltafilaCategory1Item5Name,
      'saltafila_category1_item5_price': saltafilaCategory1Item5Price,
      'saltafila_category1_item6_name': saltafilaCategory1Item6Name,
      'saltafila_category1_item6_price': saltafilaCategory1Item6Price,
      'saltafila_category1_item7_name': saltafilaCategory1Item7Name,
      'saltafila_category1_item7_price': saltafilaCategory1Item7Price,
      'saltafila_category1_item8_name': saltafilaCategory1Item8Name,
      'saltafila_category1_item8_price': saltafilaCategory1Item8Price,
      'saltafila_category1_item9_name': saltafilaCategory1Item9Name,
      'saltafila_category1_item9_price': saltafilaCategory1Item9Price,
      'saltafila_category1_item10_name': saltafilaCategory1Item10Name,
      'saltafila_category1_item10_price': saltafilaCategory1Item10Price,
      'saltafila_category2_name': saltafilaCategory2Name,
      'saltafila_category2_item1_name': saltafilaCategory2Item1Name,
      'saltafila_category2_item1_price': saltafilaCategory2Item1Price,
      'saltafila_category2_item2_name': saltafilaCategory2Item2Name,
      'saltafila_category2_item2_price': saltafilaCategory2Item2Price,
      'saltafila_category2_item3_name': saltafilaCategory2Item3Name,
      'saltafila_category2_item3_price': saltafilaCategory2Item3Price,
      'saltafila_category2_item4_name': saltafilaCategory2Item4Name,
      'saltafila_category2_item4_price': saltafilaCategory2Item4Price,
      'saltafila_category2_item5_name': saltafilaCategory2Item5Name,
      'saltafila_category2_item5_price': saltafilaCategory2Item5Price,
      'saltafila_category2_item6_name': saltafilaCategory2Item6Name,
      'saltafila_category2_item6_price': saltafilaCategory2Item6Price,
      'saltafila_category2_item7_name': saltafilaCategory2Item7Name,
      'saltafila_category2_item7_price': saltafilaCategory2Item7Price,
      'saltafila_category2_item8_name': saltafilaCategory2Item8Name,
      'saltafila_category2_item8_price': saltafilaCategory2Item8Price,
      'saltafila_category2_item9_name': saltafilaCategory2Item9Name,
      'saltafila_category2_item9_price': saltafilaCategory2Item9Price,
      'saltafila_category2_item10_name': saltafilaCategory2Item10Name,
      'saltafila_category2_item10_price': saltafilaCategory2Item10Price,
      'saltafila_category3_name': saltafilaCategory3Name,
      'saltafila_category3_item1_name': saltafilaCategory3Item1Name,
      'saltafila_category3_item1_price': saltafilaCategory3Item1Price,
      'saltafila_category3_item2_name': saltafilaCategory3Item2Name,
      'saltafila_category3_item2_price': saltafilaCategory3Item2Price,
      'saltafila_category3_item3_name': saltafilaCategory3Item3Name,
      'saltafila_category3_item3_price': saltafilaCategory3Item3Price,
      'saltafila_category3_item4_name': saltafilaCategory3Item4Name,
      'saltafila_category3_item4_price': saltafilaCategory3Item4Price,
      'saltafila_category3_item5_name': saltafilaCategory3Item5Name,
      'saltafila_category3_item5_price': saltafilaCategory3Item5Price,
      'saltafila_category3_item6_name': saltafilaCategory3Item6Name,
      'saltafila_category3_item6_price': saltafilaCategory3Item6Price,
      'saltafila_category3_item7_name': saltafilaCategory3Item7Name,
      'saltafila_category3_item7_price': saltafilaCategory3Item7Price,
      'saltafila_category3_item8_name': saltafilaCategory3Item8Name,
      'saltafila_category3_item8_price': saltafilaCategory3Item8Price,
      'saltafila_category3_item9_name': saltafilaCategory3Item9Name,
      'saltafila_category3_item9_price': saltafilaCategory3Item9Price,
      'saltafila_category3_item10_name': saltafilaCategory3Item10Name,
      'saltafila_category3_item10_price': saltafilaCategory3Item10Price,
      'ticketing': ticketing,
      'ticket_price': ticketPrice,
      'maxTickets': maxTickets,
      'priceOnlyInLista': priceOnlyInLista,
      'profileVisible': profileVisible,
      'saltafila': saltafila,
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
        e1?.appName == e2?.appName &&
        e1?.eventoAnnullato == e2?.eventoAnnullato &&
        e1?.meetUpLocation == e2?.meetUpLocation &&
        e1?.marker == e2?.marker &&
        e1?.video == e2?.video &&
        e1?.videoPath == e2?.videoPath &&
        e1?.blinkEvent == e2?.blinkEvent &&
        e1?.city == e2?.city &&
        e1?.survey == e2?.survey &&
        e1?.surveyTitle == e2?.surveyTitle &&
        e1?.surveyHook == e2?.surveyHook &&
        e1?.functionPhotoAI == e2?.functionPhotoAI &&
        e1?.eventType == e2?.eventType &&
        e1?.dresscode == e2?.dresscode &&
        e1?.age == e2?.age &&
        listEquality.equals(e1?.musicType, e2?.musicType) &&
        e1?.ingresso1drink == e2?.ingresso1drink &&
        e1?.ingresso2drink == e2?.ingresso2drink &&
        e1?.ingresso3drink == e2?.ingresso3drink &&
        e1?.tablesFunction == e2?.tablesFunction &&
        e1?.table1Title == e2?.table1Title &&
        e1?.table1Description == e2?.table1Description &&
        e1?.table1Price == e2?.table1Price &&
        e1?.table2Title == e2?.table2Title &&
        e1?.table2Description == e2?.table2Description &&
        e1?.table2Price == e2?.table2Price &&
        e1?.table3Title == e2?.table3Title &&
        e1?.table3Description == e2?.table3Description &&
        e1?.table3Price == e2?.table3Price &&
        e1?.withDrink == e2?.withDrink &&
        e1?.open == e2?.open &&
        e1?.eventoManagerRef == e2?.eventoManagerRef &&
        e1?.saltafilaCategory1Name == e2?.saltafilaCategory1Name &&
        e1?.saltafilaCategory1Item1Name == e2?.saltafilaCategory1Item1Name &&
        e1?.saltafilaCategory1Item1Price == e2?.saltafilaCategory1Item1Price &&
        e1?.saltafilaCategory1Item2Name == e2?.saltafilaCategory1Item2Name &&
        e1?.saltafilaCategory1Item2Price == e2?.saltafilaCategory1Item2Price &&
        e1?.saltafilaCategory1Item3Name == e2?.saltafilaCategory1Item3Name &&
        e1?.saltafilaCategory1Item3Price == e2?.saltafilaCategory1Item3Price &&
        e1?.saltafilaCategory1Item4Name == e2?.saltafilaCategory1Item4Name &&
        e1?.saltafilaCategory1Item4Price == e2?.saltafilaCategory1Item4Price &&
        e1?.saltafilaCategory1Item5Name == e2?.saltafilaCategory1Item5Name &&
        e1?.saltafilaCategory1Item5Price == e2?.saltafilaCategory1Item5Price &&
        e1?.saltafilaCategory1Item6Name == e2?.saltafilaCategory1Item6Name &&
        e1?.saltafilaCategory1Item6Price == e2?.saltafilaCategory1Item6Price &&
        e1?.saltafilaCategory1Item7Name == e2?.saltafilaCategory1Item7Name &&
        e1?.saltafilaCategory1Item7Price == e2?.saltafilaCategory1Item7Price &&
        e1?.saltafilaCategory1Item8Name == e2?.saltafilaCategory1Item8Name &&
        e1?.saltafilaCategory1Item8Price == e2?.saltafilaCategory1Item8Price &&
        e1?.saltafilaCategory1Item9Name == e2?.saltafilaCategory1Item9Name &&
        e1?.saltafilaCategory1Item9Price == e2?.saltafilaCategory1Item9Price &&
        e1?.saltafilaCategory1Item10Name == e2?.saltafilaCategory1Item10Name &&
        e1?.saltafilaCategory1Item10Price ==
            e2?.saltafilaCategory1Item10Price &&
        e1?.saltafilaCategory2Name == e2?.saltafilaCategory2Name &&
        e1?.saltafilaCategory2Item1Name == e2?.saltafilaCategory2Item1Name &&
        e1?.saltafilaCategory2Item1Price == e2?.saltafilaCategory2Item1Price &&
        e1?.saltafilaCategory2Item2Name == e2?.saltafilaCategory2Item2Name &&
        e1?.saltafilaCategory2Item2Price == e2?.saltafilaCategory2Item2Price &&
        e1?.saltafilaCategory2Item3Name == e2?.saltafilaCategory2Item3Name &&
        e1?.saltafilaCategory2Item3Price == e2?.saltafilaCategory2Item3Price &&
        e1?.saltafilaCategory2Item4Name == e2?.saltafilaCategory2Item4Name &&
        e1?.saltafilaCategory2Item4Price == e2?.saltafilaCategory2Item4Price &&
        e1?.saltafilaCategory2Item5Name == e2?.saltafilaCategory2Item5Name &&
        e1?.saltafilaCategory2Item5Price == e2?.saltafilaCategory2Item5Price &&
        e1?.saltafilaCategory2Item6Name == e2?.saltafilaCategory2Item6Name &&
        e1?.saltafilaCategory2Item6Price == e2?.saltafilaCategory2Item6Price &&
        e1?.saltafilaCategory2Item7Name == e2?.saltafilaCategory2Item7Name &&
        e1?.saltafilaCategory2Item7Price == e2?.saltafilaCategory2Item7Price &&
        e1?.saltafilaCategory2Item8Name == e2?.saltafilaCategory2Item8Name &&
        e1?.saltafilaCategory2Item8Price == e2?.saltafilaCategory2Item8Price &&
        e1?.saltafilaCategory2Item9Name == e2?.saltafilaCategory2Item9Name &&
        e1?.saltafilaCategory2Item9Price == e2?.saltafilaCategory2Item9Price &&
        e1?.saltafilaCategory2Item10Name == e2?.saltafilaCategory2Item10Name &&
        e1?.saltafilaCategory2Item10Price ==
            e2?.saltafilaCategory2Item10Price &&
        e1?.saltafilaCategory3Name == e2?.saltafilaCategory3Name &&
        e1?.saltafilaCategory3Item1Name == e2?.saltafilaCategory3Item1Name &&
        e1?.saltafilaCategory3Item1Price == e2?.saltafilaCategory3Item1Price &&
        e1?.saltafilaCategory3Item2Name == e2?.saltafilaCategory3Item2Name &&
        e1?.saltafilaCategory3Item2Price == e2?.saltafilaCategory3Item2Price &&
        e1?.saltafilaCategory3Item3Name == e2?.saltafilaCategory3Item3Name &&
        e1?.saltafilaCategory3Item3Price == e2?.saltafilaCategory3Item3Price &&
        e1?.saltafilaCategory3Item4Name == e2?.saltafilaCategory3Item4Name &&
        e1?.saltafilaCategory3Item4Price == e2?.saltafilaCategory3Item4Price &&
        e1?.saltafilaCategory3Item5Name == e2?.saltafilaCategory3Item5Name &&
        e1?.saltafilaCategory3Item5Price == e2?.saltafilaCategory3Item5Price &&
        e1?.saltafilaCategory3Item6Name == e2?.saltafilaCategory3Item6Name &&
        e1?.saltafilaCategory3Item6Price == e2?.saltafilaCategory3Item6Price &&
        e1?.saltafilaCategory3Item7Name == e2?.saltafilaCategory3Item7Name &&
        e1?.saltafilaCategory3Item7Price == e2?.saltafilaCategory3Item7Price &&
        e1?.saltafilaCategory3Item8Name == e2?.saltafilaCategory3Item8Name &&
        e1?.saltafilaCategory3Item8Price == e2?.saltafilaCategory3Item8Price &&
        e1?.saltafilaCategory3Item9Name == e2?.saltafilaCategory3Item9Name &&
        e1?.saltafilaCategory3Item9Price == e2?.saltafilaCategory3Item9Price &&
        e1?.saltafilaCategory3Item10Name == e2?.saltafilaCategory3Item10Name &&
        e1?.saltafilaCategory3Item10Price ==
            e2?.saltafilaCategory3Item10Price &&
        e1?.ticketing == e2?.ticketing &&
        e1?.ticketPrice == e2?.ticketPrice &&
        e1?.maxTickets == e2?.maxTickets &&
        e1?.priceOnlyInLista == e2?.priceOnlyInLista &&
        e1?.profileVisible == e2?.profileVisible &&
        e1?.saltafila == e2?.saltafila;
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
        e?.appName,
        e?.eventoAnnullato,
        e?.meetUpLocation,
        e?.marker,
        e?.video,
        e?.videoPath,
        e?.blinkEvent,
        e?.city,
        e?.survey,
        e?.surveyTitle,
        e?.surveyHook,
        e?.functionPhotoAI,
        e?.eventType,
        e?.dresscode,
        e?.age,
        e?.musicType,
        e?.ingresso1drink,
        e?.ingresso2drink,
        e?.ingresso3drink,
        e?.tablesFunction,
        e?.table1Title,
        e?.table1Description,
        e?.table1Price,
        e?.table2Title,
        e?.table2Description,
        e?.table2Price,
        e?.table3Title,
        e?.table3Description,
        e?.table3Price,
        e?.withDrink,
        e?.open,
        e?.eventoManagerRef,
        e?.saltafilaCategory1Name,
        e?.saltafilaCategory1Item1Name,
        e?.saltafilaCategory1Item1Price,
        e?.saltafilaCategory1Item2Name,
        e?.saltafilaCategory1Item2Price,
        e?.saltafilaCategory1Item3Name,
        e?.saltafilaCategory1Item3Price,
        e?.saltafilaCategory1Item4Name,
        e?.saltafilaCategory1Item4Price,
        e?.saltafilaCategory1Item5Name,
        e?.saltafilaCategory1Item5Price,
        e?.saltafilaCategory1Item6Name,
        e?.saltafilaCategory1Item6Price,
        e?.saltafilaCategory1Item7Name,
        e?.saltafilaCategory1Item7Price,
        e?.saltafilaCategory1Item8Name,
        e?.saltafilaCategory1Item8Price,
        e?.saltafilaCategory1Item9Name,
        e?.saltafilaCategory1Item9Price,
        e?.saltafilaCategory1Item10Name,
        e?.saltafilaCategory1Item10Price,
        e?.saltafilaCategory2Name,
        e?.saltafilaCategory2Item1Name,
        e?.saltafilaCategory2Item1Price,
        e?.saltafilaCategory2Item2Name,
        e?.saltafilaCategory2Item2Price,
        e?.saltafilaCategory2Item3Name,
        e?.saltafilaCategory2Item3Price,
        e?.saltafilaCategory2Item4Name,
        e?.saltafilaCategory2Item4Price,
        e?.saltafilaCategory2Item5Name,
        e?.saltafilaCategory2Item5Price,
        e?.saltafilaCategory2Item6Name,
        e?.saltafilaCategory2Item6Price,
        e?.saltafilaCategory2Item7Name,
        e?.saltafilaCategory2Item7Price,
        e?.saltafilaCategory2Item8Name,
        e?.saltafilaCategory2Item8Price,
        e?.saltafilaCategory2Item9Name,
        e?.saltafilaCategory2Item9Price,
        e?.saltafilaCategory2Item10Name,
        e?.saltafilaCategory2Item10Price,
        e?.saltafilaCategory3Name,
        e?.saltafilaCategory3Item1Name,
        e?.saltafilaCategory3Item1Price,
        e?.saltafilaCategory3Item2Name,
        e?.saltafilaCategory3Item2Price,
        e?.saltafilaCategory3Item3Name,
        e?.saltafilaCategory3Item3Price,
        e?.saltafilaCategory3Item4Name,
        e?.saltafilaCategory3Item4Price,
        e?.saltafilaCategory3Item5Name,
        e?.saltafilaCategory3Item5Price,
        e?.saltafilaCategory3Item6Name,
        e?.saltafilaCategory3Item6Price,
        e?.saltafilaCategory3Item7Name,
        e?.saltafilaCategory3Item7Price,
        e?.saltafilaCategory3Item8Name,
        e?.saltafilaCategory3Item8Price,
        e?.saltafilaCategory3Item9Name,
        e?.saltafilaCategory3Item9Price,
        e?.saltafilaCategory3Item10Name,
        e?.saltafilaCategory3Item10Price,
        e?.ticketing,
        e?.ticketPrice,
        e?.maxTickets,
        e?.priceOnlyInLista,
        e?.profileVisible,
        e?.saltafila
      ]);

  @override
  bool isValidKey(Object? o) => o is EventiRecord;
}
