import '/backend/backend.dart';
import '/components/main_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_home_page_widget.dart' show UserHomePageWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class UserHomePageModel extends FlutterFlowModel<UserHomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in UserHomePage widget.
  UsersRecord? requiredUser;
  // Stores action output result for [Firestore Query - Query a collection] action in UserHomePage widget.
  AgendasRecord? requiredAgenda;
  // Stores action output result for [Firestore Query - Query a collection] action in qrBtn widget.
  QrRecord? outputQrData;
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, TalksRecord>? listViewPagingController;
  Query? listViewPagingQuery;
  List<StreamSubscription?> listViewStreamSubscriptions = [];

  // Model for mainNavBar component.
  late MainNavBarModel mainNavBarModel;

  @override
  void initState(BuildContext context) {
    mainNavBarModel = createModel(context, () => MainNavBarModel());
  }

  @override
  void dispose() {
    for (var s in listViewStreamSubscriptions) {
      s?.cancel();
    }
    listViewPagingController?.dispose();

    mainNavBarModel.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, TalksRecord> setListViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController ??= _createListViewController(query, parent);
    if (listViewPagingQuery != query) {
      listViewPagingQuery = query;
      listViewPagingController?.refresh();
    }
    return listViewPagingController!;
  }

  PagingController<DocumentSnapshot?, TalksRecord> _createListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, TalksRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryTalksRecordPage(
          parent: parent,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions,
          controller: controller,
          pageSize: 10,
          isStream: true,
        ),
      );
  }
}
