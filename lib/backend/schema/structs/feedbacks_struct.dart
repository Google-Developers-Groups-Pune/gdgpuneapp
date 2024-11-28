// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class FeedbacksStruct extends FFFirebaseStruct {
  FeedbacksStruct({
    String? answer,
    String? question,
    String? type,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _answer = answer,
        _question = question,
        _type = type,
        super(firestoreUtilData);

  // "answer" field.
  String? _answer;
  String get answer => _answer ?? '';
  set answer(String? val) => _answer = val;

  bool hasAnswer() => _answer != null;

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  set question(String? val) => _question = val;

  bool hasQuestion() => _question != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  static FeedbacksStruct fromMap(Map<String, dynamic> data) => FeedbacksStruct(
        answer: data['answer'] as String?,
        question: data['question'] as String?,
        type: data['type'] as String?,
      );

  static FeedbacksStruct? maybeFromMap(dynamic data) => data is Map
      ? FeedbacksStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'answer': _answer,
        'question': _question,
        'type': _type,
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
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
      }.withoutNulls;

  static FeedbacksStruct fromSerializableMap(Map<String, dynamic> data) =>
      FeedbacksStruct(
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
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FeedbacksStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FeedbacksStruct &&
        answer == other.answer &&
        question == other.question &&
        type == other.type;
  }

  @override
  int get hashCode => const ListEquality().hash([answer, question, type]);
}

FeedbacksStruct createFeedbacksStruct({
  String? answer,
  String? question,
  String? type,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FeedbacksStruct(
      answer: answer,
      question: question,
      type: type,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FeedbacksStruct? updateFeedbacksStruct(
  FeedbacksStruct? feedbacks, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    feedbacks
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFeedbacksStructData(
  Map<String, dynamic> firestoreData,
  FeedbacksStruct? feedbacks,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (feedbacks == null) {
    return;
  }
  if (feedbacks.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && feedbacks.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final feedbacksData = getFeedbacksFirestoreData(feedbacks, forFieldValue);
  final nestedData = feedbacksData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = feedbacks.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFeedbacksFirestoreData(
  FeedbacksStruct? feedbacks, [
  bool forFieldValue = false,
]) {
  if (feedbacks == null) {
    return {};
  }
  final firestoreData = mapToFirestore(feedbacks.toMap());

  // Add any Firestore field values
  feedbacks.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFeedbacksListFirestoreData(
  List<FeedbacksStruct>? feedbackss,
) =>
    feedbackss?.map((e) => getFeedbacksFirestoreData(e, true)).toList() ?? [];
