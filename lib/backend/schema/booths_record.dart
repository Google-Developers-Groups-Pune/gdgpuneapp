import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BoothsRecord extends FirestoreRecord {
  BoothsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "contact" field.
  String? _contact;
  String get contact => _contact ?? '';
  bool hasContact() => _contact != null;

  // "details" field.
  String? _details;
  String get details => _details ?? '';
  bool hasDetails() => _details != null;

  // "linkedin" field.
  String? _linkedin;
  String get linkedin => _linkedin ?? '';
  bool hasLinkedin() => _linkedin != null;

  // "website" field.
  String? _website;
  String get website => _website ?? '';
  bool hasWebsite() => _website != null;

  // "booth_number" field.
  String? _boothNumber;
  String get boothNumber => _boothNumber ?? '';
  bool hasBoothNumber() => _boothNumber != null;

  // "ceo_details" field.
  String? _ceoDetails;
  String get ceoDetails => _ceoDetails ?? '';
  bool hasCeoDetails() => _ceoDetails != null;

  // "comp_logo" field.
  String? _compLogo;
  String get compLogo => _compLogo ?? '';
  bool hasCompLogo() => _compLogo != null;

  // "comp_name" field.
  String? _compName;
  String get compName => _compName ?? '';
  bool hasCompName() => _compName != null;

  // "cto_details" field.
  String? _ctoDetails;
  String get ctoDetails => _ctoDetails ?? '';
  bool hasCtoDetails() => _ctoDetails != null;

  void _initializeFields() {
    _contact = snapshotData['contact'] as String?;
    _details = snapshotData['details'] as String?;
    _linkedin = snapshotData['linkedin'] as String?;
    _website = snapshotData['website'] as String?;
    _boothNumber = snapshotData['booth_number'] as String?;
    _ceoDetails = snapshotData['ceo_details'] as String?;
    _compLogo = snapshotData['comp_logo'] as String?;
    _compName = snapshotData['comp_name'] as String?;
    _ctoDetails = snapshotData['cto_details'] as String?;
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: '(default)')
      .collection('booths');

  static Stream<BoothsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BoothsRecord.fromSnapshot(s));

  static Future<BoothsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BoothsRecord.fromSnapshot(s));

  static BoothsRecord fromSnapshot(DocumentSnapshot snapshot) => BoothsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BoothsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BoothsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BoothsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BoothsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBoothsRecordData({
  String? contact,
  String? details,
  String? linkedin,
  String? website,
  String? boothNumber,
  String? ceoDetails,
  String? compLogo,
  String? compName,
  String? ctoDetails,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'contact': contact,
      'details': details,
      'linkedin': linkedin,
      'website': website,
      'booth_number': boothNumber,
      'ceo_details': ceoDetails,
      'comp_logo': compLogo,
      'comp_name': compName,
      'cto_details': ctoDetails,
    }.withoutNulls,
  );

  return firestoreData;
}

class BoothsRecordDocumentEquality implements Equality<BoothsRecord> {
  const BoothsRecordDocumentEquality();

  @override
  bool equals(BoothsRecord? e1, BoothsRecord? e2) {
    return e1?.contact == e2?.contact &&
        e1?.details == e2?.details &&
        e1?.linkedin == e2?.linkedin &&
        e1?.website == e2?.website &&
        e1?.boothNumber == e2?.boothNumber &&
        e1?.ceoDetails == e2?.ceoDetails &&
        e1?.compLogo == e2?.compLogo &&
        e1?.compName == e2?.compName &&
        e1?.ctoDetails == e2?.ctoDetails;
  }

  @override
  int hash(BoothsRecord? e) => const ListEquality().hash([
        e?.contact,
        e?.details,
        e?.linkedin,
        e?.website,
        e?.boothNumber,
        e?.ceoDetails,
        e?.compLogo,
        e?.compName,
        e?.ctoDetails
      ]);

  @override
  bool isValidKey(Object? o) => o is BoothsRecord;
}
