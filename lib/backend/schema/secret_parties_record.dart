import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SecretPartiesRecord extends FirestoreRecord {
  SecretPartiesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "addressLatLng" field.
  LatLng? _addressLatLng;
  LatLng? get addressLatLng => _addressLatLng;
  bool hasAddressLatLng() => _addressLatLng != null;

  // "addressLocation" field.
  String? _addressLocation;
  String get addressLocation => _addressLocation ?? '';
  bool hasAddressLocation() => _addressLocation != null;

  // "price" field.
  String? _price;
  String get price => _price ?? '';
  bool hasPrice() => _price != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "app_name" field.
  String? _appName;
  String get appName => _appName ?? '';
  bool hasAppName() => _appName != null;

  // "creatorID" field.
  DocumentReference? _creatorID;
  DocumentReference? get creatorID => _creatorID;
  bool hasCreatorID() => _creatorID != null;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _addressLatLng = snapshotData['addressLatLng'] as LatLng?;
    _addressLocation = snapshotData['addressLocation'] as String?;
    _price = snapshotData['price'] as String?;
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _appName = snapshotData['app_name'] as String?;
    _creatorID = snapshotData['creatorID'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('secret_parties');

  static Stream<SecretPartiesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SecretPartiesRecord.fromSnapshot(s));

  static Future<SecretPartiesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SecretPartiesRecord.fromSnapshot(s));

  static SecretPartiesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SecretPartiesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SecretPartiesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SecretPartiesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SecretPartiesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SecretPartiesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSecretPartiesRecordData({
  DateTime? date,
  String? title,
  String? description,
  LatLng? addressLatLng,
  String? addressLocation,
  String? price,
  DocumentReference? createdBy,
  String? appName,
  DocumentReference? creatorID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'title': title,
      'description': description,
      'addressLatLng': addressLatLng,
      'addressLocation': addressLocation,
      'price': price,
      'createdBy': createdBy,
      'app_name': appName,
      'creatorID': creatorID,
    }.withoutNulls,
  );

  return firestoreData;
}

class SecretPartiesRecordDocumentEquality
    implements Equality<SecretPartiesRecord> {
  const SecretPartiesRecordDocumentEquality();

  @override
  bool equals(SecretPartiesRecord? e1, SecretPartiesRecord? e2) {
    return e1?.date == e2?.date &&
        e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.addressLatLng == e2?.addressLatLng &&
        e1?.addressLocation == e2?.addressLocation &&
        e1?.price == e2?.price &&
        e1?.createdBy == e2?.createdBy &&
        e1?.appName == e2?.appName &&
        e1?.creatorID == e2?.creatorID;
  }

  @override
  int hash(SecretPartiesRecord? e) => const ListEquality().hash([
        e?.date,
        e?.title,
        e?.description,
        e?.addressLatLng,
        e?.addressLocation,
        e?.price,
        e?.createdBy,
        e?.appName,
        e?.creatorID
      ]);

  @override
  bool isValidKey(Object? o) => o is SecretPartiesRecord;
}
