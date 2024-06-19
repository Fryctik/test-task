class Profile {
  String phoneNumber;
  String name;
  String dateOfBirth;
  String email;
  String city;
  String gender;

  Profile({
    required this.phoneNumber,
    required this.name,
    required this.dateOfBirth,
    required this.email,
    required this.city,
    required this.gender,
  });

  Profile copyWith({
    String? phoneNumber,
    String? name,
    String? dateOfBirth,
    String? email,
    String? city,
    String? gender,
  }) {
    return Profile(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      name: name ?? this.name,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      email: email ?? this.email,
      city: city ?? this.city,
      gender: gender ?? this.gender,
    );
  }

  // Factory constructor to create an empty profile
  factory Profile.empty() {
    return Profile(
      phoneNumber: '',
      name: '',
      dateOfBirth: '', // default date, can be adjusted
      email: '',
      city: '',
      gender: '',
    );
  }

  // Optional: Add a method to create a Profile from a map (e.g., from JSON)
  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      phoneNumber: map['phoneNumber'],
      name: map['name'],
      dateOfBirth: (map['dateOfBirth']),
      email: map['email'],
      city: map['city'],
      gender: map['gender'],
    );
  }

  // Optional: Add a method to convert a Profile to a map (e.g., to JSON)
  Map<String, dynamic> toMap() {
    return {
      'phoneNumber': phoneNumber,
      'name': name,
      'dateOfBirth': dateOfBirth,
      'email': email,
      'city': city,
      'gender': gender,
    };
  }

}
