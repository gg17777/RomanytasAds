import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventiParticiaptingRecord extends FirestoreRecord {
  EventiParticiaptingRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userParticipatingEventRef" field.
  DocumentReference? _userParticipatingEventRef;
  DocumentReference? get userParticipatingEventRef =>
      _userParticipatingEventRef;
  bool hasUserParticipatingEventRef() => _userParticipatingEventRef != null;

  // "sex" field.
  String? _sex;
  String get sex => _sex ?? '';
  bool hasSex() => _sex != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "private_account" field.
  bool? _privateAccount;
  bool get privateAccount => _privateAccount ?? false;
  bool hasPrivateAccount() => _privateAccount != null;

  // "match_sex" field.
  String? _matchSex;
  String get matchSex => _matchSex ?? '';
  bool hasMatchSex() => _matchSex != null;

  // "no_swiping" field.
  bool? _noSwiping;
  bool get noSwiping => _noSwiping ?? false;
  bool hasNoSwiping() => _noSwiping != null;

  // "matches_notifications" field.
  bool? _matchesNotifications;
  bool get matchesNotifications => _matchesNotifications ?? false;
  bool hasMatchesNotifications() => _matchesNotifications != null;

  // "likes_notifications" field.
  bool? _likesNotifications;
  bool get likesNotifications => _likesNotifications ?? false;
  bool hasLikesNotifications() => _likesNotifications != null;

  // "eventID" field.
  DocumentReference? _eventID;
  DocumentReference? get eventID => _eventID;
  bool hasEventID() => _eventID != null;

  // "event_date" field.
  DateTime? _eventDate;
  DateTime? get eventDate => _eventDate;
  bool hasEventDate() => _eventDate != null;

  // "feature_photo_ai" field.
  bool? _featurePhotoAi;
  bool get featurePhotoAi => _featurePhotoAi ?? false;
  bool hasFeaturePhotoAi() => _featurePhotoAi != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "inApp" field.
  bool? _inApp;
  bool get inApp => _inApp ?? false;
  bool hasInApp() => _inApp != null;

  // "countXuser" field.
  int? _countXuser;
  int get countXuser => _countXuser ?? 0;
  bool hasCountXuser() => _countXuser != null;

  // "event_name" field.
  String? _eventName;
  String get eventName => _eventName ?? '';
  bool hasEventName() => _eventName != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "user_email" field.
  String? _userEmail;
  String get userEmail => _userEmail ?? '';
  bool hasUserEmail() => _userEmail != null;

  // "uploaded" field.
  bool? _uploaded;
  bool get uploaded => _uploaded ?? false;
  bool hasUploaded() => _uploaded != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userParticipatingEventRef =
        snapshotData['userParticipatingEventRef'] as DocumentReference?;
    _sex = snapshotData['sex'] as String?;
    _age = castToType<int>(snapshotData['age']);
    _privateAccount = snapshotData['private_account'] as bool?;
    _matchSex = snapshotData['match_sex'] as String?;
    _noSwiping = snapshotData['no_swiping'] as bool?;
    _matchesNotifications = snapshotData['matches_notifications'] as bool?;
    _likesNotifications = snapshotData['likes_notifications'] as bool?;
    _eventID = snapshotData['eventID'] as DocumentReference?;
    _eventDate = snapshotData['event_date'] as DateTime?;
    _featurePhotoAi = snapshotData['feature_photo_ai'] as bool?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _inApp = snapshotData['inApp'] as bool?;
    _countXuser = castToType<int>(snapshotData['countXuser']);
    _eventName = snapshotData['event_name'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _userName = snapshotData['user_name'] as String?;
    _userEmail = snapshotData['user_email'] as String?;
    _uploaded = snapshotData['uploaded'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('eventiParticiapting')
          : FirebaseFirestore.instance.collectionGroup('eventiParticiapting');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('eventiParticiapting').doc(id);

  static Stream<EventiParticiaptingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventiParticiaptingRecord.fromSnapshot(s));

  static Future<EventiParticiaptingRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => EventiParticiaptingRecord.fromSnapshot(s));

  static EventiParticiaptingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EventiParticiaptingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventiParticiaptingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventiParticiaptingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventiParticiaptingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventiParticiaptingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventiParticiaptingRecordData({
  DocumentReference? userParticipatingEventRef,
  String? sex,
  int? age,
  bool? privateAccount,
  String? matchSex,
  bool? noSwiping,
  bool? matchesNotifications,
  bool? likesNotifications,
  DocumentReference? eventID,
  DateTime? eventDate,
  bool? featurePhotoAi,
  String? photoUrl,
  bool? inApp,
  int? countXuser,
  String? eventName,
  DateTime? createdTime,
  String? userName,
  String? userEmail,
  bool? uploaded,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userParticipatingEventRef': userParticipatingEventRef,
      'sex': sex,
      'age': age,
      'private_account': privateAccount,
      'match_sex': matchSex,
      'no_swiping': noSwiping,
      'matches_notifications': matchesNotifications,
      'likes_notifications': likesNotifications,
      'eventID': eventID,
      'event_date': eventDate,
      'feature_photo_ai': featurePhotoAi,
      'photo_url': photoUrl,
      'inApp': inApp,
      'countXuser': countXuser,
      'event_name': eventName,
      'created_time': createdTime,
      'user_name': userName,
      'user_email': userEmail,
      'uploaded': uploaded,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventiParticiaptingRecordDocumentEquality
    implements Equality<EventiParticiaptingRecord> {
  const EventiParticiaptingRecordDocumentEquality();

  @override
  bool equals(EventiParticiaptingRecord? e1, EventiParticiaptingRecord? e2) {
    return e1?.userParticipatingEventRef == e2?.userParticipatingEventRef &&
        e1?.sex == e2?.sex &&
        e1?.age == e2?.age &&
        e1?.privateAccount == e2?.privateAccount &&
        e1?.matchSex == e2?.matchSex &&
        e1?.noSwiping == e2?.noSwiping &&
        e1?.matchesNotifications == e2?.matchesNotifications &&
        e1?.likesNotifications == e2?.likesNotifications &&
        e1?.eventID == e2?.eventID &&
        e1?.eventDate == e2?.eventDate &&
        e1?.featurePhotoAi == e2?.featurePhotoAi &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.inApp == e2?.inApp &&
        e1?.countXuser == e2?.countXuser &&
        e1?.eventName == e2?.eventName &&
        e1?.createdTime == e2?.createdTime &&
        e1?.userName == e2?.userName &&
        e1?.userEmail == e2?.userEmail &&
        e1?.uploaded == e2?.uploaded;
  }

  @override
  int hash(EventiParticiaptingRecord? e) => const ListEquality().hash([
        e?.userParticipatingEventRef,
        e?.sex,
        e?.age,
        e?.privateAccount,
        e?.matchSex,
        e?.noSwiping,
        e?.matchesNotifications,
        e?.likesNotifications,
        e?.eventID,
        e?.eventDate,
        e?.featurePhotoAi,
        e?.photoUrl,
        e?.inApp,
        e?.countXuser,
        e?.eventName,
        e?.createdTime,
        e?.userName,
        e?.userEmail,
        e?.uploaded
      ]);

  @override
  bool isValidKey(Object? o) => o is EventiParticiaptingRecord;
}
