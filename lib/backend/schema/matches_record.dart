import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MatchesRecord extends FirestoreRecord {
  MatchesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "users" field.
  List<DocumentReference>? _users;
  List<DocumentReference> get users => _users ?? const [];
  bool hasUsers() => _users != null;

  // "eventID" field.
  String? _eventID;
  String get eventID => _eventID ?? '';
  bool hasEventID() => _eventID != null;

  // "eventName" field.
  String? _eventName;
  String get eventName => _eventName ?? '';
  bool hasEventName() => _eventName != null;

  // "eventEndTime" field.
  DateTime? _eventEndTime;
  DateTime? get eventEndTime => _eventEndTime;
  bool hasEventEndTime() => _eventEndTime != null;

  // "i_am_here_feature" field.
  List<DocumentReference>? _iAmHereFeature;
  List<DocumentReference> get iAmHereFeature => _iAmHereFeature ?? const [];
  bool hasIAmHereFeature() => _iAmHereFeature != null;

  // "viewedBy" field.
  List<DocumentReference>? _viewedBy;
  List<DocumentReference> get viewedBy => _viewedBy ?? const [];
  bool hasViewedBy() => _viewedBy != null;

  void _initializeFields() {
    _users = getDataList(snapshotData['users']);
    _eventID = snapshotData['eventID'] as String?;
    _eventName = snapshotData['eventName'] as String?;
    _eventEndTime = snapshotData['eventEndTime'] as DateTime?;
    _iAmHereFeature = getDataList(snapshotData['i_am_here_feature']);
    _viewedBy = getDataList(snapshotData['viewedBy']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('matches');

  static Stream<MatchesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MatchesRecord.fromSnapshot(s));

  static Future<MatchesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MatchesRecord.fromSnapshot(s));

  static MatchesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MatchesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MatchesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MatchesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MatchesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MatchesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMatchesRecordData({
  String? eventID,
  String? eventName,
  DateTime? eventEndTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'eventID': eventID,
      'eventName': eventName,
      'eventEndTime': eventEndTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class MatchesRecordDocumentEquality implements Equality<MatchesRecord> {
  const MatchesRecordDocumentEquality();

  @override
  bool equals(MatchesRecord? e1, MatchesRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.users, e2?.users) &&
        e1?.eventID == e2?.eventID &&
        e1?.eventName == e2?.eventName &&
        e1?.eventEndTime == e2?.eventEndTime &&
        listEquality.equals(e1?.iAmHereFeature, e2?.iAmHereFeature) &&
        listEquality.equals(e1?.viewedBy, e2?.viewedBy);
  }

  @override
  int hash(MatchesRecord? e) => const ListEquality().hash([
        e?.users,
        e?.eventID,
        e?.eventName,
        e?.eventEndTime,
        e?.iAmHereFeature,
        e?.viewedBy
      ]);

  @override
  bool isValidKey(Object? o) => o is MatchesRecord;
}
