import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SwipeActionsRecord extends FirestoreRecord {
  SwipeActionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "eventID" field.
  String? _eventID;
  String get eventID => _eventID ?? '';
  bool hasEventID() => _eventID != null;

  // "swiperID" field.
  String? _swiperID;
  String get swiperID => _swiperID ?? '';
  bool hasSwiperID() => _swiperID != null;

  // "swipedID" field.
  String? _swipedID;
  String get swipedID => _swipedID ?? '';
  bool hasSwipedID() => _swipedID != null;

  // "swipeDirection" field.
  String? _swipeDirection;
  String get swipeDirection => _swipeDirection ?? '';
  bool hasSwipeDirection() => _swipeDirection != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _eventID = snapshotData['eventID'] as String?;
    _swiperID = snapshotData['swiperID'] as String?;
    _swipedID = snapshotData['swipedID'] as String?;
    _swipeDirection = snapshotData['swipeDirection'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('swipeActions')
          : FirebaseFirestore.instance.collectionGroup('swipeActions');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('swipeActions').doc(id);

  static Stream<SwipeActionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SwipeActionsRecord.fromSnapshot(s));

  static Future<SwipeActionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SwipeActionsRecord.fromSnapshot(s));

  static SwipeActionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SwipeActionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SwipeActionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SwipeActionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SwipeActionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SwipeActionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSwipeActionsRecordData({
  String? eventID,
  String? swiperID,
  String? swipedID,
  String? swipeDirection,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'eventID': eventID,
      'swiperID': swiperID,
      'swipedID': swipedID,
      'swipeDirection': swipeDirection,
    }.withoutNulls,
  );

  return firestoreData;
}

class SwipeActionsRecordDocumentEquality
    implements Equality<SwipeActionsRecord> {
  const SwipeActionsRecordDocumentEquality();

  @override
  bool equals(SwipeActionsRecord? e1, SwipeActionsRecord? e2) {
    return e1?.eventID == e2?.eventID &&
        e1?.swiperID == e2?.swiperID &&
        e1?.swipedID == e2?.swipedID &&
        e1?.swipeDirection == e2?.swipeDirection;
  }

  @override
  int hash(SwipeActionsRecord? e) => const ListEquality()
      .hash([e?.eventID, e?.swiperID, e?.swipedID, e?.swipeDirection]);

  @override
  bool isValidKey(Object? o) => o is SwipeActionsRecord;
}
