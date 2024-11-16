import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TalksDetailRecord extends FirestoreRecord {
  TalksDetailRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "duration" field.
  int? _duration;
  int get duration => _duration ?? 0;
  bool hasDuration() => _duration != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "topic" field.
  String? _topic;
  String get topic => _topic ?? '';
  bool hasTopic() => _topic != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "speaker_name" field.
  String? _speakerName;
  String get speakerName => _speakerName ?? '';
  bool hasSpeakerName() => _speakerName != null;

  // "talk_img" field.
  String? _talkImg;
  String get talkImg => _talkImg ?? '';
  bool hasTalkImg() => _talkImg != null;

  // "at_time" field.
  DateTime? _atTime;
  DateTime? get atTime => _atTime;
  bool hasAtTime() => _atTime != null;

  // "is_live" field.
  bool? _isLive;
  bool get isLive => _isLive ?? false;
  bool hasIsLive() => _isLive != null;

  // "type_of_talk" field.
  String? _typeOfTalk;
  String get typeOfTalk => _typeOfTalk ?? '';
  bool hasTypeOfTalk() => _typeOfTalk != null;

  void _initializeFields() {
    _duration = castToType<int>(snapshotData['duration']);
    _location = snapshotData['location'] as String?;
    _topic = snapshotData['topic'] as String?;
    _description = snapshotData['description'] as String?;
    _speakerName = snapshotData['speaker_name'] as String?;
    _talkImg = snapshotData['talk_img'] as String?;
    _atTime = snapshotData['at_time'] as DateTime?;
    _isLive = snapshotData['is_live'] as bool?;
    _typeOfTalk = snapshotData['type_of_talk'] as String?;
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: '(default)')
      .collection('talks_detail');

  static Stream<TalksDetailRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TalksDetailRecord.fromSnapshot(s));

  static Future<TalksDetailRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TalksDetailRecord.fromSnapshot(s));

  static TalksDetailRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TalksDetailRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TalksDetailRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TalksDetailRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TalksDetailRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TalksDetailRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTalksDetailRecordData({
  int? duration,
  String? location,
  String? topic,
  String? description,
  String? speakerName,
  String? talkImg,
  DateTime? atTime,
  bool? isLive,
  String? typeOfTalk,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'duration': duration,
      'location': location,
      'topic': topic,
      'description': description,
      'speaker_name': speakerName,
      'talk_img': talkImg,
      'at_time': atTime,
      'is_live': isLive,
      'type_of_talk': typeOfTalk,
    }.withoutNulls,
  );

  return firestoreData;
}

class TalksDetailRecordDocumentEquality implements Equality<TalksDetailRecord> {
  const TalksDetailRecordDocumentEquality();

  @override
  bool equals(TalksDetailRecord? e1, TalksDetailRecord? e2) {
    return e1?.duration == e2?.duration &&
        e1?.location == e2?.location &&
        e1?.topic == e2?.topic &&
        e1?.description == e2?.description &&
        e1?.speakerName == e2?.speakerName &&
        e1?.talkImg == e2?.talkImg &&
        e1?.atTime == e2?.atTime &&
        e1?.isLive == e2?.isLive &&
        e1?.typeOfTalk == e2?.typeOfTalk;
  }

  @override
  int hash(TalksDetailRecord? e) => const ListEquality().hash([
        e?.duration,
        e?.location,
        e?.topic,
        e?.description,
        e?.speakerName,
        e?.talkImg,
        e?.atTime,
        e?.isLive,
        e?.typeOfTalk
      ]);

  @override
  bool isValidKey(Object? o) => o is TalksDetailRecord;
}
