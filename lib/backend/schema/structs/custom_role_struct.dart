// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustomRoleStruct extends FFFirebaseStruct {
  CustomRoleStruct({
    double? name,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        super(firestoreUtilData);

  // "Name" field.
  double? _name;
  double get name => _name ?? 0.0;
  set name(double? val) => _name = val;

  void incrementName(double amount) => name = name + amount;

  bool hasName() => _name != null;

  static CustomRoleStruct fromMap(Map<String, dynamic> data) =>
      CustomRoleStruct(
        name: castToType<double>(data['Name']),
      );

  static CustomRoleStruct? maybeFromMap(dynamic data) => data is Map
      ? CustomRoleStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Name': serializeParam(
          _name,
          ParamType.double,
        ),
      }.withoutNulls;

  static CustomRoleStruct fromSerializableMap(Map<String, dynamic> data) =>
      CustomRoleStruct(
        name: deserializeParam(
          data['Name'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'CustomRoleStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CustomRoleStruct && name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([name]);
}

CustomRoleStruct createCustomRoleStruct({
  double? name,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CustomRoleStruct(
      name: name,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CustomRoleStruct? updateCustomRoleStruct(
  CustomRoleStruct? customRole, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    customRole
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCustomRoleStructData(
  Map<String, dynamic> firestoreData,
  CustomRoleStruct? customRole,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (customRole == null) {
    return;
  }
  if (customRole.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && customRole.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final customRoleData = getCustomRoleFirestoreData(customRole, forFieldValue);
  final nestedData = customRoleData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = customRole.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCustomRoleFirestoreData(
  CustomRoleStruct? customRole, [
  bool forFieldValue = false,
]) {
  if (customRole == null) {
    return {};
  }
  final firestoreData = mapToFirestore(customRole.toMap());

  // Add any Firestore field values
  customRole.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCustomRoleListFirestoreData(
  List<CustomRoleStruct>? customRoles,
) =>
    customRoles?.map((e) => getCustomRoleFirestoreData(e, true)).toList() ?? [];
