import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SpeakersRecord extends FirestoreRecord {
  SpeakersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

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
    _bio = snapshotData['bio'] as String?;
    _linkedin = snapshotData['linkedin'] as String?;
    _name = snapshotData['name'] as String?;
    _profilePic = snapshotData['profilePic'] as String?;
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: '(default)')
      .collection('speakers');

  static Stream<SpeakersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SpeakersRecord.fromSnapshot(s));

  static Future<SpeakersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SpeakersRecord.fromSnapshot(s));

  static SpeakersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SpeakersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SpeakersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SpeakersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SpeakersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SpeakersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSpeakersRecordData({
  String? bio,
  String? linkedin,
  String? name,
  String? profilePic,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'bio': bio,
      'linkedin': linkedin,
      'name': name,
      'profilePic': profilePic,
    }.withoutNulls,
  );

  return firestoreData;
}

class SpeakersRecordDocumentEquality implements Equality<SpeakersRecord> {
  const SpeakersRecordDocumentEquality();

  @override
  bool equals(SpeakersRecord? e1, SpeakersRecord? e2) {
    return e1?.bio == e2?.bio &&
        e1?.linkedin == e2?.linkedin &&
        e1?.name == e2?.name &&
        e1?.profilePic == e2?.profilePic;
  }

  @override
  int hash(SpeakersRecord? e) =>
      const ListEquality().hash([e?.bio, e?.linkedin, e?.name, e?.profilePic]);

  @override
  bool isValidKey(Object? o) => o is SpeakersRecord;
}
