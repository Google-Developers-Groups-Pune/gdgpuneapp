import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'feedback_item_widget.dart' show FeedbackItemWidget;
import 'package:flutter/material.dart';

class FeedbackItemModel extends FlutterFlowModel<FeedbackItemWidget> {
  ///  Local state fields for this component.

  List<FeedbacksStruct> feedbackAnswer = [];
  void addToFeedbackAnswer(FeedbacksStruct item) => feedbackAnswer.add(item);
  void removeFromFeedbackAnswer(FeedbacksStruct item) =>
      feedbackAnswer.remove(item);
  void removeAtIndexFromFeedbackAnswer(int index) =>
      feedbackAnswer.removeAt(index);
  void insertAtIndexInFeedbackAnswer(int index, FeedbacksStruct item) =>
      feedbackAnswer.insert(index, item);
  void updateFeedbackAnswerAtIndex(
          int index, Function(FeedbacksStruct) updateFn) =>
      feedbackAnswer[index] = updateFn(feedbackAnswer[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
