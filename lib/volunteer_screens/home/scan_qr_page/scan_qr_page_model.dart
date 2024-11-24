import '/backend/backend.dart';
import '/components/main_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'scan_qr_page_widget.dart' show ScanQrPageWidget;
import 'package:flutter/material.dart';

class ScanQrPageModel extends FlutterFlowModel<ScanQrPageWidget> {
  ///  State fields for stateful widgets in this page.

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
    mainNavBarModel.dispose();
  }
}
