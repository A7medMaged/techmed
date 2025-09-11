import 'datum.dart';

class VaccinationModel {
  String? message;
  int? status;
  List<Datum>? data;

  VaccinationModel({this.message, this.status, this.data});

  factory VaccinationModel.fromJson(Map<String, dynamic> json) {
    return VaccinationModel(
      message: json['message'] as String?,
      status: json['status'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'message': message,
    'status': status,
    'data': data?.map((e) => e.toJson()).toList(),
  };
}
