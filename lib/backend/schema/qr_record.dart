import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QrRecord extends FirestoreRecord {
  QrRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "attendee_email" field.
  String? _attendeeEmail;
  String get attendeeEmail => _attendeeEmail ?? '';
  bool hasAttendeeEmail() => _attendeeEmail != null;

  // "attendee_name" field.
  String? _attendeeName;
  String get attendeeName => _attendeeName ?? '';
  bool hasAttendeeName() => _attendeeName != null;

  // "food_qr_value" field.
  String? _foodQrValue;
  String get foodQrValue => _foodQrValue ?? '';
  bool hasFoodQrValue() => _foodQrValue != null;

  // "goodie_qr_value" field.
  String? _goodieQrValue;
  String get goodieQrValue => _goodieQrValue ?? '';
  bool hasGoodieQrValue() => _goodieQrValue != null;

  // "register_qr_value" field.
  String? _registerQrValue;
  String get registerQrValue => _registerQrValue ?? '';
  bool hasRegisterQrValue() => _registerQrValue != null;

  // "food_qr_scanned" field.
  bool? _foodQrScanned;
  bool get foodQrScanned => _foodQrScanned ?? false;
  bool hasFoodQrScanned() => _foodQrScanned != null;

  // "goodie_qr_scanned" field.
  bool? _goodieQrScanned;
  bool get goodieQrScanned => _goodieQrScanned ?? false;
  bool hasGoodieQrScanned() => _goodieQrScanned != null;

  // "register_qr_scanned" field.
  bool? _registerQrScanned;
  bool get registerQrScanned => _registerQrScanned ?? false;
  bool hasRegisterQrScanned() => _registerQrScanned != null;

  void _initializeFields() {
    _attendeeEmail = snapshotData['attendee_email'] as String?;
    _attendeeName = snapshotData['attendee_name'] as String?;
    _foodQrValue = snapshotData['food_qr_value'] as String?;
    _goodieQrValue = snapshotData['goodie_qr_value'] as String?;
    _registerQrValue = snapshotData['register_qr_value'] as String?;
    _foodQrScanned = snapshotData['food_qr_scanned'] as bool?;
    _goodieQrScanned = snapshotData['goodie_qr_scanned'] as bool?;
    _registerQrScanned = snapshotData['register_qr_scanned'] as bool?;
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: '(default)')
      .collection('qr');

  static Stream<QrRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QrRecord.fromSnapshot(s));

  static Future<QrRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QrRecord.fromSnapshot(s));

  static QrRecord fromSnapshot(DocumentSnapshot snapshot) => QrRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QrRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QrRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QrRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QrRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQrRecordData({
  String? attendeeEmail,
  String? attendeeName,
  String? foodQrValue,
  String? goodieQrValue,
  String? registerQrValue,
  bool? foodQrScanned,
  bool? goodieQrScanned,
  bool? registerQrScanned,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'attendee_email': attendeeEmail,
      'attendee_name': attendeeName,
      'food_qr_value': foodQrValue,
      'goodie_qr_value': goodieQrValue,
      'register_qr_value': registerQrValue,
      'food_qr_scanned': foodQrScanned,
      'goodie_qr_scanned': goodieQrScanned,
      'register_qr_scanned': registerQrScanned,
    }.withoutNulls,
  );

  return firestoreData;
}

class QrRecordDocumentEquality implements Equality<QrRecord> {
  const QrRecordDocumentEquality();

  @override
  bool equals(QrRecord? e1, QrRecord? e2) {
    return e1?.attendeeEmail == e2?.attendeeEmail &&
        e1?.attendeeName == e2?.attendeeName &&
        e1?.foodQrValue == e2?.foodQrValue &&
        e1?.goodieQrValue == e2?.goodieQrValue &&
        e1?.registerQrValue == e2?.registerQrValue &&
        e1?.foodQrScanned == e2?.foodQrScanned &&
        e1?.goodieQrScanned == e2?.goodieQrScanned &&
        e1?.registerQrScanned == e2?.registerQrScanned;
  }

  @override
  int hash(QrRecord? e) => const ListEquality().hash([
        e?.attendeeEmail,
        e?.attendeeName,
        e?.foodQrValue,
        e?.goodieQrValue,
        e?.registerQrValue,
        e?.foodQrScanned,
        e?.goodieQrScanned,
        e?.registerQrScanned
      ]);

  @override
  bool isValidKey(Object? o) => o is QrRecord;
}
