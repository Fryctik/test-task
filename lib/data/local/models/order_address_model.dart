class OrderAddress {
  String city;
  String address;
  String time;
  String number;

  OrderAddress({
    required this.city,
    required this.address,
    required this.time,
    required this.number,
  });

  OrderAddress copyWith({
    String? city,
    String? address,
    String? time,
    String? number,
  }) {
    return OrderAddress(
      city: city ?? this.city,
      address: address ?? this.address,
      time: time ?? this.time,
      number: number ?? this.number,
    );
  }

  @override
  String toString() {
    return 'OrderAddress(city: $city, address: $address, time: $time, number: $number)';
  }
}