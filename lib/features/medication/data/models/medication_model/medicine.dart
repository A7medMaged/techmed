class Medicine {
  int? id;
  int? dosageFormId;
  int? inventoryId;
  int? hospitalId;
  String? enName;
  String? arName;
  String? enDescription;
  String? arDescription;
  String? activeIngredients;
  int? totalTablets;
  String? bgColor;
  String? textColor;
  String? notes;
  String? barcode;
  String? image;
  String? concentration;
  int? price;
  int? numberOfTape;
  int? numberOfPillsPerTape;
  DateTime? expirationDate;
  DateTime? createdAt;
  DateTime? updatedAt;

  Medicine({
    this.id,
    this.dosageFormId,
    this.inventoryId,
    this.hospitalId,
    this.enName,
    this.arName,
    this.enDescription,
    this.arDescription,
    this.activeIngredients,
    this.totalTablets,
    this.bgColor,
    this.textColor,
    this.notes,
    this.barcode,
    this.image,
    this.concentration,
    this.price,
    this.numberOfTape,
    this.numberOfPillsPerTape,
    this.expirationDate,
    this.createdAt,
    this.updatedAt,
  });

  factory Medicine.fromJson(Map<String, dynamic> json) => Medicine(
    id: json['id'] as int?,
    dosageFormId: json['dosageFormId'] as int?,
    inventoryId: json['inventoryId'] as int?,
    hospitalId: json['hospitalId'] as int?,
    enName: json['enName'] as String?,
    arName: json['arName'] as String?,
    enDescription: json['enDescription'] as String?,
    arDescription: json['arDescription'] as String?,
    activeIngredients: json['activeIngredients'] as String?,
    totalTablets: json['totalTablets'] as int?,
    bgColor: json['bgColor'] as String?,
    textColor: json['textColor'] as String?,
    notes: json['notes'] as String?,
    barcode: json['barcode'] as String?,
    image: json['image'] as String?,
    concentration: json['concentration'] as String?,
    price: json['price'] as int?,
    numberOfTape: json['numberOfTape'] as int?,
    numberOfPillsPerTape: json['numberOfPillsPerTape'] as int?,
    expirationDate: json['expirationDate'] == null
        ? null
        : DateTime.parse(json['expirationDate'] as String),
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'dosageFormId': dosageFormId,
    'inventoryId': inventoryId,
    'hospitalId': hospitalId,
    'enName': enName,
    'arName': arName,
    'enDescription': enDescription,
    'arDescription': arDescription,
    'activeIngredients': activeIngredients,
    'totalTablets': totalTablets,
    'bgColor': bgColor,
    'textColor': textColor,
    'notes': notes,
    'barcode': barcode,
    'image': image,
    'concentration': concentration,
    'price': price,
    'numberOfTape': numberOfTape,
    'numberOfPillsPerTape': numberOfPillsPerTape,
    'expirationDate': expirationDate?.toIso8601String(),
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
  };
}
