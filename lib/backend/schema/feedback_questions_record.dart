import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FeedbackQuestionsRecord extends FirestoreRecord {
  FeedbackQuestionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "event" field.
  String? _event;
  String get event => _event ?? '';
  bool hasEvent() => _event != null;

  // "questions" field.
  List<QuestionsStruct>? _questions;
  List<QuestionsStruct> get questions => _questions ?? const [];
  bool hasQuestions() => _questions != null;

  void _initializeFields() {
    _event = snapshotData['event'] as String?;
    _questions = getStructList(
      snapshotData['questions'],
      QuestionsStruct.fromMap,
    );
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: '(default)')
      .collection('feedback_questions');

  static Stream<FeedbackQuestionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FeedbackQuestionsRecord.fromSnapshot(s));

  static Future<FeedbackQuestionsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => FeedbackQuestionsRecord.fromSnapshot(s));

  static FeedbackQuestionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FeedbackQuestionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FeedbackQuestionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FeedbackQuestionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FeedbackQuestionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FeedbackQuestionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFeedbackQuestionsRecordData({
  String? event,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'event': event,
    }.withoutNulls,
  );

  return firestoreData;
}

class FeedbackQuestionsRecordDocumentEquality
    implements Equality<FeedbackQuestionsRecord> {
  const FeedbackQuestionsRecordDocumentEquality();

  @override
  bool equals(FeedbackQuestionsRecord? e1, FeedbackQuestionsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.event == e2?.event &&
        listEquality.equals(e1?.questions, e2?.questions);
  }

  @override
  int hash(FeedbackQuestionsRecord? e) =>
      const ListEquality().hash([e?.event, e?.questions]);

  @override
  bool isValidKey(Object? o) => o is FeedbackQuestionsRecord;
}
