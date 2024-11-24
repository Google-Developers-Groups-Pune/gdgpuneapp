import '/backend/backend.dart';
import '/components/main_nav_bar_widget.dart';
import '/components/send_btn_component/send_btn_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'notification_screen_widget.dart' show NotificationScreenWidget;
import 'package:flutter/material.dart';

class NotificationScreenModel
    extends FlutterFlowModel<NotificationScreenWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> userSegement = [];
  void addToUserSegement(DocumentReference item) => userSegement.add(item);
  void removeFromUserSegement(DocumentReference item) =>
      userSegement.remove(item);
  void removeAtIndexFromUserSegement(int index) => userSegement.removeAt(index);
  void insertAtIndexInUserSegement(int index, DocumentReference item) =>
      userSegement.insert(index, item);
  void updateUserSegementAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      userSegement[index] = updateFn(userSegement[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for notificationTitle widget.
  FocusNode? notificationTitleFocusNode;
  TextEditingController? notificationTitleTextController;
  String? Function(BuildContext, String?)?
      notificationTitleTextControllerValidator;
  // State field(s) for notificationDescription widget.
  FocusNode? notificationDescriptionFocusNode;
  TextEditingController? notificationDescriptionTextController;
  String? Function(BuildContext, String?)?
      notificationDescriptionTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for sendBtnComponent component.
  late SendBtnComponentModel sendBtnComponentModel;
  // Stores action output result for [Firestore Query - Query a collection] action in sendBtnComponent widget.
  List<UsersRecord>? speakers;
  // Stores action output result for [Firestore Query - Query a collection] action in sendBtnComponent widget.
  List<UsersRecord>? volunteerUsers1;
  // Stores action output result for [Firestore Query - Query a collection] action in sendBtnComponent widget.
  List<UsersRecord>? orgainzerUsers;
  // Stores action output result for [Firestore Query - Query a collection] action in sendBtnComponent widget.
  List<UsersRecord>? attendeeUsers;
  // Stores action output result for [Firestore Query - Query a collection] action in sendBtnComponent widget.
  List<UsersRecord>? volunteerUsers2;
  // Stores action output result for [Firestore Query - Query a collection] action in sendBtnComponent widget.
  List<UsersRecord>? allusers;
  // Model for mainNavBar component.
  late MainNavBarModel mainNavBarModel;

  @override
  void initState(BuildContext context) {
    sendBtnComponentModel = createModel(context, () => SendBtnComponentModel());
    mainNavBarModel = createModel(context, () => MainNavBarModel());
  }

  @override
  void dispose() {
    notificationTitleFocusNode?.dispose();
    notificationTitleTextController?.dispose();

    notificationDescriptionFocusNode?.dispose();
    notificationDescriptionTextController?.dispose();

    sendBtnComponentModel.dispose();
    mainNavBarModel.dispose();
  }
}
