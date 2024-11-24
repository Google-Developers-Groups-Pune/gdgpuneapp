// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SearchUserStruct extends FFFirebaseStruct {
  SearchUserStruct({
    String? name,
    String? tag,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _tag = tag,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? 'Anuja';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "tag" field.
  String? _tag;
  String get tag => _tag ?? '#student';
  set tag(String? val) => _tag = val;

  bool hasTag() => _tag != null;

  static SearchUserStruct fromMap(Map<String, dynamic> data) =>
      SearchUserStruct(
        name: data['name'] as String?,
        tag: data['tag'] as String?,
      );

  static SearchUserStruct? maybeFromMap(dynamic data) => data is Map
      ? SearchUserStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'tag': _tag,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'tag': serializeParam(
          _tag,
          ParamType.String,
        ),
      }.withoutNulls;

  static SearchUserStruct fromSerializableMap(Map<String, dynamic> data) =>
      SearchUserStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        tag: deserializeParam(
          data['tag'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SearchUserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SearchUserStruct && name == other.name && tag == other.tag;
  }

  @override
  int get hashCode => const ListEquality().hash([name, tag]);
}

SearchUserStruct createSearchUserStruct({
  String? name,
  String? tag,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SearchUserStruct(
      name: name,
      tag: tag,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SearchUserStruct? updateSearchUserStruct(
  SearchUserStruct? searchUser, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    searchUser
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSearchUserStructData(
  Map<String, dynamic> firestoreData,
  SearchUserStruct? searchUser,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (searchUser == null) {
    return;
  }
  if (searchUser.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && searchUser.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final searchUserData = getSearchUserFirestoreData(searchUser, forFieldValue);
  final nestedData = searchUserData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = searchUser.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSearchUserFirestoreData(
  SearchUserStruct? searchUser, [
  bool forFieldValue = false,
]) {
  if (searchUser == null) {
    return {};
  }
  final firestoreData = mapToFirestore(searchUser.toMap());

  // Add any Firestore field values
  searchUser.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSearchUserListFirestoreData(
  List<SearchUserStruct>? searchUsers,
) =>
    searchUsers?.map((e) => getSearchUserFirestoreData(e, true)).toList() ?? [];
