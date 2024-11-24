import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'feedback_page_widget.dart' show FeedbackPageWidget;
import 'package:flutter/material.dart';

class FeedbackPageModel extends FlutterFlowModel<FeedbackPageWidget> {
  ///  Local state fields for this page.

  List<FeedbacksStruct> feedbackAnswers = [];
  void addToFeedbackAnswers(FeedbacksStruct item) => feedbackAnswers.add(item);
  void removeFromFeedbackAnswers(FeedbacksStruct item) =>
      feedbackAnswers.remove(item);
  void removeAtIndexFromFeedbackAnswers(int index) =>
      feedbackAnswers.removeAt(index);
  void insertAtIndexInFeedbackAnswers(int index, FeedbacksStruct item) =>
      feedbackAnswers.insert(index, item);
  void updateFeedbackAnswersAtIndex(
          int index, Function(FeedbacksStruct) updateFn) =>
      feedbackAnswers[index] = updateFn(feedbackAnswers[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
