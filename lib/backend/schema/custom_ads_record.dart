import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustomAdsRecord extends FirestoreRecord {
  CustomAdsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "views" field.
  int? _views;
  int get views => _views ?? 0;
  bool hasViews() => _views != null;

  // "clicks" field.
  int? _clicks;
  int get clicks => _clicks ?? 0;
  bool hasClicks() => _clicks != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "headline" field.
  String? _headline;
  String get headline => _headline ?? '';
  bool hasHeadline() => _headline != null;

  // "primary_text" field.
  String? _primaryText;
  String get primaryText => _primaryText ?? '';
  bool hasPrimaryText() => _primaryText != null;

  // "adLink" field.
  String? _adLink;
  String get adLink => _adLink ?? '';
  bool hasAdLink() => _adLink != null;

  // "city" field.
  List<String>? _city;
  List<String> get city => _city ?? const [];
  bool hasCity() => _city != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  void _initializeFields() {
    _views = castToType<int>(snapshotData['views']);
    _clicks = castToType<int>(snapshotData['clicks']);
    _image = snapshotData['image'] as String?;
    _headline = snapshotData['headline'] as String?;
    _primaryText = snapshotData['primary_text'] as String?;
    _adLink = snapshotData['adLink'] as String?;
    _city = getDataList(snapshotData['city']);
    _title = snapshotData['title'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('custom_ads');

  static Stream<CustomAdsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CustomAdsRecord.fromSnapshot(s));

  static Future<CustomAdsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CustomAdsRecord.fromSnapshot(s));

  static CustomAdsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CustomAdsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CustomAdsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CustomAdsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CustomAdsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CustomAdsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCustomAdsRecordData({
  int? views,
  int? clicks,
  String? image,
  String? headline,
  String? primaryText,
  String? adLink,
  String? title,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'views': views,
      'clicks': clicks,
      'image': image,
      'headline': headline,
      'primary_text': primaryText,
      'adLink': adLink,
      'title': title,
    }.withoutNulls,
  );

  return firestoreData;
}

class CustomAdsRecordDocumentEquality implements Equality<CustomAdsRecord> {
  const CustomAdsRecordDocumentEquality();

  @override
  bool equals(CustomAdsRecord? e1, CustomAdsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.views == e2?.views &&
        e1?.clicks == e2?.clicks &&
        e1?.image == e2?.image &&
        e1?.headline == e2?.headline &&
        e1?.primaryText == e2?.primaryText &&
        e1?.adLink == e2?.adLink &&
        listEquality.equals(e1?.city, e2?.city) &&
        e1?.title == e2?.title;
  }

  @override
  int hash(CustomAdsRecord? e) => const ListEquality().hash([
        e?.views,
        e?.clicks,
        e?.image,
        e?.headline,
        e?.primaryText,
        e?.adLink,
        e?.city,
        e?.title
      ]);

  @override
  bool isValidKey(Object? o) => o is CustomAdsRecord;
}
