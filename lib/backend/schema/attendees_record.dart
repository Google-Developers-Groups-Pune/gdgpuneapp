import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AttendeesRecord extends FirestoreRecord {
  AttendeesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "attendeeEmail" field.
  String? _attendeeEmail;
  String get attendeeEmail => _attendeeEmail ?? '';
  bool hasAttendeeEmail() => _attendeeEmail != null;

  // "attendeeName" field.
  String? _attendeeName;
  String get attendeeName => _attendeeName ?? '';
  bool hasAttendeeName() => _attendeeName != null;

  // "attendeePassword" field.
  String? _attendeePassword;
  String get attendeePassword => _attendeePassword ?? '';
  bool hasAttendeePassword() => _attendeePassword != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "feedback" field.
  FeedbackItemStruct? _feedback;
  FeedbackItemStruct get feedback => _feedback ?? FeedbackItemStruct();
  bool hasFeedback() => _feedback != null;

  // "linkedin" field.
  String? _linkedin;
  String get linkedin => _linkedin ?? '';
  bool hasLinkedin() => _linkedin != null;

  // "profilePic" field.
  String? _profilePic;
  String get profilePic => _profilePic ?? '';
  bool hasProfilePic() => _profilePic != null;

  // "roles" field.
  List<String>? _roles;
  List<String> get roles => _roles ?? const [];
  bool hasRoles() => _roles != null;

  // "tags" field.
  List<String>? _tags;
  List<String> get tags => _tags ?? const [];
  bool hasTags() => _tags != null;

  void _initializeFields() {
    _attendeeEmail = snapshotData['attendeeEmail'] as String?;
    _attendeeName = snapshotData['attendeeName'] as String?;
    _attendeePassword = snapshotData['attendeePassword'] as String?;
    _description = snapshotData['description'] as String?;
    _feedback = FeedbackItemStruct.maybeFromMap(snapshotData['feedback']);
    _linkedin = snapshotData['linkedin'] as String?;
    _profilePic = snapshotData['profilePic'] as String?;
    _roles = getDataList(snapshotData['roles']);
    _tags = getDataList(snapshotData['tags']);
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: '(default)')
      .collection('attendees');

  static Stream<AttendeesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AttendeesRecord.fromSnapshot(s));

  static Future<AttendeesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AttendeesRecord.fromSnapshot(s));

  static AttendeesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AttendeesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AttendeesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AttendeesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AttendeesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AttendeesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAttendeesRecordData({
  String? attendeeEmail,
  String? attendeeName,
  String? attendeePassword,
  String? description,
  FeedbackItemStruct? feedback,
  String? linkedin,
  String? profilePic,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'attendeeEmail': attendeeEmail,
      'attendeeName': attendeeName,
      'attendeePassword': attendeePassword,
      'description': description,
      'feedback': FeedbackItemStruct().toMap(),
      'linkedin': linkedin,
      'profilePic': profilePic,
    }.withoutNulls,
  );

  // Handle nested data for "feedback" field.
  addFeedbackItemStructData(firestoreData, feedback, 'feedback');

  return firestoreData;
}

class AttendeesRecordDocumentEquality implements Equality<AttendeesRecord> {
  const AttendeesRecordDocumentEquality();

  @override
  bool equals(AttendeesRecord? e1, AttendeesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.attendeeEmail == e2?.attendeeEmail &&
        e1?.attendeeName == e2?.attendeeName &&
        e1?.attendeePassword == e2?.attendeePassword &&
        e1?.description == e2?.description &&
        e1?.feedback == e2?.feedback &&
        e1?.linkedin == e2?.linkedin &&
        e1?.profilePic == e2?.profilePic &&
        listEquality.equals(e1?.roles, e2?.roles) &&
        listEquality.equals(e1?.tags, e2?.tags);
  }

  @override
  int hash(AttendeesRecord? e) => const ListEquality().hash([
        e?.attendeeEmail,
        e?.attendeeName,
        e?.attendeePassword,
        e?.description,
        e?.feedback,
        e?.linkedin,
        e?.profilePic,
        e?.roles,
        e?.tags
      ]);

  @override
  bool isValidKey(Object? o) => o is AttendeesRecord;
}
