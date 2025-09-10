import 'data.dart';

class LoginResponse {
  String? message;
  int? status;
  Data? data;

  LoginResponse({this.message, this.status, this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    message: json['message'] as String?,
    status: json['status'] as int?,
    data: json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'message': message,
    'status': status,
    'data': data?.toJson(),
  };
}
