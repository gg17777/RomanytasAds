import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SurveysRecord extends FirestoreRecord {
  SurveysRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "page1" field.
  String? _page1;
  String get page1 => _page1 ?? '';
  bool hasPage1() => _page1 != null;

  // "page2" field.
  String? _page2;
  String get page2 => _page2 ?? '';
  bool hasPage2() => _page2 != null;

  // "page3" field.
  String? _page3;
  String get page3 => _page3 ?? '';
  bool hasPage3() => _page3 != null;

  // "page4" field.
  String? _page4;
  String get page4 => _page4 ?? '';
  bool hasPage4() => _page4 != null;

  // "page5" field.
  String? _page5;
  String get page5 => _page5 ?? '';
  bool hasPage5() => _page5 != null;

  // "page6" field.
  String? _page6;
  String get page6 => _page6 ?? '';
  bool hasPage6() => _page6 != null;

  // "page7" field.
  String? _page7;
  String get page7 => _page7 ?? '';
  bool hasPage7() => _page7 != null;

  // "page8" field.
  String? _page8;
  String get page8 => _page8 ?? '';
  bool hasPage8() => _page8 != null;

  // "page9" field.
  String? _page9;
  String get page9 => _page9 ?? '';
  bool hasPage9() => _page9 != null;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "checked" field.
  bool? _checked;
  bool get checked => _checked ?? false;
  bool hasChecked() => _checked != null;

  // "event_name" field.
  String? _eventName;
  String get eventName => _eventName ?? '';
  bool hasEventName() => _eventName != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "page10" field.
  String? _page10;
  String get page10 => _page10 ?? '';
  bool hasPage10() => _page10 != null;

  // "page11" field.
  String? _page11;
  String get page11 => _page11 ?? '';
  bool hasPage11() => _page11 != null;

  // "page12" field.
  String? _page12;
  String get page12 => _page12 ?? '';
  bool hasPage12() => _page12 != null;

  // "page13" field.
  String? _page13;
  String get page13 => _page13 ?? '';
  bool hasPage13() => _page13 != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  void _initializeFields() {
    _page1 = snapshotData['page1'] as String?;
    _page2 = snapshotData['page2'] as String?;
    _page3 = snapshotData['page3'] as String?;
    _page4 = snapshotData['page4'] as String?;
    _page5 = snapshotData['page5'] as String?;
    _page6 = snapshotData['page6'] as String?;
    _page7 = snapshotData['page7'] as String?;
    _page8 = snapshotData['page8'] as String?;
    _page9 = snapshotData['page9'] as String?;
    _nome = snapshotData['nome'] as String?;
    _checked = snapshotData['checked'] as bool?;
    _eventName = snapshotData['event_name'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _page10 = snapshotData['page10'] as String?;
    _page11 = snapshotData['page11'] as String?;
    _page12 = snapshotData['page12'] as String?;
    _page13 = snapshotData['page13'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('surveys');

  static Stream<SurveysRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SurveysRecord.fromSnapshot(s));

  static Future<SurveysRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SurveysRecord.fromSnapshot(s));

  static SurveysRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SurveysRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SurveysRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SurveysRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SurveysRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SurveysRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSurveysRecordData({
  String? page1,
  String? page2,
  String? page3,
  String? page4,
  String? page5,
  String? page6,
  String? page7,
  String? page8,
  String? page9,
  String? nome,
  bool? checked,
  String? eventName,
  DocumentReference? userRef,
  String? page10,
  String? page11,
  String? page12,
  String? page13,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'page1': page1,
      'page2': page2,
      'page3': page3,
      'page4': page4,
      'page5': page5,
      'page6': page6,
      'page7': page7,
      'page8': page8,
      'page9': page9,
      'nome': nome,
      'checked': checked,
      'event_name': eventName,
      'userRef': userRef,
      'page10': page10,
      'page11': page11,
      'page12': page12,
      'page13': page13,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class SurveysRecordDocumentEquality implements Equality<SurveysRecord> {
  const SurveysRecordDocumentEquality();

  @override
  bool equals(SurveysRecord? e1, SurveysRecord? e2) {
    return e1?.page1 == e2?.page1 &&
        e1?.page2 == e2?.page2 &&
        e1?.page3 == e2?.page3 &&
        e1?.page4 == e2?.page4 &&
        e1?.page5 == e2?.page5 &&
        e1?.page6 == e2?.page6 &&
        e1?.page7 == e2?.page7 &&
        e1?.page8 == e2?.page8 &&
        e1?.page9 == e2?.page9 &&
        e1?.nome == e2?.nome &&
        e1?.checked == e2?.checked &&
        e1?.eventName == e2?.eventName &&
        e1?.userRef == e2?.userRef &&
        e1?.page10 == e2?.page10 &&
        e1?.page11 == e2?.page11 &&
        e1?.page12 == e2?.page12 &&
        e1?.page13 == e2?.page13 &&
        e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(SurveysRecord? e) => const ListEquality().hash([
        e?.page1,
        e?.page2,
        e?.page3,
        e?.page4,
        e?.page5,
        e?.page6,
        e?.page7,
        e?.page8,
        e?.page9,
        e?.nome,
        e?.checked,
        e?.eventName,
        e?.userRef,
        e?.page10,
        e?.page11,
        e?.page12,
        e?.page13,
        e?.createdTime
      ]);

  @override
  bool isValidKey(Object? o) => o is SurveysRecord;
}
