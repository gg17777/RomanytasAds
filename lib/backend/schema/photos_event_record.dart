import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PhotosEventRecord extends FirestoreRecord {
  PhotosEventRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "users_in_photos" field.
  List<DocumentReference>? _usersInPhotos;
  List<DocumentReference> get usersInPhotos => _usersInPhotos ?? const [];
  bool hasUsersInPhotos() => _usersInPhotos != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _image = snapshotData['image'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _usersInPhotos = getDataList(snapshotData['users_in_photos']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('photos_event')
          : FirebaseFirestore.instance.collectionGroup('photos_event');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('photos_event').doc(id);

  static Stream<PhotosEventRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PhotosEventRecord.fromSnapshot(s));

  static Future<PhotosEventRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PhotosEventRecord.fromSnapshot(s));

  static PhotosEventRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PhotosEventRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PhotosEventRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PhotosEventRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PhotosEventRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PhotosEventRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPhotosEventRecordData({
  String? image,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image': image,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class PhotosEventRecordDocumentEquality implements Equality<PhotosEventRecord> {
  const PhotosEventRecordDocumentEquality();

  @override
  bool equals(PhotosEventRecord? e1, PhotosEventRecord? e2) {
    const listEquality = ListEquality();
    return e1?.image == e2?.image &&
        e1?.createdTime == e2?.createdTime &&
        listEquality.equals(e1?.usersInPhotos, e2?.usersInPhotos);
  }

  @override
  int hash(PhotosEventRecord? e) =>
      const ListEquality().hash([e?.image, e?.createdTime, e?.usersInPhotos]);

  @override
  bool isValidKey(Object? o) => o is PhotosEventRecord;
}
