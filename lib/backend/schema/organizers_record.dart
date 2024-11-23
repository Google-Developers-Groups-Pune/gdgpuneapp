import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrganizersRecord extends FirestoreRecord {
  OrganizersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "linkedin" field.
  String? _linkedin;
  String get linkedin => _linkedin ?? '';
  bool hasLinkedin() => _linkedin != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "profilePic" field.
  String? _profilePic;
  String get profilePic => _profilePic ?? '';
  bool hasProfilePic() => _profilePic != null;

  void _initializeFields() {
    _description = snapshotData['description'] as String?;
    _linkedin = snapshotData['linkedin'] as String?;
    _name = snapshotData['name'] as String?;
    _profilePic = snapshotData['profilePic'] as String?;
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: '(default)')
      .collection('organizers');

  static Stream<OrganizersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrganizersRecord.fromSnapshot(s));

  static Future<OrganizersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrganizersRecord.fromSnapshot(s));

  static OrganizersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OrganizersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrganizersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrganizersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrganizersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrganizersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrganizersRecordData({
  String? description,
  String? linkedin,
  String? name,
  String? profilePic,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'description': description,
      'linkedin': linkedin,
      'name': name,
      'profilePic': profilePic,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrganizersRecordDocumentEquality implements Equality<OrganizersRecord> {
  const OrganizersRecordDocumentEquality();

  @override
  bool equals(OrganizersRecord? e1, OrganizersRecord? e2) {
    return e1?.description == e2?.description &&
        e1?.linkedin == e2?.linkedin &&
        e1?.name == e2?.name &&
        e1?.profilePic == e2?.profilePic;
  }

  @override
  int hash(OrganizersRecord? e) => const ListEquality()
      .hash([e?.description, e?.linkedin, e?.name, e?.profilePic]);

  @override
  bool isValidKey(Object? o) => o is OrganizersRecord;
}
