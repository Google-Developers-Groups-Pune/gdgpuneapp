import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AboutGdgRecord extends FirestoreRecord {
  AboutGdgRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "contact" field.
  String? _contact;
  String get contact => _contact ?? '';
  bool hasContact() => _contact != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "join_gdg" field.
  String? _joinGdg;
  String get joinGdg => _joinGdg ?? '';
  bool hasJoinGdg() => _joinGdg != null;

  // "linkedin" field.
  String? _linkedin;
  String get linkedin => _linkedin ?? '';
  bool hasLinkedin() => _linkedin != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  bool hasLogo() => _logo != null;

  // "website" field.
  String? _website;
  String get website => _website ?? '';
  bool hasWebsite() => _website != null;

  void _initializeFields() {
    _contact = snapshotData['contact'] as String?;
    _description = snapshotData['description'] as String?;
    _joinGdg = snapshotData['join_gdg'] as String?;
    _linkedin = snapshotData['linkedin'] as String?;
    _logo = snapshotData['logo'] as String?;
    _website = snapshotData['website'] as String?;
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: '(default)')
      .collection('about_gdg');

  static Stream<AboutGdgRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AboutGdgRecord.fromSnapshot(s));

  static Future<AboutGdgRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AboutGdgRecord.fromSnapshot(s));

  static AboutGdgRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AboutGdgRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AboutGdgRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AboutGdgRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AboutGdgRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AboutGdgRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAboutGdgRecordData({
  String? contact,
  String? description,
  String? joinGdg,
  String? linkedin,
  String? logo,
  String? website,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'contact': contact,
      'description': description,
      'join_gdg': joinGdg,
      'linkedin': linkedin,
      'logo': logo,
      'website': website,
    }.withoutNulls,
  );

  return firestoreData;
}

class AboutGdgRecordDocumentEquality implements Equality<AboutGdgRecord> {
  const AboutGdgRecordDocumentEquality();

  @override
  bool equals(AboutGdgRecord? e1, AboutGdgRecord? e2) {
    return e1?.contact == e2?.contact &&
        e1?.description == e2?.description &&
        e1?.joinGdg == e2?.joinGdg &&
        e1?.linkedin == e2?.linkedin &&
        e1?.logo == e2?.logo &&
        e1?.website == e2?.website;
  }

  @override
  int hash(AboutGdgRecord? e) => const ListEquality().hash([
        e?.contact,
        e?.description,
        e?.joinGdg,
        e?.linkedin,
        e?.logo,
        e?.website
      ]);

  @override
  bool isValidKey(Object? o) => o is AboutGdgRecord;
}
