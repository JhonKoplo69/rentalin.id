class Motorcycle {
  String? id;
  String merkMotor;
  String motorName;
  String typeMotor;
  String platMotor;
  double pricePerDay;
  bool isRecommended;

  Motorcycle({
    this.id,
    required this.merkMotor,
    required this.motorName,
    required this.typeMotor,
    required this.platMotor,
    required this.pricePerDay,
    this.isRecommended = false,
  });

  factory Motorcycle.fromMap(Map<String, dynamic> map, String docId) {
    return Motorcycle(
      id: docId,
      merkMotor: map['Merk Motor'] ?? '',
      motorName: map['Motor Name'] ?? '',
      typeMotor: map['Type Motor'] ?? '',
      platMotor: map['Plat Motor'] ?? '',
      pricePerDay: (map['Price/Day'] ?? 0.0).toDouble(),
      isRecommended: map['Recommendation'] ?? false,
    );
  }
}