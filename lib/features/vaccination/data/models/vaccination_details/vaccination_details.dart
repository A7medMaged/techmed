import 'data.dart';

class VaccinationDetails {
  String? message;
  int? status;
  Data? data;

  VaccinationDetails({this.message, this.status, this.data});

  factory VaccinationDetails.fromJson(Map<String, dynamic> json) {
    return VaccinationDetails(
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
