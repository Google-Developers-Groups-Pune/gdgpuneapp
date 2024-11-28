import '/backend/backend.dart';
import '/components/main_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'menu_page_widget.dart' show MenuPageWidget;
import 'package:flutter/material.dart';

class MenuPageModel extends FlutterFlowModel<MenuPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  FeedbacksRecord? userFeedback;
  // Model for mainNavBar component.
  late MainNavBarModel mainNavBarModel;

  @override
  void initState(BuildContext context) {
    mainNavBarModel = createModel(context, () => MainNavBarModel());
  }

  @override
  void dispose() {
    mainNavBarModel.dispose();
  }
}
