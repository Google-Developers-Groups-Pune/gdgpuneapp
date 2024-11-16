import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'networking_page_widget.dart' show NetworkingPageWidget;
import 'package:flutter/material.dart';

class NetworkingPageModel extends FlutterFlowModel<NetworkingPageWidget> {
  ///  Local state fields for this page.

  List<SearchUserStruct> listOfUser = [];
  void addToListOfUser(SearchUserStruct item) => listOfUser.add(item);
  void removeFromListOfUser(SearchUserStruct item) => listOfUser.remove(item);
  void removeAtIndexFromListOfUser(int index) => listOfUser.removeAt(index);
  void insertAtIndexInListOfUser(int index, SearchUserStruct item) =>
      listOfUser.insert(index, item);
  void updateListOfUserAtIndex(
          int index, Function(SearchUserStruct) updateFn) =>
      listOfUser[index] = updateFn(listOfUser[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  final textFieldKey = GlobalKey();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
  }
}
