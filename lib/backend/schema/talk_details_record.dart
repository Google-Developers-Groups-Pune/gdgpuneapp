import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TalkDetailsRecord extends FirestoreRecord {
  TalkDetailsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

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

  // "durationInMins" field.
  int? _durationInMins;
  int get durationInMins => _durationInMins ?? 0;
  bool hasDurationInMins() => _durationInMins != null;

  // "speakers" field.
  List<SpeakersStruct>? _speakers;
  List<SpeakersStruct> get speakers => _speakers ?? const [];
  bool hasSpeakers() => _speakers != null;

  // "talk_img" field.
  String? _talkImg;
  String get talkImg => _talkImg ?? '';
  bool hasTalkImg() => _talkImg != null;

  void _initializeFields() {
    _location = snapshotData['location'] as String?;
    _topic = snapshotData['topic'] as String?;
    _description = snapshotData['description'] as String?;
    _atTime = snapshotData['at_time'] as DateTime?;
    _isLive = snapshotData['is_live'] as bool?;
    _typeOfTalk = snapshotData['type_of_talk'] as String?;
    _durationInMins = castToType<int>(snapshotData['durationInMins']);
    _speakers = getStructList(
      snapshotData['speakers'],
      SpeakersStruct.fromMap,
    );
    _talkImg = snapshotData['talk_img'] as String?;
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: '(default)')
      .collection('talk_details');

  static Stream<TalkDetailsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TalkDetailsRecord.fromSnapshot(s));

  static Future<TalkDetailsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TalkDetailsRecord.fromSnapshot(s));

  static TalkDetailsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TalkDetailsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TalkDetailsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TalkDetailsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TalkDetailsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TalkDetailsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTalkDetailsRecordData({
  String? location,
  String? topic,
  String? description,
  DateTime? atTime,
  bool? isLive,
  String? typeOfTalk,
  int? durationInMins,
  String? talkImg,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'location': location,
      'topic': topic,
      'description': description,
      'at_time': atTime,
      'is_live': isLive,
      'type_of_talk': typeOfTalk,
      'durationInMins': durationInMins,
      'talk_img': talkImg,
    }.withoutNulls,
  );

  return firestoreData;
}

class TalkDetailsRecordDocumentEquality implements Equality<TalkDetailsRecord> {
  const TalkDetailsRecordDocumentEquality();

  @override
  bool equals(TalkDetailsRecord? e1, TalkDetailsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.location == e2?.location &&
        e1?.topic == e2?.topic &&
        e1?.description == e2?.description &&
        e1?.atTime == e2?.atTime &&
        e1?.isLive == e2?.isLive &&
        e1?.typeOfTalk == e2?.typeOfTalk &&
        e1?.durationInMins == e2?.durationInMins &&
        listEquality.equals(e1?.speakers, e2?.speakers) &&
        e1?.talkImg == e2?.talkImg;
  }

  @override
  int hash(TalkDetailsRecord? e) => const ListEquality().hash([
        e?.location,
        e?.topic,
        e?.description,
        e?.atTime,
        e?.isLive,
        e?.typeOfTalk,
        e?.durationInMins,
        e?.speakers,
        e?.talkImg
      ]);

  @override
  bool isValidKey(Object? o) => o is TalkDetailsRecord;
}
