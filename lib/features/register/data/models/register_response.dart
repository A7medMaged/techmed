import 'patient.dart';

class RegisterResponse {
  String? message;
  Patient? patient;

  RegisterResponse({this.message, this.patient});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      message: json['message'] as String?,
      patient: json['patient'] == null
          ? null
          : Patient.fromJson(json['patient'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'message': message,
    'patient': patient?.toJson(),
  };
}
