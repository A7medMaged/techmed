class VaccinationRequest {
  String? vaccineName;
  DateTime? vaccineDate;
  String? vaccineNotes;

  VaccinationRequest({
    this.vaccineName,
    this.vaccineDate,
    this.vaccineNotes,
  });

  factory VaccinationRequest.fromJson(Map<String, dynamic> json) {
    return VaccinationRequest(
      vaccineName: json['vaccineName'] as String?,
      vaccineDate: json['vaccineDate'] == null
          ? null
          : DateTime.parse(json['vaccineDate'] as String),
      vaccineNotes: json['vaccineNotes'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'vaccineName': vaccineName,
    'vaccineDate': vaccineDate?.toIso8601String(),
    'vaccineNotes': vaccineNotes,
  };
}
