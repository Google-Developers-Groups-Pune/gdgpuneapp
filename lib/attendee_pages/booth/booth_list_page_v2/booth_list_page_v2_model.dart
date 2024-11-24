import '/backend/backend.dart';
import '/components/main_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'booth_list_page_v2_widget.dart' show BoothListPageV2Widget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class BoothListPageV2Model extends FlutterFlowModel<BoothListPageV2Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, BoothsRecord>? listViewPagingController;
  Query? listViewPagingQuery;
  List<StreamSubscription?> listViewStreamSubscriptions = [];

  // Model for mainNavBar component.
  late MainNavBarModel mainNavBarModel;
  // Stores action output result for [Firestore Query - Query a collection] action in qrBtn widget.
  QrRecord? outputQrData;

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
  PagingController<DocumentSnapshot?, BoothsRecord> setListViewController(
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

  PagingController<DocumentSnapshot?, BoothsRecord> _createListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, BoothsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryBoothsRecordPage(
          queryBuilder: (_) => listViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions,
          controller: controller,
          pageSize: 10,
          isStream: true,
        ),
      );
  }
}
