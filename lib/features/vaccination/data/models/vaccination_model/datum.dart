class Datum {
  int? id;
  int? patientId;
  String? vaccineName;
  DateTime? vaccineDate;
  String? vaccineNotes;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.patientId,
    this.vaccineName,
    this.vaccineDate,
    this.vaccineNotes,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json['id'] as int?,
    patientId: json['patientId'] as int?,
    vaccineName: json['vaccineName'] as String?,
    vaccineDate: json['vaccineDate'] == null
        ? null
        : DateTime.parse(json['vaccineDate'] as String),
    vaccineNotes: json['vaccineNotes'] as String?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'patientId': patientId,
    'vaccineName': vaccineName,
    'vaccineDate': vaccineDate?.toIso8601String(),
    'vaccineNotes': vaccineNotes,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
  };
}
