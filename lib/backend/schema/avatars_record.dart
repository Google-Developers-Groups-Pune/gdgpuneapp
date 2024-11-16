import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AvatarsRecord extends FirestoreRecord {
  AvatarsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "picture" field.
  String? _picture;
  String get picture => _picture ?? '';
  bool hasPicture() => _picture != null;

  // "avatar_id" field.
  String? _avatarId;
  String get avatarId => _avatarId ?? '';
  bool hasAvatarId() => _avatarId != null;

  void _initializeFields() {
    _picture = snapshotData['picture'] as String?;
    _avatarId = snapshotData['avatar_id'] as String?;
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: '(default)')
      .collection('avatars');

  static Stream<AvatarsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AvatarsRecord.fromSnapshot(s));

  static Future<AvatarsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AvatarsRecord.fromSnapshot(s));

  static AvatarsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AvatarsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AvatarsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AvatarsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AvatarsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AvatarsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAvatarsRecordData({
  String? picture,
  String? avatarId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'picture': picture,
      'avatar_id': avatarId,
    }.withoutNulls,
  );

  return firestoreData;
}

class AvatarsRecordDocumentEquality implements Equality<AvatarsRecord> {
  const AvatarsRecordDocumentEquality();

  @override
  bool equals(AvatarsRecord? e1, AvatarsRecord? e2) {
    return e1?.picture == e2?.picture && e1?.avatarId == e2?.avatarId;
  }

  @override
  int hash(AvatarsRecord? e) =>
      const ListEquality().hash([e?.picture, e?.avatarId]);

  @override
  bool isValidKey(Object? o) => o is AvatarsRecord;
}
