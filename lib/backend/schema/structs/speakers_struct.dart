// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SpeakersStruct extends FFFirebaseStruct {
  SpeakersStruct({
    String? name,
    String? profilePic,
    DocumentReference? speakerRef,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _profilePic = profilePic,
        _speakerRef = speakerRef,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "profile_pic" field.
  String? _profilePic;
  String get profilePic => _profilePic ?? '';
  set profilePic(String? val) => _profilePic = val;

  bool hasProfilePic() => _profilePic != null;

  // "speaker_ref" field.
  DocumentReference? _speakerRef;
  DocumentReference? get speakerRef => _speakerRef;
  set speakerRef(DocumentReference? val) => _speakerRef = val;

  bool hasSpeakerRef() => _speakerRef != null;

  static SpeakersStruct fromMap(Map<String, dynamic> data) => SpeakersStruct(
        name: data['name'] as String?,
        profilePic: data['profile_pic'] as String?,
        speakerRef: data['speaker_ref'] as DocumentReference?,
      );

  static SpeakersStruct? maybeFromMap(dynamic data) =>
      data is Map ? SpeakersStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'profile_pic': _profilePic,
        'speaker_ref': _speakerRef,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'profile_pic': serializeParam(
          _profilePic,
          ParamType.String,
        ),
        'speaker_ref': serializeParam(
          _speakerRef,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static SpeakersStruct fromSerializableMap(Map<String, dynamic> data) =>
      SpeakersStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        profilePic: deserializeParam(
          data['profile_pic'],
          ParamType.String,
          false,
        ),
        speakerRef: deserializeParam(
          data['speaker_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['speakers'],
        ),
      );

  @override
  String toString() => 'SpeakersStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SpeakersStruct &&
        name == other.name &&
        profilePic == other.profilePic &&
        speakerRef == other.speakerRef;
  }

  @override
  int get hashCode => const ListEquality().hash([name, profilePic, speakerRef]);
}

SpeakersStruct createSpeakersStruct({
  String? name,
  String? profilePic,
  DocumentReference? speakerRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SpeakersStruct(
      name: name,
      profilePic: profilePic,
      speakerRef: speakerRef,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SpeakersStruct? updateSpeakersStruct(
  SpeakersStruct? speakers, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    speakers
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSpeakersStructData(
  Map<String, dynamic> firestoreData,
  SpeakersStruct? speakers,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (speakers == null) {
    return;
  }
  if (speakers.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && speakers.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final speakersData = getSpeakersFirestoreData(speakers, forFieldValue);
  final nestedData = speakersData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = speakers.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSpeakersFirestoreData(
  SpeakersStruct? speakers, [
  bool forFieldValue = false,
]) {
  if (speakers == null) {
    return {};
  }
  final firestoreData = mapToFirestore(speakers.toMap());

  // Add any Firestore field values
  speakers.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSpeakersListFirestoreData(
  List<SpeakersStruct>? speakerss,
) =>
    speakerss?.map((e) => getSpeakersFirestoreData(e, true)).toList() ?? [];
