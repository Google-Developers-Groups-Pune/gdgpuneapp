import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "linkedin" field.
  String? _linkedin;
  String get linkedin => _linkedin ?? '';
  bool hasLinkedin() => _linkedin != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "roles" field.
  List<String>? _roles;
  List<String> get roles => _roles ?? const [];
  bool hasRoles() => _roles != null;

  // "team_name" field.
  String? _teamName;
  String get teamName => _teamName ?? '';
  bool hasTeamName() => _teamName != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "tags" field.
  List<String>? _tags;
  List<String> get tags => _tags ?? const [];
  bool hasTags() => _tags != null;

  void _initializeFields() {
    _bio = snapshotData['bio'] as String?;
    _email = snapshotData['email'] as String?;
    _linkedin = snapshotData['linkedin'] as String?;
    _name = snapshotData['name'] as String?;
    _password = snapshotData['password'] as String?;
    _roles = getDataList(snapshotData['roles']);
    _teamName = snapshotData['team_name'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _displayName = snapshotData['display_name'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _tags = getDataList(snapshotData['tags']);
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: '(default)')
      .collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? bio,
  String? email,
  String? linkedin,
  String? name,
  String? password,
  String? teamName,
  String? uid,
  DateTime? createdTime,
  String? displayName,
  String? phoneNumber,
  String? photoUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'bio': bio,
      'email': email,
      'linkedin': linkedin,
      'name': name,
      'password': password,
      'team_name': teamName,
      'uid': uid,
      'created_time': createdTime,
      'display_name': displayName,
      'phone_number': phoneNumber,
      'photo_url': photoUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.bio == e2?.bio &&
        e1?.email == e2?.email &&
        e1?.linkedin == e2?.linkedin &&
        e1?.name == e2?.name &&
        e1?.password == e2?.password &&
        listEquality.equals(e1?.roles, e2?.roles) &&
        e1?.teamName == e2?.teamName &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.displayName == e2?.displayName &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.photoUrl == e2?.photoUrl &&
        listEquality.equals(e1?.tags, e2?.tags);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.bio,
        e?.email,
        e?.linkedin,
        e?.name,
        e?.password,
        e?.roles,
        e?.teamName,
        e?.uid,
        e?.createdTime,
        e?.displayName,
        e?.phoneNumber,
        e?.photoUrl,
        e?.tags
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
