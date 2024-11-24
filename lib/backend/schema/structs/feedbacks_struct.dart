// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class FeedbacksStruct extends FFFirebaseStruct {
  FeedbacksStruct({
    String? answer,
    String? question,
    String? rating,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _answer = answer,
        _question = question,
        _rating = rating,
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

  // "rating" field.
  String? _rating;
  String get rating => _rating ?? '';
  set rating(String? val) => _rating = val;

  bool hasRating() => _rating != null;

  static FeedbacksStruct fromMap(Map<String, dynamic> data) => FeedbacksStruct(
        answer: data['answer'] as String?,
        question: data['question'] as String?,
        rating: data['rating'] as String?,
      );

  static FeedbacksStruct? maybeFromMap(dynamic data) => data is Map
      ? FeedbacksStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'answer': _answer,
        'question': _question,
        'rating': _rating,
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
        'rating': serializeParam(
          _rating,
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
        rating: deserializeParam(
          data['rating'],
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
        rating == other.rating;
  }

  @override
  int get hashCode => const ListEquality().hash([answer, question, rating]);
}

FeedbacksStruct createFeedbacksStruct({
  String? answer,
  String? question,
  String? rating,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FeedbacksStruct(
      answer: answer,
      question: question,
      rating: rating,
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
