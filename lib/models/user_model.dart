import 'dart:convert';

class Profile {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final bool isVerified;
  final bool isArchived;

  Profile({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.isVerified,
    required this.isArchived,
  });

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      id: map['id'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? '',
      isVerified: map['isVerified'] ?? false,
      isArchived: map['isArchived'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'isVerified': isVerified,
      'isArchived': isArchived,
    };
  }

  factory Profile.fromJson(String source) => Profile.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());
}
