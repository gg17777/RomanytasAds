import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "Cognome" field.
  String? _cognome;
  String get cognome => _cognome ?? '';
  bool hasCognome() => _cognome != null;

  // "Password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "Notifications" field.
  bool? _notifications;
  bool get notifications => _notifications ?? false;
  bool hasNotifications() => _notifications != null;

  // "Marketing" field.
  bool? _marketing;
  bool get marketing => _marketing ?? false;
  bool hasMarketing() => _marketing != null;

  // "Manager" field.
  bool? _manager;
  bool get manager => _manager ?? false;
  bool hasManager() => _manager != null;

  // "nomeLocale" field.
  String? _nomeLocale;
  String get nomeLocale => _nomeLocale ?? '';
  bool hasNomeLocale() => _nomeLocale != null;

  // "indirizzoLocale" field.
  LatLng? _indirizzoLocale;
  LatLng? get indirizzoLocale => _indirizzoLocale;
  bool hasIndirizzoLocale() => _indirizzoLocale != null;

  // "urlMaps" field.
  String? _urlMaps;
  String get urlMaps => _urlMaps ?? '';
  bool hasUrlMaps() => _urlMaps != null;

  // "Localita" field.
  String? _localita;
  String get localita => _localita ?? '';
  bool hasLocalita() => _localita != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "locORorg" field.
  bool? _locORorg;
  bool get locORorg => _locORorg ?? false;
  bool hasLocORorg() => _locORorg != null;

  // "app_name" field.
  String? _appName;
  String get appName => _appName ?? '';
  bool hasAppName() => _appName != null;

  // "createdBy" field.
  String? _createdBy;
  String get createdBy => _createdBy ?? '';
  bool hasCreatedBy() => _createdBy != null;

  // "insta" field.
  String? _insta;
  String get insta => _insta ?? '';
  bool hasInsta() => _insta != null;

  // "IndirizzoLocaleText" field.
  String? _indirizzoLocaleText;
  String get indirizzoLocaleText => _indirizzoLocaleText ?? '';
  bool hasIndirizzoLocaleText() => _indirizzoLocaleText != null;

  // "verificato" field.
  bool? _verificato;
  bool get verificato => _verificato ?? false;
  bool hasVerificato() => _verificato != null;

  // "imgLocale" field.
  String? _imgLocale;
  String get imgLocale => _imgLocale ?? '';
  bool hasImgLocale() => _imgLocale != null;

  // "locOrOrg" field.
  String? _locOrOrg;
  String get locOrOrg => _locOrOrg ?? '';
  bool hasLocOrOrg() => _locOrOrg != null;

  // "createDate" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  void _initializeFields() {
    _nome = snapshotData['Nome'] as String?;
    _cognome = snapshotData['Cognome'] as String?;
    _password = snapshotData['Password'] as String?;
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _notifications = snapshotData['Notifications'] as bool?;
    _marketing = snapshotData['Marketing'] as bool?;
    _manager = snapshotData['Manager'] as bool?;
    _nomeLocale = snapshotData['nomeLocale'] as String?;
    _indirizzoLocale = snapshotData['indirizzoLocale'] as LatLng?;
    _urlMaps = snapshotData['urlMaps'] as String?;
    _localita = snapshotData['Localita'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _locORorg = snapshotData['locORorg'] as bool?;
    _appName = snapshotData['app_name'] as String?;
    _createdBy = snapshotData['createdBy'] as String?;
    _insta = snapshotData['insta'] as String?;
    _indirizzoLocaleText = snapshotData['IndirizzoLocaleText'] as String?;
    _verificato = snapshotData['verificato'] as bool?;
    _imgLocale = snapshotData['imgLocale'] as String?;
    _locOrOrg = snapshotData['locOrOrg'] as String?;
    _createDate = snapshotData['createDate'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? nome,
  String? cognome,
  String? password,
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  bool? notifications,
  bool? marketing,
  bool? manager,
  String? nomeLocale,
  LatLng? indirizzoLocale,
  String? urlMaps,
  String? localita,
  DocumentReference? userRef,
  bool? locORorg,
  String? appName,
  String? createdBy,
  String? insta,
  String? indirizzoLocaleText,
  bool? verificato,
  String? imgLocale,
  String? locOrOrg,
  DateTime? createDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Nome': nome,
      'Cognome': cognome,
      'Password': password,
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'Notifications': notifications,
      'Marketing': marketing,
      'Manager': manager,
      'nomeLocale': nomeLocale,
      'indirizzoLocale': indirizzoLocale,
      'urlMaps': urlMaps,
      'Localita': localita,
      'userRef': userRef,
      'locORorg': locORorg,
      'app_name': appName,
      'createdBy': createdBy,
      'insta': insta,
      'IndirizzoLocaleText': indirizzoLocaleText,
      'verificato': verificato,
      'imgLocale': imgLocale,
      'locOrOrg': locOrOrg,
      'createDate': createDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.nome == e2?.nome &&
        e1?.cognome == e2?.cognome &&
        e1?.password == e2?.password &&
        e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.notifications == e2?.notifications &&
        e1?.marketing == e2?.marketing &&
        e1?.manager == e2?.manager &&
        e1?.nomeLocale == e2?.nomeLocale &&
        e1?.indirizzoLocale == e2?.indirizzoLocale &&
        e1?.urlMaps == e2?.urlMaps &&
        e1?.localita == e2?.localita &&
        e1?.userRef == e2?.userRef &&
        e1?.locORorg == e2?.locORorg &&
        e1?.appName == e2?.appName &&
        e1?.createdBy == e2?.createdBy &&
        e1?.insta == e2?.insta &&
        e1?.indirizzoLocaleText == e2?.indirizzoLocaleText &&
        e1?.verificato == e2?.verificato &&
        e1?.imgLocale == e2?.imgLocale &&
        e1?.locOrOrg == e2?.locOrOrg &&
        e1?.createDate == e2?.createDate;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.nome,
        e?.cognome,
        e?.password,
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.notifications,
        e?.marketing,
        e?.manager,
        e?.nomeLocale,
        e?.indirizzoLocale,
        e?.urlMaps,
        e?.localita,
        e?.userRef,
        e?.locORorg,
        e?.appName,
        e?.createdBy,
        e?.insta,
        e?.indirizzoLocaleText,
        e?.verificato,
        e?.imgLocale,
        e?.locOrOrg,
        e?.createDate
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
