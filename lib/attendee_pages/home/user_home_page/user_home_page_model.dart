import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_home_page_widget.dart' show UserHomePageWidget;
import 'package:flutter/material.dart';

class UserHomePageModel extends FlutterFlowModel<UserHomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in UserHomePage widget.
  AgendasRecord? requiredAgenda;
  // Stores action output result for [Firestore Query - Query a collection] action in UserHomePage widget.
  List<TalksRecord>? requiredTalks;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
