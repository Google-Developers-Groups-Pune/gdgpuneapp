import '/backend/backend.dart';
import '/components/main_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'networking_page_widget.dart' show NetworkingPageWidget;
import 'package:collection/collection.dart';
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

  // Stores action output result for [Firestore Query - Query a collection] action in networkingPage widget.
  TagsCollectionRecord? tagsList;
  // State field(s) for searchField widget.
  final searchFieldKey = GlobalKey();
  FocusNode? searchFieldFocusNode;
  TextEditingController? searchFieldTextController;
  String? searchFieldSelectedOption;
  String? Function(BuildContext, String?)? searchFieldTextControllerValidator;
  List<String> simpleSearchResults = [];
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Firestore Query - Query a collection] action in ChoiceChips widget.
  List<UsersRecord>? usersWithTag;
  // Model for mainNavBar component.
  late MainNavBarModel mainNavBarModel;

  @override
  void initState(BuildContext context) {
    mainNavBarModel = createModel(context, () => MainNavBarModel());
  }

  @override
  void dispose() {
    searchFieldFocusNode?.dispose();

    mainNavBarModel.dispose();
  }
}
