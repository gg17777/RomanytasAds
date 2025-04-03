// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SwipeStruct extends FFFirebaseStruct {
  SwipeStruct({
    DocumentReference? userRef,
    bool? isAd,
    String? adLink,
    String? adImage,
    String? adVideo,
    String? sex,
    int? age,
    String? matchSex,
    bool? privateAccount,
    bool? noSwiping,
    DocumentReference? adRef,
    String? headline,
    String? primaryText,
    int? clicks,
    int? views,
    List<String>? city,
    bool? matchesNotifications,
    bool? likesNotifications,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userRef = userRef,
        _isAd = isAd,
        _adLink = adLink,
        _adImage = adImage,
        _adVideo = adVideo,
        _sex = sex,
        _age = age,
        _matchSex = matchSex,
        _privateAccount = privateAccount,
        _noSwiping = noSwiping,
        _adRef = adRef,
        _headline = headline,
        _primaryText = primaryText,
        _clicks = clicks,
        _views = views,
        _city = city,
        _matchesNotifications = matchesNotifications,
        _likesNotifications = likesNotifications,
        super(firestoreUtilData);

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  set userRef(DocumentReference? val) => _userRef = val;

  bool hasUserRef() => _userRef != null;

  // "isAd" field.
  bool? _isAd;
  bool get isAd => _isAd ?? false;
  set isAd(bool? val) => _isAd = val;

  bool hasIsAd() => _isAd != null;

  // "adLink" field.
  String? _adLink;
  String get adLink => _adLink ?? '';
  set adLink(String? val) => _adLink = val;

  bool hasAdLink() => _adLink != null;

  // "adImage" field.
  String? _adImage;
  String get adImage => _adImage ?? '';
  set adImage(String? val) => _adImage = val;

  bool hasAdImage() => _adImage != null;

  // "adVideo" field.
  String? _adVideo;
  String get adVideo => _adVideo ?? '';
  set adVideo(String? val) => _adVideo = val;

  bool hasAdVideo() => _adVideo != null;

  // "sex" field.
  String? _sex;
  String get sex => _sex ?? '';
  set sex(String? val) => _sex = val;

  bool hasSex() => _sex != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  set age(int? val) => _age = val;

  void incrementAge(int amount) => age = age + amount;

  bool hasAge() => _age != null;

  // "matchSex" field.
  String? _matchSex;
  String get matchSex => _matchSex ?? '';
  set matchSex(String? val) => _matchSex = val;

  bool hasMatchSex() => _matchSex != null;

  // "privateAccount" field.
  bool? _privateAccount;
  bool get privateAccount => _privateAccount ?? false;
  set privateAccount(bool? val) => _privateAccount = val;

  bool hasPrivateAccount() => _privateAccount != null;

  // "noSwiping" field.
  bool? _noSwiping;
  bool get noSwiping => _noSwiping ?? false;
  set noSwiping(bool? val) => _noSwiping = val;

  bool hasNoSwiping() => _noSwiping != null;

  // "adRef" field.
  DocumentReference? _adRef;
  DocumentReference? get adRef => _adRef;
  set adRef(DocumentReference? val) => _adRef = val;

  bool hasAdRef() => _adRef != null;

  // "headline" field.
  String? _headline;
  String get headline => _headline ?? '';
  set headline(String? val) => _headline = val;

  bool hasHeadline() => _headline != null;

  // "primary_text" field.
  String? _primaryText;
  String get primaryText => _primaryText ?? '';
  set primaryText(String? val) => _primaryText = val;

  bool hasPrimaryText() => _primaryText != null;

  // "clicks" field.
  int? _clicks;
  int get clicks => _clicks ?? 0;
  set clicks(int? val) => _clicks = val;

  void incrementClicks(int amount) => clicks = clicks + amount;

  bool hasClicks() => _clicks != null;

  // "views" field.
  int? _views;
  int get views => _views ?? 0;
  set views(int? val) => _views = val;

  void incrementViews(int amount) => views = views + amount;

  bool hasViews() => _views != null;

  // "city" field.
  List<String>? _city;
  List<String> get city => _city ?? const [];
  set city(List<String>? val) => _city = val;

  void updateCity(Function(List<String>) updateFn) {
    updateFn(_city ??= []);
  }

  bool hasCity() => _city != null;

  // "matches_notifications" field.
  bool? _matchesNotifications;
  bool get matchesNotifications => _matchesNotifications ?? false;
  set matchesNotifications(bool? val) => _matchesNotifications = val;

  bool hasMatchesNotifications() => _matchesNotifications != null;

  // "likes_notifications" field.
  bool? _likesNotifications;
  bool get likesNotifications => _likesNotifications ?? false;
  set likesNotifications(bool? val) => _likesNotifications = val;

  bool hasLikesNotifications() => _likesNotifications != null;

  static SwipeStruct fromMap(Map<String, dynamic> data) => SwipeStruct(
        userRef: data['userRef'] as DocumentReference?,
        isAd: data['isAd'] as bool?,
        adLink: data['adLink'] as String?,
        adImage: data['adImage'] as String?,
        adVideo: data['adVideo'] as String?,
        sex: data['sex'] as String?,
        age: castToType<int>(data['age']),
        matchSex: data['matchSex'] as String?,
        privateAccount: data['privateAccount'] as bool?,
        noSwiping: data['noSwiping'] as bool?,
        adRef: data['adRef'] as DocumentReference?,
        headline: data['headline'] as String?,
        primaryText: data['primary_text'] as String?,
        clicks: castToType<int>(data['clicks']),
        views: castToType<int>(data['views']),
        city: getDataList(data['city']),
        matchesNotifications: data['matches_notifications'] as bool?,
        likesNotifications: data['likes_notifications'] as bool?,
      );

  static SwipeStruct? maybeFromMap(dynamic data) =>
      data is Map ? SwipeStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'userRef': _userRef,
        'isAd': _isAd,
        'adLink': _adLink,
        'adImage': _adImage,
        'adVideo': _adVideo,
        'sex': _sex,
        'age': _age,
        'matchSex': _matchSex,
        'privateAccount': _privateAccount,
        'noSwiping': _noSwiping,
        'adRef': _adRef,
        'headline': _headline,
        'primary_text': _primaryText,
        'clicks': _clicks,
        'views': _views,
        'city': _city,
        'matches_notifications': _matchesNotifications,
        'likes_notifications': _likesNotifications,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'userRef': serializeParam(
          _userRef,
          ParamType.DocumentReference,
        ),
        'isAd': serializeParam(
          _isAd,
          ParamType.bool,
        ),
        'adLink': serializeParam(
          _adLink,
          ParamType.String,
        ),
        'adImage': serializeParam(
          _adImage,
          ParamType.String,
        ),
        'adVideo': serializeParam(
          _adVideo,
          ParamType.String,
        ),
        'sex': serializeParam(
          _sex,
          ParamType.String,
        ),
        'age': serializeParam(
          _age,
          ParamType.int,
        ),
        'matchSex': serializeParam(
          _matchSex,
          ParamType.String,
        ),
        'privateAccount': serializeParam(
          _privateAccount,
          ParamType.bool,
        ),
        'noSwiping': serializeParam(
          _noSwiping,
          ParamType.bool,
        ),
        'adRef': serializeParam(
          _adRef,
          ParamType.DocumentReference,
        ),
        'headline': serializeParam(
          _headline,
          ParamType.String,
        ),
        'primary_text': serializeParam(
          _primaryText,
          ParamType.String,
        ),
        'clicks': serializeParam(
          _clicks,
          ParamType.int,
        ),
        'views': serializeParam(
          _views,
          ParamType.int,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
          isList: true,
        ),
        'matches_notifications': serializeParam(
          _matchesNotifications,
          ParamType.bool,
        ),
        'likes_notifications': serializeParam(
          _likesNotifications,
          ParamType.bool,
        ),
      }.withoutNulls;

  static SwipeStruct fromSerializableMap(Map<String, dynamic> data) =>
      SwipeStruct(
        userRef: deserializeParam(
          data['userRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        isAd: deserializeParam(
          data['isAd'],
          ParamType.bool,
          false,
        ),
        adLink: deserializeParam(
          data['adLink'],
          ParamType.String,
          false,
        ),
        adImage: deserializeParam(
          data['adImage'],
          ParamType.String,
          false,
        ),
        adVideo: deserializeParam(
          data['adVideo'],
          ParamType.String,
          false,
        ),
        sex: deserializeParam(
          data['sex'],
          ParamType.String,
          false,
        ),
        age: deserializeParam(
          data['age'],
          ParamType.int,
          false,
        ),
        matchSex: deserializeParam(
          data['matchSex'],
          ParamType.String,
          false,
        ),
        privateAccount: deserializeParam(
          data['privateAccount'],
          ParamType.bool,
          false,
        ),
        noSwiping: deserializeParam(
          data['noSwiping'],
          ParamType.bool,
          false,
        ),
        adRef: deserializeParam(
          data['adRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['custom_ads'],
        ),
        headline: deserializeParam(
          data['headline'],
          ParamType.String,
          false,
        ),
        primaryText: deserializeParam(
          data['primary_text'],
          ParamType.String,
          false,
        ),
        clicks: deserializeParam(
          data['clicks'],
          ParamType.int,
          false,
        ),
        views: deserializeParam(
          data['views'],
          ParamType.int,
          false,
        ),
        city: deserializeParam<String>(
          data['city'],
          ParamType.String,
          true,
        ),
        matchesNotifications: deserializeParam(
          data['matches_notifications'],
          ParamType.bool,
          false,
        ),
        likesNotifications: deserializeParam(
          data['likes_notifications'],
          ParamType.bool,
          false,
        ),
      );

  static SwipeStruct fromAlgoliaData(Map<String, dynamic> data) => SwipeStruct(
        userRef: convertAlgoliaParam(
          data['userRef'],
          ParamType.DocumentReference,
          false,
        ),
        isAd: convertAlgoliaParam(
          data['isAd'],
          ParamType.bool,
          false,
        ),
        adLink: convertAlgoliaParam(
          data['adLink'],
          ParamType.String,
          false,
        ),
        adImage: convertAlgoliaParam(
          data['adImage'],
          ParamType.String,
          false,
        ),
        adVideo: convertAlgoliaParam(
          data['adVideo'],
          ParamType.String,
          false,
        ),
        sex: convertAlgoliaParam(
          data['sex'],
          ParamType.String,
          false,
        ),
        age: convertAlgoliaParam(
          data['age'],
          ParamType.int,
          false,
        ),
        matchSex: convertAlgoliaParam(
          data['matchSex'],
          ParamType.String,
          false,
        ),
        privateAccount: convertAlgoliaParam(
          data['privateAccount'],
          ParamType.bool,
          false,
        ),
        noSwiping: convertAlgoliaParam(
          data['noSwiping'],
          ParamType.bool,
          false,
        ),
        adRef: convertAlgoliaParam(
          data['adRef'],
          ParamType.DocumentReference,
          false,
        ),
        headline: convertAlgoliaParam(
          data['headline'],
          ParamType.String,
          false,
        ),
        primaryText: convertAlgoliaParam(
          data['primary_text'],
          ParamType.String,
          false,
        ),
        clicks: convertAlgoliaParam(
          data['clicks'],
          ParamType.int,
          false,
        ),
        views: convertAlgoliaParam(
          data['views'],
          ParamType.int,
          false,
        ),
        city: convertAlgoliaParam<String>(
          data['city'],
          ParamType.String,
          true,
        ),
        matchesNotifications: convertAlgoliaParam(
          data['matches_notifications'],
          ParamType.bool,
          false,
        ),
        likesNotifications: convertAlgoliaParam(
          data['likes_notifications'],
          ParamType.bool,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'SwipeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SwipeStruct &&
        userRef == other.userRef &&
        isAd == other.isAd &&
        adLink == other.adLink &&
        adImage == other.adImage &&
        adVideo == other.adVideo &&
        sex == other.sex &&
        age == other.age &&
        matchSex == other.matchSex &&
        privateAccount == other.privateAccount &&
        noSwiping == other.noSwiping &&
        adRef == other.adRef &&
        headline == other.headline &&
        primaryText == other.primaryText &&
        clicks == other.clicks &&
        views == other.views &&
        listEquality.equals(city, other.city) &&
        matchesNotifications == other.matchesNotifications &&
        likesNotifications == other.likesNotifications;
  }

  @override
  int get hashCode => const ListEquality().hash([
        userRef,
        isAd,
        adLink,
        adImage,
        adVideo,
        sex,
        age,
        matchSex,
        privateAccount,
        noSwiping,
        adRef,
        headline,
        primaryText,
        clicks,
        views,
        city,
        matchesNotifications,
        likesNotifications
      ]);
}

SwipeStruct createSwipeStruct({
  DocumentReference? userRef,
  bool? isAd,
  String? adLink,
  String? adImage,
  String? adVideo,
  String? sex,
  int? age,
  String? matchSex,
  bool? privateAccount,
  bool? noSwiping,
  DocumentReference? adRef,
  String? headline,
  String? primaryText,
  int? clicks,
  int? views,
  bool? matchesNotifications,
  bool? likesNotifications,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SwipeStruct(
      userRef: userRef,
      isAd: isAd,
      adLink: adLink,
      adImage: adImage,
      adVideo: adVideo,
      sex: sex,
      age: age,
      matchSex: matchSex,
      privateAccount: privateAccount,
      noSwiping: noSwiping,
      adRef: adRef,
      headline: headline,
      primaryText: primaryText,
      clicks: clicks,
      views: views,
      matchesNotifications: matchesNotifications,
      likesNotifications: likesNotifications,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SwipeStruct? updateSwipeStruct(
  SwipeStruct? swipe, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    swipe
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSwipeStructData(
  Map<String, dynamic> firestoreData,
  SwipeStruct? swipe,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (swipe == null) {
    return;
  }
  if (swipe.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && swipe.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final swipeData = getSwipeFirestoreData(swipe, forFieldValue);
  final nestedData = swipeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = swipe.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSwipeFirestoreData(
  SwipeStruct? swipe, [
  bool forFieldValue = false,
]) {
  if (swipe == null) {
    return {};
  }
  final firestoreData = mapToFirestore(swipe.toMap());

  // Add any Firestore field values
  swipe.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSwipeListFirestoreData(
  List<SwipeStruct>? swipes,
) =>
    swipes?.map((e) => getSwipeFirestoreData(e, true)).toList() ?? [];
