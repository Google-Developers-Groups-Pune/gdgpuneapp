import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import 'user_profile_page_edit_widget.dart' show UserProfilePageEditWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserProfilePageEditModel
    extends FlutterFlowModel<UserProfilePageEditWidget> {
  ///  Local state fields for this page.

  List<String> listOfTags = [];
  void addToListOfTags(String item) => listOfTags.add(item);
  void removeFromListOfTags(String item) => listOfTags.remove(item);
  void removeAtIndexFromListOfTags(int index) => listOfTags.removeAt(index);
  void insertAtIndexInListOfTags(int index, String item) =>
      listOfTags.insert(index, item);
  void updateListOfTagsAtIndex(int index, Function(String) updateFn) =>
      listOfTags[index] = updateFn(listOfTags[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for linkedInURL widget.
  FocusNode? linkedInURLFocusNode;
  TextEditingController? linkedInURLTextController;
  String? Function(BuildContext, String?)? linkedInURLTextControllerValidator;
  // State field(s) for tagsChoiceChips widget.
  FormFieldController<List<String>>? tagsChoiceChipsValueController;
  List<String>? get tagsChoiceChipsValues =>
      tagsChoiceChipsValueController?.value;
  set tagsChoiceChipsValues(List<String>? val) =>
      tagsChoiceChipsValueController?.value = val;
  // State field(s) for tagInput widget.
  FocusNode? tagInputFocusNode;
  TextEditingController? tagInputTextController;
  String? Function(BuildContext, String?)? tagInputTextControllerValidator;
  // State field(s) for bioInput widget.
  FocusNode? bioInputFocusNode;
  TextEditingController? bioInputTextController;
  String? Function(BuildContext, String?)? bioInputTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    linkedInURLFocusNode?.dispose();
    linkedInURLTextController?.dispose();

    tagInputFocusNode?.dispose();
    tagInputTextController?.dispose();

    bioInputFocusNode?.dispose();
    bioInputTextController?.dispose();
  }
}
