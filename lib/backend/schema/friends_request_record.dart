import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FriendsRequestRecord extends FirestoreRecord {
  FriendsRequestRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "dateSent" field.
  DateTime? _dateSent;
  DateTime? get dateSent => _dateSent;
  bool hasDateSent() => _dateSent != null;

  // "viewed" field.
  bool? _viewed;
  bool get viewed => _viewed ?? false;
  bool hasViewed() => _viewed != null;

  // "Requester" field.
  DocumentReference? _requester;
  DocumentReference? get requester => _requester;
  bool hasRequester() => _requester != null;

  // "Requestee" field.
  DocumentReference? _requestee;
  DocumentReference? get requestee => _requestee;
  bool hasRequestee() => _requestee != null;

  void _initializeFields() {
    _status = snapshotData['status'] as String?;
    _dateSent = snapshotData['dateSent'] as DateTime?;
    _viewed = snapshotData['viewed'] as bool?;
    _requester = snapshotData['Requester'] as DocumentReference?;
    _requestee = snapshotData['Requestee'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('friendsRequest');

  static Stream<FriendsRequestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FriendsRequestRecord.fromSnapshot(s));

  static Future<FriendsRequestRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FriendsRequestRecord.fromSnapshot(s));

  static FriendsRequestRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FriendsRequestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FriendsRequestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FriendsRequestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FriendsRequestRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FriendsRequestRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFriendsRequestRecordData({
  String? status,
  DateTime? dateSent,
  bool? viewed,
  DocumentReference? requester,
  DocumentReference? requestee,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'status': status,
      'dateSent': dateSent,
      'viewed': viewed,
      'Requester': requester,
      'Requestee': requestee,
    }.withoutNulls,
  );

  return firestoreData;
}

class FriendsRequestRecordDocumentEquality
    implements Equality<FriendsRequestRecord> {
  const FriendsRequestRecordDocumentEquality();

  @override
  bool equals(FriendsRequestRecord? e1, FriendsRequestRecord? e2) {
    return e1?.status == e2?.status &&
        e1?.dateSent == e2?.dateSent &&
        e1?.viewed == e2?.viewed &&
        e1?.requester == e2?.requester &&
        e1?.requestee == e2?.requestee;
  }

  @override
  int hash(FriendsRequestRecord? e) => const ListEquality()
      .hash([e?.status, e?.dateSent, e?.viewed, e?.requester, e?.requestee]);

  @override
  bool isValidKey(Object? o) => o is FriendsRequestRecord;
}
