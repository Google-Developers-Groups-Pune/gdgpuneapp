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
import 'user_profile_page_widget.dart' show UserProfilePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

  UsersRecord? userProfile;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in UserProfilePage widget.
  UsersRecord? otherUserProfile;
  // Stores action output result for [Firestore Query - Query a collection] action in UserProfilePage widget.
  UsersRecord? selfUserProfile;
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
