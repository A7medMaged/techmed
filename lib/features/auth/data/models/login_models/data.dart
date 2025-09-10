import 'patient.dart';

class Data {
  String? token;
  Patient? patient;

  Data({this.token, this.patient});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    token: json['token'] as String?,
    patient: json['patient'] == null
        ? null
        : Patient.fromJson(json['patient'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'token': token,
    'patient': patient?.toJson(),
  };
}
