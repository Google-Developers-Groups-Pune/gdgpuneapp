import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VolunteersRecord extends FirestoreRecord {
  VolunteersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "adminAccess" field.
  bool? _adminAccess;
  bool get adminAccess => _adminAccess ?? false;
  bool hasAdminAccess() => _adminAccess != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "foodQR_scanned" field.
  List<String>? _foodQRScanned;
  List<String> get foodQRScanned => _foodQRScanned ?? const [];
  bool hasFoodQRScanned() => _foodQRScanned != null;

  // "goodieQR_scanned" field.
  List<String>? _goodieQRScanned;
  List<String> get goodieQRScanned => _goodieQRScanned ?? const [];
  bool hasGoodieQRScanned() => _goodieQRScanned != null;

  // "linkedin" field.
  String? _linkedin;
  String get linkedin => _linkedin ?? '';
  bool hasLinkedin() => _linkedin != null;

  // "profilePic" field.
  String? _profilePic;
  String get profilePic => _profilePic ?? '';
  bool hasProfilePic() => _profilePic != null;

  // "regQR_scanned" field.
  List<String>? _regQRScanned;
  List<String> get regQRScanned => _regQRScanned ?? const [];
  bool hasRegQRScanned() => _regQRScanned != null;

  // "teamName" field.
  String? _teamName;
  String get teamName => _teamName ?? '';
  bool hasTeamName() => _teamName != null;

  // "volEmail" field.
  String? _volEmail;
  String get volEmail => _volEmail ?? '';
  bool hasVolEmail() => _volEmail != null;

  // "volName" field.
  String? _volName;
  String get volName => _volName ?? '';
  bool hasVolName() => _volName != null;

  // "volPassword" field.
  String? _volPassword;
  String get volPassword => _volPassword ?? '';
  bool hasVolPassword() => _volPassword != null;

  void _initializeFields() {
    _adminAccess = snapshotData['adminAccess'] as bool?;
    _description = snapshotData['description'] as String?;
    _foodQRScanned = getDataList(snapshotData['foodQR_scanned']);
    _goodieQRScanned = getDataList(snapshotData['goodieQR_scanned']);
    _linkedin = snapshotData['linkedin'] as String?;
    _profilePic = snapshotData['profilePic'] as String?;
    _regQRScanned = getDataList(snapshotData['regQR_scanned']);
    _teamName = snapshotData['teamName'] as String?;
    _volEmail = snapshotData['volEmail'] as String?;
    _volName = snapshotData['volName'] as String?;
    _volPassword = snapshotData['volPassword'] as String?;
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: '(default)')
      .collection('volunteers');

  static Stream<VolunteersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VolunteersRecord.fromSnapshot(s));

  static Future<VolunteersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VolunteersRecord.fromSnapshot(s));

  static VolunteersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VolunteersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VolunteersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VolunteersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VolunteersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VolunteersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVolunteersRecordData({
  bool? adminAccess,
  String? description,
  String? linkedin,
  String? profilePic,
  String? teamName,
  String? volEmail,
  String? volName,
  String? volPassword,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'adminAccess': adminAccess,
      'description': description,
      'linkedin': linkedin,
      'profilePic': profilePic,
      'teamName': teamName,
      'volEmail': volEmail,
      'volName': volName,
      'volPassword': volPassword,
    }.withoutNulls,
  );

  return firestoreData;
}

class VolunteersRecordDocumentEquality implements Equality<VolunteersRecord> {
  const VolunteersRecordDocumentEquality();

  @override
  bool equals(VolunteersRecord? e1, VolunteersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.adminAccess == e2?.adminAccess &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.foodQRScanned, e2?.foodQRScanned) &&
        listEquality.equals(e1?.goodieQRScanned, e2?.goodieQRScanned) &&
        e1?.linkedin == e2?.linkedin &&
        e1?.profilePic == e2?.profilePic &&
        listEquality.equals(e1?.regQRScanned, e2?.regQRScanned) &&
        e1?.teamName == e2?.teamName &&
        e1?.volEmail == e2?.volEmail &&
        e1?.volName == e2?.volName &&
        e1?.volPassword == e2?.volPassword;
  }

  @override
  int hash(VolunteersRecord? e) => const ListEquality().hash([
        e?.adminAccess,
        e?.description,
        e?.foodQRScanned,
        e?.goodieQRScanned,
        e?.linkedin,
        e?.profilePic,
        e?.regQRScanned,
        e?.teamName,
        e?.volEmail,
        e?.volName,
        e?.volPassword
      ]);

  @override
  bool isValidKey(Object? o) => o is VolunteersRecord;
}
