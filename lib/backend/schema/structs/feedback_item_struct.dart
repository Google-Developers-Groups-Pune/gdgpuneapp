// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FeedbackItemStruct extends FFFirebaseStruct {
  FeedbackItemStruct({
    String? answer,
    String? question,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _answer = answer,
        _question = question,
        super(firestoreUtilData);

  // "answer" field.
  String? _answer;
  String get answer => _answer ?? '\"\"';
  set answer(String? val) => _answer = val;

  bool hasAnswer() => _answer != null;

  // "question" field.
  String? _question;
  String get question => _question ?? '\"\"';
  set question(String? val) => _question = val;

  bool hasQuestion() => _question != null;

  static FeedbackItemStruct fromMap(Map<String, dynamic> data) =>
      FeedbackItemStruct(
        answer: data['answer'] as String?,
        question: data['question'] as String?,
      );

  static FeedbackItemStruct? maybeFromMap(dynamic data) => data is Map
      ? FeedbackItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'answer': _answer,
        'question': _question,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'answer': serializeParam(
          _answer,
          ParamType.String,
        ),
        'question': serializeParam(
          _question,
          ParamType.String,
        ),
      }.withoutNulls;

  static FeedbackItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      FeedbackItemStruct(
        answer: deserializeParam(
          data['answer'],
          ParamType.String,
          false,
        ),
        question: deserializeParam(
          data['question'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FeedbackItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FeedbackItemStruct &&
        answer == other.answer &&
        question == other.question;
  }

  @override
  int get hashCode => const ListEquality().hash([answer, question]);
}

FeedbackItemStruct createFeedbackItemStruct({
  String? answer,
  String? question,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FeedbackItemStruct(
      answer: answer,
      question: question,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FeedbackItemStruct? updateFeedbackItemStruct(
  FeedbackItemStruct? feedbackItem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    feedbackItem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFeedbackItemStructData(
  Map<String, dynamic> firestoreData,
  FeedbackItemStruct? feedbackItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (feedbackItem == null) {
    return;
  }
  if (feedbackItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && feedbackItem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final feedbackItemData =
      getFeedbackItemFirestoreData(feedbackItem, forFieldValue);
  final nestedData =
      feedbackItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = feedbackItem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFeedbackItemFirestoreData(
  FeedbackItemStruct? feedbackItem, [
  bool forFieldValue = false,
]) {
  if (feedbackItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(feedbackItem.toMap());

  // Add any Firestore field values
  feedbackItem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFeedbackItemListFirestoreData(
  List<FeedbackItemStruct>? feedbackItems,
) =>
    feedbackItems?.map((e) => getFeedbackItemFirestoreData(e, true)).toList() ??
    [];
