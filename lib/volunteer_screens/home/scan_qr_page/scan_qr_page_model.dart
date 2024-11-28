import '/backend/backend.dart';
import '/components/main_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'scan_qr_page_widget.dart' show ScanQrPageWidget;
import 'package:flutter/material.dart';

class ScanQrPageModel extends FlutterFlowModel<ScanQrPageWidget> {
  ///  Local state fields for this page.

  List<String> userQrDataList = [];
  void addToUserQrDataList(String item) => userQrDataList.add(item);
  void removeFromUserQrDataList(String item) => userQrDataList.remove(item);
  void removeAtIndexFromUserQrDataList(int index) =>
      userQrDataList.removeAt(index);
  void insertAtIndexInUserQrDataList(int index, String item) =>
      userQrDataList.insert(index, item);
  void updateUserQrDataListAtIndex(int index, Function(String) updateFn) =>
      userQrDataList[index] = updateFn(userQrDataList[index]);

  ///  State fields for stateful widgets in this page.

  var userQrType = '';
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  QrRecord? userQrDetails;
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
