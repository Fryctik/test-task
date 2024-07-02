class DeliveryAddress {
  String city;
  String name;
  String email;
  String number;
  String? comment;

  DeliveryAddress({
    required this.city,
    required this.name,
    required this.email,
    required this.number,
    required this.comment,
  });

  // Factory constructor for creating a new DeliveryAddress instance from a map
  factory DeliveryAddress.fromMap(Map<String, dynamic> map) {
    return DeliveryAddress(
      city: map['city'],
      name: map['name'],
      email: map['email'],
      number: map['number'],
      comment: map['comment'],
    );
  }

  // Method for converting a DeliveryAddress instance to a map
  Map<String, dynamic> toMap() {
    return {
      'city': city,
      'name': name,
      'email': email,
      'number': number,
      'comment': comment,
    };
  }

  // Method for creating a copy of the instance with updated fields
  DeliveryAddress copyWith({
    String? city,
    String? name,
    String? email,
    String? number,
    String? comment,
  }) {
    return DeliveryAddress(
      city: city ?? this.city,
      name: name ?? this.name,
      email: email ?? this.email,
      number: number ?? this.number,
      comment: comment ?? this.comment,
    );
  }

  @override
  String toString() {
    return 'DeliveryAddress(city: $city, name: $name, email: $email, number: $number, comment: $comment)';
  }
}