import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TalksRecord extends FirestoreRecord {
  TalksRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "is_live" field.
  bool? _isLive;
  bool get isLive => _isLive ?? false;
  bool hasIsLive() => _isLive != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "speakers" field.
  List<SpeakersStruct>? _speakers;
  List<SpeakersStruct> get speakers => _speakers ?? const [];
  bool hasSpeakers() => _speakers != null;

  // "talks_reference" field.
  DocumentReference? _talksReference;
  DocumentReference? get talksReference => _talksReference;
  bool hasTalksReference() => _talksReference != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "type_of_talk" field.
  String? _typeOfTalk;
  String get typeOfTalk => _typeOfTalk ?? '';
  bool hasTypeOfTalk() => _typeOfTalk != null;

  // "at_time" field.
  DateTime? _atTime;
  DateTime? get atTime => _atTime;
  bool hasAtTime() => _atTime != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _isLive = snapshotData['is_live'] as bool?;
    _location = snapshotData['location'] as String?;
    _speakers = getStructList(
      snapshotData['speakers'],
      SpeakersStruct.fromMap,
    );
    _talksReference = snapshotData['talks_reference'] as DocumentReference?;
    _title = snapshotData['title'] as String?;
    _typeOfTalk = snapshotData['type_of_talk'] as String?;
    _atTime = snapshotData['at_time'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('talks')
          : FirebaseFirestore.instanceFor(
                  app: Firebase.app(), databaseId: '(default)')
              .collectionGroup('talks');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('talks').doc(id);

  static Stream<TalksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TalksRecord.fromSnapshot(s));

  static Future<TalksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TalksRecord.fromSnapshot(s));

  static TalksRecord fromSnapshot(DocumentSnapshot snapshot) => TalksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TalksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TalksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TalksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TalksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTalksRecordData({
  bool? isLive,
  String? location,
  DocumentReference? talksReference,
  String? title,
  String? typeOfTalk,
  DateTime? atTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'is_live': isLive,
      'location': location,
      'talks_reference': talksReference,
      'title': title,
      'type_of_talk': typeOfTalk,
      'at_time': atTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class TalksRecordDocumentEquality implements Equality<TalksRecord> {
  const TalksRecordDocumentEquality();

  @override
  bool equals(TalksRecord? e1, TalksRecord? e2) {
    const listEquality = ListEquality();
    return e1?.isLive == e2?.isLive &&
        e1?.location == e2?.location &&
        listEquality.equals(e1?.speakers, e2?.speakers) &&
        e1?.talksReference == e2?.talksReference &&
        e1?.title == e2?.title &&
        e1?.typeOfTalk == e2?.typeOfTalk &&
        e1?.atTime == e2?.atTime;
  }

  @override
  int hash(TalksRecord? e) => const ListEquality().hash([
        e?.isLive,
        e?.location,
        e?.speakers,
        e?.talksReference,
        e?.title,
        e?.typeOfTalk,
        e?.atTime
      ]);

  @override
  bool isValidKey(Object? o) => o is TalksRecord;
}
