import 'HealthcareProfessional.dart';
import 'Specialty.dart';

class Service {
  final String id;
  final String name;
  final String description;
  final double price;
  final Specialty? specialty; // Now using enum
  final HealthcareType healthcareType;

  Service({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.specialty,
    required this.healthcareType,
  }) : assert(
  healthcareType != HealthcareType.medecin || specialty != null,
  'Specialty must be provided for medecin services',
  );

  Service copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    Specialty? specialty,
    HealthcareType? healthcareType,
  }) {
    return Service(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      specialty: specialty ?? this.specialty,
      healthcareType: healthcareType ?? this.healthcareType,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'specialty': specialty?.name, // Store enum name
      'healthcareType': healthcareType.name,
    };
  }

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      specialty: json['specialty'] != null
          ? Specialty.fromString(json['specialty'])
          : null,
      healthcareType: HealthcareType.values.firstWhere(
            (e) => e.name == json['healthcareType'],
        orElse: () => HealthcareType.medecin,
      ),
    );
  }

  @override
  String toString() {
    return 'Service(id: $id, name: $name, description: $description, price: $price, '
        'specialty: ${specialty?.name}, healthcareType: ${healthcareType.name})';
  }
}