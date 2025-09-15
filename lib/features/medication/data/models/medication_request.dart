class MedicationRequest {
  String? dosage;
  String? startDate;
  String? endDate;
  String? notes;
  int? medicineId;

  MedicationRequest({
    this.dosage,
    this.startDate,
    this.endDate,
    this.notes,
    this.medicineId,
  });

  factory MedicationRequest.fromJson(Map<String, dynamic> json) {
    return MedicationRequest(
      dosage: json['dosage'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      notes: json['notes'] as String?,
      medicineId: json['medicineId'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'dosage': dosage,
    'startDate': startDate,
    'endDate': endDate,
    'notes': notes,
    'medicineId': medicineId,
  };
}
