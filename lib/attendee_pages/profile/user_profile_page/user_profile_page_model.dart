import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'user_profile_page_widget.dart' show UserProfilePageWidget;
import 'package:flutter/material.dart';

class UserProfilePageModel extends FlutterFlowModel<UserProfilePageWidget> {
  ///  Local state fields for this page.

  List<String> listOfTags = ['student', 'flutter', 'reactjs', 'professional'];
  void addToListOfTags(String item) => listOfTags.add(item);
  void removeFromListOfTags(String item) => listOfTags.remove(item);
  void removeAtIndexFromListOfTags(int index) => listOfTags.removeAt(index);
  void insertAtIndexInListOfTags(int index, String item) =>
      listOfTags.insert(index, item);
  void updateListOfTagsAtIndex(int index, Function(String) updateFn) =>
      listOfTags[index] = updateFn(listOfTags[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
