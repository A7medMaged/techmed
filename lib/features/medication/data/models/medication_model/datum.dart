import 'medicine.dart';

class Datum {
  int? id;
  String? dosage;
  DateTime? startDate;
  DateTime? endDate;
  String? notes;
  int? medicineId;
  int? patientId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Medicine? medicine;

  Datum({
    this.id,
    this.dosage,
    this.startDate,
    this.endDate,
    this.notes,
    this.medicineId,
    this.patientId,
    this.createdAt,
    this.updatedAt,
    this.medicine,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json['id'] as int?,
    dosage: json['dosage'] as String?,
    startDate: json['startDate'] == null
        ? null
        : DateTime.parse(json['startDate'] as String),
    endDate: json['endDate'] == null
        ? null
        : DateTime.parse(json['endDate'] as String),
    notes: json['notes'] as String?,
    medicineId: json['medicineId'] as int?,
    patientId: json['patientId'] as int?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    medicine: json['medicine'] == null
        ? null
        : Medicine.fromJson(json['medicine'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'dosage': dosage,
    'startDate': startDate?.toIso8601String(),
    'endDate': endDate?.toIso8601String(),
    'notes': notes,
    'medicineId': medicineId,
    'patientId': patientId,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
    'medicine': medicine?.toJson(),
  };
}
