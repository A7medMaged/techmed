class RegisterModel {
  String? name;
  String? email;
  String? password;
  String? phoneNumber;
  String? nationalId;
  String? gender;

  RegisterModel({
    this.name,
    this.email,
    this.password,
    this.phoneNumber,
    this.nationalId,
    this.gender,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    name: json['name'] as String?,
    email: json['email'] as String?,
    password: json['password'] as String?,
    phoneNumber: json['phoneNumber'] as String?,
    nationalId: json['nationalId'] as String?,
    gender: json['gender'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'password': password,
    'phoneNumber': phoneNumber,
    'nationalId': nationalId,
    'gender': gender,
  };
}
