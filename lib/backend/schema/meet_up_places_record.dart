import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MeetUpPlacesRecord extends FirestoreRecord {
  MeetUpPlacesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  bool hasImg() => _img != null;

  // "blinkEvent" field.
  bool? _blinkEvent;
  bool get blinkEvent => _blinkEvent ?? false;
  bool hasBlinkEvent() => _blinkEvent != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _location = snapshotData['location'] as LatLng?;
    _img = snapshotData['img'] as String?;
    _blinkEvent = snapshotData['blinkEvent'] as bool?;
    _city = snapshotData['city'] as String?;
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('MeetUpPlaces');

  static Stream<MeetUpPlacesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MeetUpPlacesRecord.fromSnapshot(s));

  static Future<MeetUpPlacesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MeetUpPlacesRecord.fromSnapshot(s));

  static MeetUpPlacesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MeetUpPlacesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MeetUpPlacesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MeetUpPlacesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MeetUpPlacesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MeetUpPlacesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMeetUpPlacesRecordData({
  LatLng? location,
  String? img,
  bool? blinkEvent,
  String? city,
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'location': location,
      'img': img,
      'blinkEvent': blinkEvent,
      'city': city,
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class MeetUpPlacesRecordDocumentEquality
    implements Equality<MeetUpPlacesRecord> {
  const MeetUpPlacesRecordDocumentEquality();

  @override
  bool equals(MeetUpPlacesRecord? e1, MeetUpPlacesRecord? e2) {
    return e1?.location == e2?.location &&
        e1?.img == e2?.img &&
        e1?.blinkEvent == e2?.blinkEvent &&
        e1?.city == e2?.city &&
        e1?.name == e2?.name;
  }

  @override
  int hash(MeetUpPlacesRecord? e) => const ListEquality()
      .hash([e?.location, e?.img, e?.blinkEvent, e?.city, e?.name]);

  @override
  bool isValidKey(Object? o) => o is MeetUpPlacesRecord;
}
