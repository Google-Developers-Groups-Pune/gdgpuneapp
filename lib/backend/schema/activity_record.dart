import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ActivityRecord extends FirestoreRecord {
  ActivityRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "event" field.
  String? _event;
  String get event => _event ?? '';
  bool hasEvent() => _event != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  void _initializeFields() {
    _description = snapshotData['description'] as String?;
    _event = snapshotData['event'] as String?;
    _image = snapshotData['image'] as String?;
    _location = snapshotData['location'] as String?;
    _title = snapshotData['title'] as String?;
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: '(default)')
      .collection('activity');

  static Stream<ActivityRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ActivityRecord.fromSnapshot(s));

  static Future<ActivityRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ActivityRecord.fromSnapshot(s));

  static ActivityRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ActivityRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ActivityRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ActivityRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ActivityRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ActivityRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createActivityRecordData({
  String? description,
  String? event,
  String? image,
  String? location,
  String? title,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'description': description,
      'event': event,
      'image': image,
      'location': location,
      'title': title,
    }.withoutNulls,
  );

  return firestoreData;
}

class ActivityRecordDocumentEquality implements Equality<ActivityRecord> {
  const ActivityRecordDocumentEquality();

  @override
  bool equals(ActivityRecord? e1, ActivityRecord? e2) {
    return e1?.description == e2?.description &&
        e1?.event == e2?.event &&
        e1?.image == e2?.image &&
        e1?.location == e2?.location &&
        e1?.title == e2?.title;
  }

  @override
  int hash(ActivityRecord? e) => const ListEquality()
      .hash([e?.description, e?.event, e?.image, e?.location, e?.title]);

  @override
  bool isValidKey(Object? o) => o is ActivityRecord;
}
