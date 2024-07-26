class Order {
  String city;
  String address;
  String doorway;
  String floor;
  String apartment;
  String code;

  Order({
    required this.city,
    required this.address,
    required this.doorway,
    required this.floor,
    required this.apartment,
    required this.code,
  });

  Order copyWith({
    String? city,
    String? address,
    String? doorway,
    String? floor,
    String? apartment,
    String? code,
  }) {
    return Order(
      city: city ?? this.city,
      address: address ?? this.address,
      doorway: doorway ?? this.doorway,
      floor: floor ?? this.floor,
      apartment: apartment ?? this.apartment,
      code: code ?? this.code,
    );
  }
}