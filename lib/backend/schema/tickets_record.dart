import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TicketsRecord extends FirestoreRecord {
  TicketsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "user_email" field.
  String? _userEmail;
  String get userEmail => _userEmail ?? '';
  bool hasUserEmail() => _userEmail != null;

  // "user_sex" field.
  String? _userSex;
  String get userSex => _userSex ?? '';
  bool hasUserSex() => _userSex != null;

  // "scanned" field.
  bool? _scanned;
  bool get scanned => _scanned ?? false;
  bool hasScanned() => _scanned != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "peopleXticket" field.
  int? _peopleXticket;
  int get peopleXticket => _peopleXticket ?? 0;
  bool hasPeopleXticket() => _peopleXticket != null;

  // "event_date" field.
  DateTime? _eventDate;
  DateTime? get eventDate => _eventDate;
  bool hasEventDate() => _eventDate != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _price = castToType<double>(snapshotData['price']);
    _userName = snapshotData['user_name'] as String?;
    _userEmail = snapshotData['user_email'] as String?;
    _userSex = snapshotData['user_sex'] as String?;
    _scanned = snapshotData['scanned'] as bool?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _peopleXticket = castToType<int>(snapshotData['peopleXticket']);
    _eventDate = snapshotData['event_date'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('tickets')
          : FirebaseFirestore.instance.collectionGroup('tickets');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('tickets').doc(id);

  static Stream<TicketsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TicketsRecord.fromSnapshot(s));

  static Future<TicketsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TicketsRecord.fromSnapshot(s));

  static TicketsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TicketsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TicketsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TicketsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TicketsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TicketsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTicketsRecordData({
  DateTime? createdTime,
  double? price,
  String? userName,
  String? userEmail,
  String? userSex,
  bool? scanned,
  DocumentReference? userRef,
  int? peopleXticket,
  DateTime? eventDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'price': price,
      'user_name': userName,
      'user_email': userEmail,
      'user_sex': userSex,
      'scanned': scanned,
      'userRef': userRef,
      'peopleXticket': peopleXticket,
      'event_date': eventDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class TicketsRecordDocumentEquality implements Equality<TicketsRecord> {
  const TicketsRecordDocumentEquality();

  @override
  bool equals(TicketsRecord? e1, TicketsRecord? e2) {
    return e1?.createdTime == e2?.createdTime &&
        e1?.price == e2?.price &&
        e1?.userName == e2?.userName &&
        e1?.userEmail == e2?.userEmail &&
        e1?.userSex == e2?.userSex &&
        e1?.scanned == e2?.scanned &&
        e1?.userRef == e2?.userRef &&
        e1?.peopleXticket == e2?.peopleXticket &&
        e1?.eventDate == e2?.eventDate;
  }

  @override
  int hash(TicketsRecord? e) => const ListEquality().hash([
        e?.createdTime,
        e?.price,
        e?.userName,
        e?.userEmail,
        e?.userSex,
        e?.scanned,
        e?.userRef,
        e?.peopleXticket,
        e?.eventDate
      ]);

  @override
  bool isValidKey(Object? o) => o is TicketsRecord;
}
