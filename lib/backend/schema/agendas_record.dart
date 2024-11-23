import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AgendasRecord extends FirestoreRecord {
  AgendasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "event" field.
  String? _event;
  String get event => _event ?? '';
  bool hasEvent() => _event != null;

  // "event_date" field.
  DateTime? _eventDate;
  DateTime? get eventDate => _eventDate;
  bool hasEventDate() => _eventDate != null;

  // "event_loc" field.
  String? _eventLoc;
  String get eventLoc => _eventLoc ?? '';
  bool hasEventLoc() => _eventLoc != null;

  // "event_map_link" field.
  String? _eventMapLink;
  String get eventMapLink => _eventMapLink ?? '';
  bool hasEventMapLink() => _eventMapLink != null;

  void _initializeFields() {
    _event = snapshotData['event'] as String?;
    _eventDate = snapshotData['event_date'] as DateTime?;
    _eventLoc = snapshotData['event_loc'] as String?;
    _eventMapLink = snapshotData['event_map_link'] as String?;
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: '(default)')
      .collection('agendas');

  static Stream<AgendasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AgendasRecord.fromSnapshot(s));

  static Future<AgendasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AgendasRecord.fromSnapshot(s));

  static AgendasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AgendasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AgendasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AgendasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AgendasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AgendasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAgendasRecordData({
  String? event,
  DateTime? eventDate,
  String? eventLoc,
  String? eventMapLink,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'event': event,
      'event_date': eventDate,
      'event_loc': eventLoc,
      'event_map_link': eventMapLink,
    }.withoutNulls,
  );

  return firestoreData;
}

class AgendasRecordDocumentEquality implements Equality<AgendasRecord> {
  const AgendasRecordDocumentEquality();

  @override
  bool equals(AgendasRecord? e1, AgendasRecord? e2) {
    return e1?.event == e2?.event &&
        e1?.eventDate == e2?.eventDate &&
        e1?.eventLoc == e2?.eventLoc &&
        e1?.eventMapLink == e2?.eventMapLink;
  }

  @override
  int hash(AgendasRecord? e) => const ListEquality()
      .hash([e?.event, e?.eventDate, e?.eventLoc, e?.eventMapLink]);

  @override
  bool isValidKey(Object? o) => o is AgendasRecord;
}
