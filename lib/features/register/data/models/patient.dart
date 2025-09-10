class Patient {
  int? id;
  String? name;
  String? phoneNumber;
  String? email;
  String? nationalId;
  String? emergencyContactName;
  String? emergencyContactPhone;
  String? allergies;
  int? age;
  String? gender;
  dynamic birthDate;
  String? maritalStatus;
  String? image;
  dynamic nationalIdImage;
  dynamic birthCertificateImage;
  DateTime? createdAt;
  DateTime? updatedAt;

  Patient({
    this.id,
    this.name,
    this.phoneNumber,
    this.email,
    this.nationalId,
    this.emergencyContactName,
    this.emergencyContactPhone,
    this.allergies,
    this.age,
    this.gender,
    this.birthDate,
    this.maritalStatus,
    this.image,
    this.nationalIdImage,
    this.birthCertificateImage,
    this.createdAt,
    this.updatedAt,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
    id: json['id'] as int?,
    name: json['name'] as String?,
    phoneNumber: json['phoneNumber'] as String?,
    email: json['email'] as String?,
    nationalId: json['nationalId'] as String?,
    emergencyContactName: json['emergencyContactName'] as String?,
    emergencyContactPhone: json['emergencyContactPhone'] as String?,
    allergies: json['allergies'] as String?,
    age: json['age'] as int?,
    gender: json['gender'] as String?,
    birthDate: json['birthDate'] as dynamic,
    maritalStatus: json['maritalStatus'] as String?,
    image: json['image'] as String?,
    nationalIdImage: json['nationalIdImage'] as dynamic,
    birthCertificateImage: json['birthCertificateImage'] as dynamic,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'phoneNumber': phoneNumber,
    'email': email,
    'nationalId': nationalId,
    'emergencyContactName': emergencyContactName,
    'emergencyContactPhone': emergencyContactPhone,
    'allergies': allergies,
    'age': age,
    'gender': gender,
    'birthDate': birthDate,
    'maritalStatus': maritalStatus,
    'image': image,
    'nationalIdImage': nationalIdImage,
    'birthCertificateImage': birthCertificateImage,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
  };
}
