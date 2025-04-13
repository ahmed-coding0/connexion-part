import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String location;
  final String role; // 'patient' or 'hp'

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.location,
    required this.role,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'location': location,
      'role': role,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      location: json['location'],
      role: json['role'],
    );
  }

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, password: ****, location: $location, role: $role)';
  }
}
