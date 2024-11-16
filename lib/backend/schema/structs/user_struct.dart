// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends FFFirebaseStruct {
  UserStruct({
    String? name,
    String? bio,
    String? email,
    String? linkedin,
    String? password,
    String? profilePic,
    List<String>? roles,
    String? teamName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _bio = bio,
        _email = email,
        _linkedin = linkedin,
        _password = password,
        _profilePic = profilePic,
        _roles = roles,
        _teamName = teamName,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? 'test user';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  set bio(String? val) => _bio = val;

  bool hasBio() => _bio != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "linkedin" field.
  String? _linkedin;
  String get linkedin => _linkedin ?? '';
  set linkedin(String? val) => _linkedin = val;

  bool hasLinkedin() => _linkedin != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  set password(String? val) => _password = val;

  bool hasPassword() => _password != null;

  // "profile_pic" field.
  String? _profilePic;
  String get profilePic => _profilePic ?? '';
  set profilePic(String? val) => _profilePic = val;

  bool hasProfilePic() => _profilePic != null;

  // "roles" field.
  List<String>? _roles;
  List<String> get roles => _roles ?? const [];
  set roles(List<String>? val) => _roles = val;

  void updateRoles(Function(List<String>) updateFn) {
    updateFn(_roles ??= []);
  }

  bool hasRoles() => _roles != null;

  // "team_name" field.
  String? _teamName;
  String get teamName => _teamName ?? '';
  set teamName(String? val) => _teamName = val;

  bool hasTeamName() => _teamName != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        name: data['name'] as String?,
        bio: data['bio'] as String?,
        email: data['email'] as String?,
        linkedin: data['linkedin'] as String?,
        password: data['password'] as String?,
        profilePic: data['profile_pic'] as String?,
        roles: getDataList(data['roles']),
        teamName: data['team_name'] as String?,
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'bio': _bio,
        'email': _email,
        'linkedin': _linkedin,
        'password': _password,
        'profile_pic': _profilePic,
        'roles': _roles,
        'team_name': _teamName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'bio': serializeParam(
          _bio,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'linkedin': serializeParam(
          _linkedin,
          ParamType.String,
        ),
        'password': serializeParam(
          _password,
          ParamType.String,
        ),
        'profile_pic': serializeParam(
          _profilePic,
          ParamType.String,
        ),
        'roles': serializeParam(
          _roles,
          ParamType.String,
          isList: true,
        ),
        'team_name': serializeParam(
          _teamName,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        bio: deserializeParam(
          data['bio'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        linkedin: deserializeParam(
          data['linkedin'],
          ParamType.String,
          false,
        ),
        password: deserializeParam(
          data['password'],
          ParamType.String,
          false,
        ),
        profilePic: deserializeParam(
          data['profile_pic'],
          ParamType.String,
          false,
        ),
        roles: deserializeParam<String>(
          data['roles'],
          ParamType.String,
          true,
        ),
        teamName: deserializeParam(
          data['team_name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserStruct &&
        name == other.name &&
        bio == other.bio &&
        email == other.email &&
        linkedin == other.linkedin &&
        password == other.password &&
        profilePic == other.profilePic &&
        listEquality.equals(roles, other.roles) &&
        teamName == other.teamName;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [name, bio, email, linkedin, password, profilePic, roles, teamName]);
}

UserStruct createUserStruct({
  String? name,
  String? bio,
  String? email,
  String? linkedin,
  String? password,
  String? profilePic,
  String? teamName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserStruct(
      name: name,
      bio: bio,
      email: email,
      linkedin: linkedin,
      password: password,
      profilePic: profilePic,
      teamName: teamName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserStruct? updateUserStruct(
  UserStruct? user, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    user
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserStructData(
  Map<String, dynamic> firestoreData,
  UserStruct? user,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (user == null) {
    return;
  }
  if (user.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && user.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userData = getUserFirestoreData(user, forFieldValue);
  final nestedData = userData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = user.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserFirestoreData(
  UserStruct? user, [
  bool forFieldValue = false,
]) {
  if (user == null) {
    return {};
  }
  final firestoreData = mapToFirestore(user.toMap());

  // Add any Firestore field values
  user.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserListFirestoreData(
  List<UserStruct>? users,
) =>
    users?.map((e) => getUserFirestoreData(e, true)).toList() ?? [];
