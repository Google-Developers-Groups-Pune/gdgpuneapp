import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FeedbacksRecord extends FirestoreRecord {
  FeedbacksRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "attendee_email" field.
  String? _attendeeEmail;
  String get attendeeEmail => _attendeeEmail ?? '';
  bool hasAttendeeEmail() => _attendeeEmail != null;

  // "event" field.
  String? _event;
  String get event => _event ?? '';
  bool hasEvent() => _event != null;

  // "feedbacks" field.
  List<FeedbacksStruct>? _feedbacks;
  List<FeedbacksStruct> get feedbacks => _feedbacks ?? const [];
  bool hasFeedbacks() => _feedbacks != null;

  void _initializeFields() {
    _attendeeEmail = snapshotData['attendee_email'] as String?;
    _event = snapshotData['event'] as String?;
    _feedbacks = getStructList(
      snapshotData['feedbacks'],
      FeedbacksStruct.fromMap,
    );
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: '(default)')
      .collection('feedbacks');

  static Stream<FeedbacksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FeedbacksRecord.fromSnapshot(s));

  static Future<FeedbacksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FeedbacksRecord.fromSnapshot(s));

  static FeedbacksRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FeedbacksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FeedbacksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FeedbacksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FeedbacksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FeedbacksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFeedbacksRecordData({
  String? attendeeEmail,
  String? event,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'attendee_email': attendeeEmail,
      'event': event,
    }.withoutNulls,
  );

  return firestoreData;
}

class FeedbacksRecordDocumentEquality implements Equality<FeedbacksRecord> {
  const FeedbacksRecordDocumentEquality();

  @override
  bool equals(FeedbacksRecord? e1, FeedbacksRecord? e2) {
    const listEquality = ListEquality();
    return e1?.attendeeEmail == e2?.attendeeEmail &&
        e1?.event == e2?.event &&
        listEquality.equals(e1?.feedbacks, e2?.feedbacks);
  }

  @override
  int hash(FeedbacksRecord? e) =>
      const ListEquality().hash([e?.attendeeEmail, e?.event, e?.feedbacks]);

  @override
  bool isValidKey(Object? o) => o is FeedbacksRecord;
}
