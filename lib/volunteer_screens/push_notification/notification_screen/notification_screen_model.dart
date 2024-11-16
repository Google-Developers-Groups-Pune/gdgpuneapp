import '/components/send_btn_component/send_btn_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'notification_screen_widget.dart' show NotificationScreenWidget;
import 'package:flutter/material.dart';

class NotificationScreenModel
    extends FlutterFlowModel<NotificationScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Model for sendBtnComponent component.
  late SendBtnComponentModel sendBtnComponentModel;

  @override
  void initState(BuildContext context) {
    sendBtnComponentModel = createModel(context, () => SendBtnComponentModel());
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    sendBtnComponentModel.dispose();
  }
}
