import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TagsCollectionRecord extends FirestoreRecord {
  TagsCollectionRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "tags" field.
  List<String>? _tags;
  List<String> get tags => _tags ?? const [];
  bool hasTags() => _tags != null;

  // "event" field.
  String? _event;
  String get event => _event ?? '';
  bool hasEvent() => _event != null;

  void _initializeFields() {
    _tags = getDataList(snapshotData['tags']);
    _event = snapshotData['event'] as String?;
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: '(default)')
      .collection('tags_collection');

  static Stream<TagsCollectionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TagsCollectionRecord.fromSnapshot(s));

  static Future<TagsCollectionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TagsCollectionRecord.fromSnapshot(s));

  static TagsCollectionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TagsCollectionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TagsCollectionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TagsCollectionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TagsCollectionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TagsCollectionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTagsCollectionRecordData({
  String? event,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'event': event,
    }.withoutNulls,
  );

  return firestoreData;
}

class TagsCollectionRecordDocumentEquality
    implements Equality<TagsCollectionRecord> {
  const TagsCollectionRecordDocumentEquality();

  @override
  bool equals(TagsCollectionRecord? e1, TagsCollectionRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.tags, e2?.tags) && e1?.event == e2?.event;
  }

  @override
  int hash(TagsCollectionRecord? e) =>
      const ListEquality().hash([e?.tags, e?.event]);

  @override
  bool isValidKey(Object? o) => o is TagsCollectionRecord;
}
