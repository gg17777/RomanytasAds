import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
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

  // "indirizzoLocaleText" field.
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

  // "locORorg" field.
  bool? _locORorg;
  bool get locORorg => _locORorg ?? false;
  bool hasLocORorg() => _locORorg != null;

  // "locOrOrg" field.
  String? _locOrOrg;
  String get locOrOrg => _locOrOrg ?? '';
  bool hasLocOrOrg() => _locOrOrg != null;

  // "createdDate" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "lastEvent" field.
  String? _lastEvent;
  String get lastEvent => _lastEvent ?? '';
  bool hasLastEvent() => _lastEvent != null;

  // "sync_contacts" field.
  bool? _syncContacts;
  bool get syncContacts => _syncContacts ?? false;
  bool hasSyncContacts() => _syncContacts != null;

  // "participatingCount" field.
  int? _participatingCount;
  int get participatingCount => _participatingCount ?? 0;
  bool hasParticipatingCount() => _participatingCount != null;

  // "blockedUsers" field.
  List<DocumentReference>? _blockedUsers;
  List<DocumentReference> get blockedUsers => _blockedUsers ?? const [];
  bool hasBlockedUsers() => _blockedUsers != null;

  // "listSyncedContacts" field.
  List<DocumentReference>? _listSyncedContacts;
  List<DocumentReference> get listSyncedContacts =>
      _listSyncedContacts ?? const [];
  bool hasListSyncedContacts() => _listSyncedContacts != null;

  // "notificationPopUp" field.
  bool? _notificationPopUp;
  bool get notificationPopUp => _notificationPopUp ?? false;
  bool hasNotificationPopUp() => _notificationPopUp != null;

  // "sex" field.
  String? _sex;
  String get sex => _sex ?? '';
  bool hasSex() => _sex != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "match_sex" field.
  String? _matchSex;
  String get matchSex => _matchSex ?? '';
  bool hasMatchSex() => _matchSex != null;

  // "match_age" field.
  int? _matchAge;
  int get matchAge => _matchAge ?? 0;
  bool hasMatchAge() => _matchAge != null;

  // "private_account" field.
  bool? _privateAccount;
  bool get privateAccount => _privateAccount ?? false;
  bool hasPrivateAccount() => _privateAccount != null;

  // "myBlocks" field.
  List<DocumentReference>? _myBlocks;
  List<DocumentReference> get myBlocks => _myBlocks ?? const [];
  bool hasMyBlocks() => _myBlocks != null;

  // "privacy_policy" field.
  bool? _privacyPolicy;
  bool get privacyPolicy => _privacyPolicy ?? false;
  bool hasPrivacyPolicy() => _privacyPolicy != null;

  // "survey_completed" field.
  bool? _surveyCompleted;
  bool get surveyCompleted => _surveyCompleted ?? false;
  bool hasSurveyCompleted() => _surveyCompleted != null;

  // "matches_notifications" field.
  bool? _matchesNotifications;
  bool get matchesNotifications => _matchesNotifications ?? false;
  bool hasMatchesNotifications() => _matchesNotifications != null;

  // "likes_notifications" field.
  bool? _likesNotifications;
  bool get likesNotifications => _likesNotifications ?? false;
  bool hasLikesNotifications() => _likesNotifications != null;

  // "friendsRequests_notifications" field.
  bool? _friendsRequestsNotifications;
  bool get friendsRequestsNotifications =>
      _friendsRequestsNotifications ?? false;
  bool hasFriendsRequestsNotifications() =>
      _friendsRequestsNotifications != null;

  // "feature_photo_AI" field.
  bool? _featurePhotoAI;
  bool get featurePhotoAI => _featurePhotoAI ?? false;
  bool hasFeaturePhotoAI() => _featurePhotoAI != null;

  // "bio_profile" field.
  String? _bioProfile;
  String get bioProfile => _bioProfile ?? '';
  bool hasBioProfile() => _bioProfile != null;

  // "uni" field.
  String? _uni;
  String get uni => _uni ?? '';
  bool hasUni() => _uni != null;

  // "friends" field.
  List<String>? _friends;
  List<String> get friends => _friends ?? const [];
  bool hasFriends() => _friends != null;

  // "background_profile" field.
  String? _backgroundProfile;
  String get backgroundProfile => _backgroundProfile ?? '';
  bool hasBackgroundProfile() => _backgroundProfile != null;

  // "didntLikeSuggestions" field.
  List<String>? _didntLikeSuggestions;
  List<String> get didntLikeSuggestions => _didntLikeSuggestions ?? const [];
  bool hasDidntLikeSuggestions() => _didntLikeSuggestions != null;

  // "uploaded" field.
  bool? _uploaded;
  bool get uploaded => _uploaded ?? false;
  bool hasUploaded() => _uploaded != null;

  // "image_underProfile1" field.
  String? _imageUnderProfile1;
  String get imageUnderProfile1 => _imageUnderProfile1 ?? '';
  bool hasImageUnderProfile1() => _imageUnderProfile1 != null;

  // "image_underProfile2" field.
  String? _imageUnderProfile2;
  String get imageUnderProfile2 => _imageUnderProfile2 ?? '';
  bool hasImageUnderProfile2() => _imageUnderProfile2 != null;

  // "image_underProfile3" field.
  String? _imageUnderProfile3;
  String get imageUnderProfile3 => _imageUnderProfile3 ?? '';
  bool hasImageUnderProfile3() => _imageUnderProfile3 != null;

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
    _appName = snapshotData['app_name'] as String?;
    _createdBy = snapshotData['createdBy'] as String?;
    _insta = snapshotData['insta'] as String?;
    _indirizzoLocaleText = snapshotData['indirizzoLocaleText'] as String?;
    _verificato = snapshotData['verificato'] as bool?;
    _imgLocale = snapshotData['imgLocale'] as String?;
    _locORorg = snapshotData['locORorg'] as bool?;
    _locOrOrg = snapshotData['locOrOrg'] as String?;
    _createdDate = snapshotData['createdDate'] as DateTime?;
    _lastEvent = snapshotData['lastEvent'] as String?;
    _syncContacts = snapshotData['sync_contacts'] as bool?;
    _participatingCount = castToType<int>(snapshotData['participatingCount']);
    _blockedUsers = getDataList(snapshotData['blockedUsers']);
    _listSyncedContacts = getDataList(snapshotData['listSyncedContacts']);
    _notificationPopUp = snapshotData['notificationPopUp'] as bool?;
    _sex = snapshotData['sex'] as String?;
    _age = castToType<int>(snapshotData['age']);
    _matchSex = snapshotData['match_sex'] as String?;
    _matchAge = castToType<int>(snapshotData['match_age']);
    _privateAccount = snapshotData['private_account'] as bool?;
    _myBlocks = getDataList(snapshotData['myBlocks']);
    _privacyPolicy = snapshotData['privacy_policy'] as bool?;
    _surveyCompleted = snapshotData['survey_completed'] as bool?;
    _matchesNotifications = snapshotData['matches_notifications'] as bool?;
    _likesNotifications = snapshotData['likes_notifications'] as bool?;
    _friendsRequestsNotifications =
        snapshotData['friendsRequests_notifications'] as bool?;
    _featurePhotoAI = snapshotData['feature_photo_AI'] as bool?;
    _bioProfile = snapshotData['bio_profile'] as String?;
    _uni = snapshotData['uni'] as String?;
    _friends = getDataList(snapshotData['friends']);
    _backgroundProfile = snapshotData['background_profile'] as String?;
    _didntLikeSuggestions = getDataList(snapshotData['didntLikeSuggestions']);
    _uploaded = snapshotData['uploaded'] as bool?;
    _imageUnderProfile1 = snapshotData['image_underProfile1'] as String?;
    _imageUnderProfile2 = snapshotData['image_underProfile2'] as String?;
    _imageUnderProfile3 = snapshotData['image_underProfile3'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

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

  static UsersRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      UsersRecord.getDocumentFromData(
        {
          'Nome': snapshot.data['Nome'],
          'Cognome': snapshot.data['Cognome'],
          'Password': snapshot.data['Password'],
          'email': snapshot.data['email'],
          'display_name': snapshot.data['display_name'],
          'photo_url': snapshot.data['photo_url'],
          'uid': snapshot.data['uid'],
          'created_time': convertAlgoliaParam(
            snapshot.data['created_time'],
            ParamType.DateTime,
            false,
          ),
          'phone_number': snapshot.data['phone_number'],
          'Notifications': snapshot.data['Notifications'],
          'Marketing': snapshot.data['Marketing'],
          'Manager': snapshot.data['Manager'],
          'nomeLocale': snapshot.data['nomeLocale'],
          'indirizzoLocale': convertAlgoliaParam(
            snapshot.data,
            ParamType.LatLng,
            false,
          ),
          'urlMaps': snapshot.data['urlMaps'],
          'Localita': snapshot.data['Localita'],
          'app_name': snapshot.data['app_name'],
          'createdBy': snapshot.data['createdBy'],
          'insta': snapshot.data['insta'],
          'indirizzoLocaleText': snapshot.data['indirizzoLocaleText'],
          'verificato': snapshot.data['verificato'],
          'imgLocale': snapshot.data['imgLocale'],
          'locORorg': snapshot.data['locORorg'],
          'locOrOrg': snapshot.data['locOrOrg'],
          'createdDate': convertAlgoliaParam(
            snapshot.data['createdDate'],
            ParamType.DateTime,
            false,
          ),
          'lastEvent': snapshot.data['lastEvent'],
          'sync_contacts': snapshot.data['sync_contacts'],
          'participatingCount': convertAlgoliaParam(
            snapshot.data['participatingCount'],
            ParamType.int,
            false,
          ),
          'blockedUsers': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['blockedUsers'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'listSyncedContacts': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['listSyncedContacts'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'notificationPopUp': snapshot.data['notificationPopUp'],
          'sex': snapshot.data['sex'],
          'age': convertAlgoliaParam(
            snapshot.data['age'],
            ParamType.int,
            false,
          ),
          'match_sex': snapshot.data['match_sex'],
          'match_age': convertAlgoliaParam(
            snapshot.data['match_age'],
            ParamType.int,
            false,
          ),
          'private_account': snapshot.data['private_account'],
          'myBlocks': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['myBlocks'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'privacy_policy': snapshot.data['privacy_policy'],
          'survey_completed': snapshot.data['survey_completed'],
          'matches_notifications': snapshot.data['matches_notifications'],
          'likes_notifications': snapshot.data['likes_notifications'],
          'friendsRequests_notifications':
              snapshot.data['friendsRequests_notifications'],
          'feature_photo_AI': snapshot.data['feature_photo_AI'],
          'bio_profile': snapshot.data['bio_profile'],
          'uni': snapshot.data['uni'],
          'friends': safeGet(
            () => snapshot.data['friends'].toList(),
          ),
          'background_profile': snapshot.data['background_profile'],
          'didntLikeSuggestions': safeGet(
            () => snapshot.data['didntLikeSuggestions'].toList(),
          ),
          'uploaded': snapshot.data['uploaded'],
          'image_underProfile1': snapshot.data['image_underProfile1'],
          'image_underProfile2': snapshot.data['image_underProfile2'],
          'image_underProfile3': snapshot.data['image_underProfile3'],
        },
        UsersRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<UsersRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'users',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

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
  String? appName,
  String? createdBy,
  String? insta,
  String? indirizzoLocaleText,
  bool? verificato,
  String? imgLocale,
  bool? locORorg,
  String? locOrOrg,
  DateTime? createdDate,
  String? lastEvent,
  bool? syncContacts,
  int? participatingCount,
  bool? notificationPopUp,
  String? sex,
  int? age,
  String? matchSex,
  int? matchAge,
  bool? privateAccount,
  bool? privacyPolicy,
  bool? surveyCompleted,
  bool? matchesNotifications,
  bool? likesNotifications,
  bool? friendsRequestsNotifications,
  bool? featurePhotoAI,
  String? bioProfile,
  String? uni,
  String? backgroundProfile,
  bool? uploaded,
  String? imageUnderProfile1,
  String? imageUnderProfile2,
  String? imageUnderProfile3,
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
      'app_name': appName,
      'createdBy': createdBy,
      'insta': insta,
      'indirizzoLocaleText': indirizzoLocaleText,
      'verificato': verificato,
      'imgLocale': imgLocale,
      'locORorg': locORorg,
      'locOrOrg': locOrOrg,
      'createdDate': createdDate,
      'lastEvent': lastEvent,
      'sync_contacts': syncContacts,
      'participatingCount': participatingCount,
      'notificationPopUp': notificationPopUp,
      'sex': sex,
      'age': age,
      'match_sex': matchSex,
      'match_age': matchAge,
      'private_account': privateAccount,
      'privacy_policy': privacyPolicy,
      'survey_completed': surveyCompleted,
      'matches_notifications': matchesNotifications,
      'likes_notifications': likesNotifications,
      'friendsRequests_notifications': friendsRequestsNotifications,
      'feature_photo_AI': featurePhotoAI,
      'bio_profile': bioProfile,
      'uni': uni,
      'background_profile': backgroundProfile,
      'uploaded': uploaded,
      'image_underProfile1': imageUnderProfile1,
      'image_underProfile2': imageUnderProfile2,
      'image_underProfile3': imageUnderProfile3,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
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
        e1?.appName == e2?.appName &&
        e1?.createdBy == e2?.createdBy &&
        e1?.insta == e2?.insta &&
        e1?.indirizzoLocaleText == e2?.indirizzoLocaleText &&
        e1?.verificato == e2?.verificato &&
        e1?.imgLocale == e2?.imgLocale &&
        e1?.locORorg == e2?.locORorg &&
        e1?.locOrOrg == e2?.locOrOrg &&
        e1?.createdDate == e2?.createdDate &&
        e1?.lastEvent == e2?.lastEvent &&
        e1?.syncContacts == e2?.syncContacts &&
        e1?.participatingCount == e2?.participatingCount &&
        listEquality.equals(e1?.blockedUsers, e2?.blockedUsers) &&
        listEquality.equals(e1?.listSyncedContacts, e2?.listSyncedContacts) &&
        e1?.notificationPopUp == e2?.notificationPopUp &&
        e1?.sex == e2?.sex &&
        e1?.age == e2?.age &&
        e1?.matchSex == e2?.matchSex &&
        e1?.matchAge == e2?.matchAge &&
        e1?.privateAccount == e2?.privateAccount &&
        listEquality.equals(e1?.myBlocks, e2?.myBlocks) &&
        e1?.privacyPolicy == e2?.privacyPolicy &&
        e1?.surveyCompleted == e2?.surveyCompleted &&
        e1?.matchesNotifications == e2?.matchesNotifications &&
        e1?.likesNotifications == e2?.likesNotifications &&
        e1?.friendsRequestsNotifications == e2?.friendsRequestsNotifications &&
        e1?.featurePhotoAI == e2?.featurePhotoAI &&
        e1?.bioProfile == e2?.bioProfile &&
        e1?.uni == e2?.uni &&
        listEquality.equals(e1?.friends, e2?.friends) &&
        e1?.backgroundProfile == e2?.backgroundProfile &&
        listEquality.equals(
            e1?.didntLikeSuggestions, e2?.didntLikeSuggestions) &&
        e1?.uploaded == e2?.uploaded &&
        e1?.imageUnderProfile1 == e2?.imageUnderProfile1 &&
        e1?.imageUnderProfile2 == e2?.imageUnderProfile2 &&
        e1?.imageUnderProfile3 == e2?.imageUnderProfile3;
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
        e?.appName,
        e?.createdBy,
        e?.insta,
        e?.indirizzoLocaleText,
        e?.verificato,
        e?.imgLocale,
        e?.locORorg,
        e?.locOrOrg,
        e?.createdDate,
        e?.lastEvent,
        e?.syncContacts,
        e?.participatingCount,
        e?.blockedUsers,
        e?.listSyncedContacts,
        e?.notificationPopUp,
        e?.sex,
        e?.age,
        e?.matchSex,
        e?.matchAge,
        e?.privateAccount,
        e?.myBlocks,
        e?.privacyPolicy,
        e?.surveyCompleted,
        e?.matchesNotifications,
        e?.likesNotifications,
        e?.friendsRequestsNotifications,
        e?.featurePhotoAI,
        e?.bioProfile,
        e?.uni,
        e?.friends,
        e?.backgroundProfile,
        e?.didntLikeSuggestions,
        e?.uploaded,
        e?.imageUnderProfile1,
        e?.imageUnderProfile2,
        e?.imageUnderProfile3
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
