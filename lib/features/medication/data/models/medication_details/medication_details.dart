import 'data.dart';

class MedicationDetails {
  String? message;
  int? status;
  Data? data;

  MedicationDetails({this.message, this.status, this.data});

  factory MedicationDetails.fromJson(Map<String, dynamic> json) {
    return MedicationDetails(
      message: json['message'] as String?,
      status: json['status'] as int?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'message': message,
    'status': status,
    'data': data?.toJson(),
  };
}
