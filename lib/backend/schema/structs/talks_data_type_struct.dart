// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TalksDataTypeStruct extends FFFirebaseStruct {
  TalksDataTypeStruct({
    String? atTime,
    String? description,
    int? duration,
    bool? isLive,
    String? location,
    String? speakerName,
    String? talkImage,
    String? topic,
    String? typeOfTalk,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _atTime = atTime,
        _description = description,
        _duration = duration,
        _isLive = isLive,
        _location = location,
        _speakerName = speakerName,
        _talkImage = talkImage,
        _topic = topic,
        _typeOfTalk = typeOfTalk,
        super(firestoreUtilData);

  // "atTime" field.
  String? _atTime;
  String get atTime => _atTime ?? '10:00 AM';
  set atTime(String? val) => _atTime = val;

  bool hasAtTime() => _atTime != null;

  // "description" field.
  String? _description;
  String get description => _description ?? 'this is a test description';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "duration" field.
  int? _duration;
  int get duration => _duration ?? 30;
  set duration(int? val) => _duration = val;

  void incrementDuration(int amount) => duration = duration + amount;

  bool hasDuration() => _duration != null;

  // "isLive" field.
  bool? _isLive;
  bool get isLive => _isLive ?? false;
  set isLive(bool? val) => _isLive = val;

  bool hasIsLive() => _isLive != null;

  // "location" field.
  String? _location;
  String get location => _location ?? 'Ballroom 01';
  set location(String? val) => _location = val;

  bool hasLocation() => _location != null;

  // "speaker_name" field.
  String? _speakerName;
  String get speakerName => _speakerName ?? 'Shashank';
  set speakerName(String? val) => _speakerName = val;

  bool hasSpeakerName() => _speakerName != null;

  // "talk_image" field.
  String? _talkImage;
  String get talkImage => _talkImage ?? 'none';
  set talkImage(String? val) => _talkImage = val;

  bool hasTalkImage() => _talkImage != null;

  // "topic" field.
  String? _topic;
  String get topic => _topic ?? 'Flutterflow';
  set topic(String? val) => _topic = val;

  bool hasTopic() => _topic != null;

  // "typeOfTalk" field.
  String? _typeOfTalk;
  String get typeOfTalk => _typeOfTalk ?? 'Tech';
  set typeOfTalk(String? val) => _typeOfTalk = val;

  bool hasTypeOfTalk() => _typeOfTalk != null;

  static TalksDataTypeStruct fromMap(Map<String, dynamic> data) =>
      TalksDataTypeStruct(
        atTime: data['atTime'] as String?,
        description: data['description'] as String?,
        duration: castToType<int>(data['duration']),
        isLive: data['isLive'] as bool?,
        location: data['location'] as String?,
        speakerName: data['speaker_name'] as String?,
        talkImage: data['talk_image'] as String?,
        topic: data['topic'] as String?,
        typeOfTalk: data['typeOfTalk'] as String?,
      );

  static TalksDataTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? TalksDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'atTime': _atTime,
        'description': _description,
        'duration': _duration,
        'isLive': _isLive,
        'location': _location,
        'speaker_name': _speakerName,
        'talk_image': _talkImage,
        'topic': _topic,
        'typeOfTalk': _typeOfTalk,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'atTime': serializeParam(
          _atTime,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'duration': serializeParam(
          _duration,
          ParamType.int,
        ),
        'isLive': serializeParam(
          _isLive,
          ParamType.bool,
        ),
        'location': serializeParam(
          _location,
          ParamType.String,
        ),
        'speaker_name': serializeParam(
          _speakerName,
          ParamType.String,
        ),
        'talk_image': serializeParam(
          _talkImage,
          ParamType.String,
        ),
        'topic': serializeParam(
          _topic,
          ParamType.String,
        ),
        'typeOfTalk': serializeParam(
          _typeOfTalk,
          ParamType.String,
        ),
      }.withoutNulls;

  static TalksDataTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      TalksDataTypeStruct(
        atTime: deserializeParam(
          data['atTime'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        duration: deserializeParam(
          data['duration'],
          ParamType.int,
          false,
        ),
        isLive: deserializeParam(
          data['isLive'],
          ParamType.bool,
          false,
        ),
        location: deserializeParam(
          data['location'],
          ParamType.String,
          false,
        ),
        speakerName: deserializeParam(
          data['speaker_name'],
          ParamType.String,
          false,
        ),
        talkImage: deserializeParam(
          data['talk_image'],
          ParamType.String,
          false,
        ),
        topic: deserializeParam(
          data['topic'],
          ParamType.String,
          false,
        ),
        typeOfTalk: deserializeParam(
          data['typeOfTalk'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TalksDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TalksDataTypeStruct &&
        atTime == other.atTime &&
        description == other.description &&
        duration == other.duration &&
        isLive == other.isLive &&
        location == other.location &&
        speakerName == other.speakerName &&
        talkImage == other.talkImage &&
        topic == other.topic &&
        typeOfTalk == other.typeOfTalk;
  }

  @override
  int get hashCode => const ListEquality().hash([
        atTime,
        description,
        duration,
        isLive,
        location,
        speakerName,
        talkImage,
        topic,
        typeOfTalk
      ]);
}

TalksDataTypeStruct createTalksDataTypeStruct({
  String? atTime,
  String? description,
  int? duration,
  bool? isLive,
  String? location,
  String? speakerName,
  String? talkImage,
  String? topic,
  String? typeOfTalk,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TalksDataTypeStruct(
      atTime: atTime,
      description: description,
      duration: duration,
      isLive: isLive,
      location: location,
      speakerName: speakerName,
      talkImage: talkImage,
      topic: topic,
      typeOfTalk: typeOfTalk,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TalksDataTypeStruct? updateTalksDataTypeStruct(
  TalksDataTypeStruct? talksDataType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    talksDataType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTalksDataTypeStructData(
  Map<String, dynamic> firestoreData,
  TalksDataTypeStruct? talksDataType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (talksDataType == null) {
    return;
  }
  if (talksDataType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && talksDataType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final talksDataTypeData =
      getTalksDataTypeFirestoreData(talksDataType, forFieldValue);
  final nestedData =
      talksDataTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = talksDataType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTalksDataTypeFirestoreData(
  TalksDataTypeStruct? talksDataType, [
  bool forFieldValue = false,
]) {
  if (talksDataType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(talksDataType.toMap());

  // Add any Firestore field values
  talksDataType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTalksDataTypeListFirestoreData(
  List<TalksDataTypeStruct>? talksDataTypes,
) =>
    talksDataTypes
        ?.map((e) => getTalksDataTypeFirestoreData(e, true))
        .toList() ??
    [];
