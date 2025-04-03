import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SecretPartyParticipatingRecord extends FirestoreRecord {
  SecretPartyParticipatingRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "sex" field.
  String? _sex;
  String get sex => _sex ?? '';
  bool hasSex() => _sex != null;

  // "sex_match" field.
  String? _sexMatch;
  String get sexMatch => _sexMatch ?? '';
  bool hasSexMatch() => _sexMatch != null;

  // "matches_notifications" field.
  bool? _matchesNotifications;
  bool get matchesNotifications => _matchesNotifications ?? false;
  bool hasMatchesNotifications() => _matchesNotifications != null;

  // "likes_notifications" field.
  bool? _likesNotifications;
  bool get likesNotifications => _likesNotifications ?? false;
  bool hasLikesNotifications() => _likesNotifications != null;

  // "private_account" field.
  bool? _privateAccount;
  bool get privateAccount => _privateAccount ?? false;
  bool hasPrivateAccount() => _privateAccount != null;

  // "no_swiping" field.
  bool? _noSwiping;
  bool get noSwiping => _noSwiping ?? false;
  bool hasNoSwiping() => _noSwiping != null;

  // "feature_Photo_AI" field.
  bool? _featurePhotoAI;
  bool get featurePhotoAI => _featurePhotoAI ?? false;
  bool hasFeaturePhotoAI() => _featurePhotoAI != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _sex = snapshotData['sex'] as String?;
    _sexMatch = snapshotData['sex_match'] as String?;
    _matchesNotifications = snapshotData['matches_notifications'] as bool?;
    _likesNotifications = snapshotData['likes_notifications'] as bool?;
    _privateAccount = snapshotData['private_account'] as bool?;
    _noSwiping = snapshotData['no_swiping'] as bool?;
    _featurePhotoAI = snapshotData['feature_Photo_AI'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('secret_party_Participating')
          : FirebaseFirestore.instance
              .collectionGroup('secret_party_Participating');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('secret_party_Participating').doc(id);

  static Stream<SecretPartyParticipatingRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => SecretPartyParticipatingRecord.fromSnapshot(s));

  static Future<SecretPartyParticipatingRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => SecretPartyParticipatingRecord.fromSnapshot(s));

  static SecretPartyParticipatingRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      SecretPartyParticipatingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SecretPartyParticipatingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SecretPartyParticipatingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SecretPartyParticipatingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SecretPartyParticipatingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSecretPartyParticipatingRecordData({
  DocumentReference? userRef,
  String? sex,
  String? sexMatch,
  bool? matchesNotifications,
  bool? likesNotifications,
  bool? privateAccount,
  bool? noSwiping,
  bool? featurePhotoAI,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'sex': sex,
      'sex_match': sexMatch,
      'matches_notifications': matchesNotifications,
      'likes_notifications': likesNotifications,
      'private_account': privateAccount,
      'no_swiping': noSwiping,
      'feature_Photo_AI': featurePhotoAI,
    }.withoutNulls,
  );

  return firestoreData;
}

class SecretPartyParticipatingRecordDocumentEquality
    implements Equality<SecretPartyParticipatingRecord> {
  const SecretPartyParticipatingRecordDocumentEquality();

  @override
  bool equals(
      SecretPartyParticipatingRecord? e1, SecretPartyParticipatingRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.sex == e2?.sex &&
        e1?.sexMatch == e2?.sexMatch &&
        e1?.matchesNotifications == e2?.matchesNotifications &&
        e1?.likesNotifications == e2?.likesNotifications &&
        e1?.privateAccount == e2?.privateAccount &&
        e1?.noSwiping == e2?.noSwiping &&
        e1?.featurePhotoAI == e2?.featurePhotoAI;
  }

  @override
  int hash(SecretPartyParticipatingRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.sex,
        e?.sexMatch,
        e?.matchesNotifications,
        e?.likesNotifications,
        e?.privateAccount,
        e?.noSwiping,
        e?.featurePhotoAI
      ]);

  @override
  bool isValidKey(Object? o) => o is SecretPartyParticipatingRecord;
}
