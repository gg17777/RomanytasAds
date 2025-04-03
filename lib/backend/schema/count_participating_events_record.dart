import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CountParticipatingEventsRecord extends FirestoreRecord {
  CountParticipatingEventsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  bool hasImg() => _img != null;

  // "participatingTimes" field.
  int? _participatingTimes;
  int get participatingTimes => _participatingTimes ?? 0;
  bool hasParticipatingTimes() => _participatingTimes != null;

  // "event" field.
  String? _event;
  String get event => _event ?? '';
  bool hasEvent() => _event != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _name = snapshotData['name'] as String?;
    _img = snapshotData['img'] as String?;
    _participatingTimes = castToType<int>(snapshotData['participatingTimes']);
    _event = snapshotData['event'] as String?;
    _type = snapshotData['type'] as String?;
    _email = snapshotData['email'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('countParticipatingEvents');

  static Stream<CountParticipatingEventsRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => CountParticipatingEventsRecord.fromSnapshot(s));

  static Future<CountParticipatingEventsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CountParticipatingEventsRecord.fromSnapshot(s));

  static CountParticipatingEventsRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      CountParticipatingEventsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CountParticipatingEventsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CountParticipatingEventsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CountParticipatingEventsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CountParticipatingEventsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCountParticipatingEventsRecordData({
  DateTime? date,
  String? name,
  String? img,
  int? participatingTimes,
  String? event,
  String? type,
  String? email,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'name': name,
      'img': img,
      'participatingTimes': participatingTimes,
      'event': event,
      'type': type,
      'email': email,
    }.withoutNulls,
  );

  return firestoreData;
}

class CountParticipatingEventsRecordDocumentEquality
    implements Equality<CountParticipatingEventsRecord> {
  const CountParticipatingEventsRecordDocumentEquality();

  @override
  bool equals(
      CountParticipatingEventsRecord? e1, CountParticipatingEventsRecord? e2) {
    return e1?.date == e2?.date &&
        e1?.name == e2?.name &&
        e1?.img == e2?.img &&
        e1?.participatingTimes == e2?.participatingTimes &&
        e1?.event == e2?.event &&
        e1?.type == e2?.type &&
        e1?.email == e2?.email;
  }

  @override
  int hash(CountParticipatingEventsRecord? e) => const ListEquality().hash([
        e?.date,
        e?.name,
        e?.img,
        e?.participatingTimes,
        e?.event,
        e?.type,
        e?.email
      ]);

  @override
  bool isValidKey(Object? o) => o is CountParticipatingEventsRecord;
}
