import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'user_profile_page_edit_widget.dart' show UserProfilePageEditWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class UserProfilePageEditModel
    extends FlutterFlowModel<UserProfilePageEditWidget> {
  ///  Local state fields for this page.

  List<String> listOfTags = ['Devfest 2024'];
  void addToListOfTags(String item) => listOfTags.add(item);
  void removeFromListOfTags(String item) => listOfTags.remove(item);
  void removeAtIndexFromListOfTags(int index) => listOfTags.removeAt(index);
  void insertAtIndexInListOfTags(int index, String item) =>
      listOfTags.insert(index, item);
  void updateListOfTagsAtIndex(int index, Function(String) updateFn) =>
      listOfTags[index] = updateFn(listOfTags[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in UserProfilePageEdit widget.
  UsersRecord? userProfile;
  // Stores action output result for [Firestore Query - Query a collection] action in UserProfilePageEdit widget.
  TagsCollectionRecord? tagsListForSearch;
  // State field(s) for nameField widget.
  FocusNode? nameFieldFocusNode;
  TextEditingController? nameFieldTextController;
  String? Function(BuildContext, String?)? nameFieldTextControllerValidator;
  // State field(s) for linkedInURL widget.
  FocusNode? linkedInURLFocusNode;
  TextEditingController? linkedInURLTextController;
  String? Function(BuildContext, String?)? linkedInURLTextControllerValidator;
  // State field(s) for tagsChoiceChips widget.
  FormFieldController<List<String>>? tagsChoiceChipsValueController;
  String? get tagsChoiceChipsValue =>
      tagsChoiceChipsValueController?.value?.firstOrNull;
  set tagsChoiceChipsValue(String? val) =>
      tagsChoiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for tagInput widget.
  FocusNode? tagInputFocusNode;
  TextEditingController? tagInputTextController;
  String? Function(BuildContext, String?)? tagInputTextControllerValidator;
  List<String> simpleSearchResults = [];
  // State field(s) for searchChoiceChips widget.
  FormFieldController<List<String>>? searchChoiceChipsValueController;
  String? get searchChoiceChipsValue =>
      searchChoiceChipsValueController?.value?.firstOrNull;
  set searchChoiceChipsValue(String? val) =>
      searchChoiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for bioInput widget.
  FocusNode? bioInputFocusNode;
  TextEditingController? bioInputTextController;
  String? Function(BuildContext, String?)? bioInputTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFieldFocusNode?.dispose();
    nameFieldTextController?.dispose();

    linkedInURLFocusNode?.dispose();
    linkedInURLTextController?.dispose();

    tagInputFocusNode?.dispose();
    tagInputTextController?.dispose();

    bioInputFocusNode?.dispose();
    bioInputTextController?.dispose();
  }
}
