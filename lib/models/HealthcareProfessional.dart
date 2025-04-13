import 'User.dart';
import 'WeeklyAvailability.dart';
import 'Specialty.dart';

enum HealthcareType {
  medecin,
  clinique,
  centre_imagerie,
  laboratoire_analyse,
  infermier,
  pharmacie,
  dentiste,
}

class HealthcareProfessional extends User {
  final HealthcareType type;
  final Specialty? specialty;
  final List<Specialty> availableSpecialties;
  final List<String> serviceIds;
  final List<WeeklyAvailability> weeklyAvailability;
  final List<String> ratingIds;
  final List<String> commentIds;
  final List<String> appointmentIds;
  final List<String>? staffIds;
  final String? licenseNumber;
  final String wilaya;
  final String commune;
  final String exactAddress;
  final String location; // New field

  HealthcareProfessional({
    required String id,
    required String name,
    required String email,
    required String password,
    required this.wilaya,
    required this.commune,
    required this.exactAddress,
    required this.type,
    this.specialty,
    this.availableSpecialties = const [],
    required this.serviceIds,
    required this.weeklyAvailability,
    required this.ratingIds,
    required this.commentIds,
    required this.appointmentIds,
    this.staffIds,
    this.licenseNumber,
    required this.location, // Added to constructor
  }) : super(
    id: id,
    name: name,
    email: email,
    password: password,
    location: '$wilaya, $commune, $exactAddress',
    role: 'hp',
  ) {
    if (type == HealthcareType.clinique) {
      if (availableSpecialties.isEmpty) {
        throw ArgumentError('Clinics must have at least one specialty');
      }
      if (staffIds == null || staffIds!.isEmpty) {
        throw ArgumentError('Clinics must have staff doctors');
      }
    }

    if ((type == HealthcareType.medecin || type == HealthcareType.dentiste) &&
        specialty == null) {
      throw ArgumentError('Doctors/dentists require a specialty');
    }
  }

  HealthcareProfessional copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? wilaya,
    String? commune,
    String? exactAddress,
    HealthcareType? type,
    Specialty? specialty,
    List<Specialty>? availableSpecialties,
    List<String>? serviceIds,
    List<WeeklyAvailability>? weeklyAvailability,
    List<String>? ratingIds,
    List<String>? commentIds,
    List<String>? appointmentIds,
    List<String>? staffIds,
    String? licenseNumber,
    String? location, // Added to copyWith
  }) {
    return HealthcareProfessional(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      wilaya: wilaya ?? this.wilaya,
      commune: commune ?? this.commune,
      exactAddress: exactAddress ?? this.exactAddress,
      type: type ?? this.type,
      specialty: specialty ?? this.specialty,
      availableSpecialties: availableSpecialties ?? this.availableSpecialties,
      serviceIds: serviceIds ?? this.serviceIds,
      weeklyAvailability: weeklyAvailability ?? this.weeklyAvailability,
      ratingIds: ratingIds ?? this.ratingIds,
      commentIds: commentIds ?? this.commentIds,
      appointmentIds: appointmentIds ?? this.appointmentIds,
      staffIds: staffIds ?? this.staffIds,
      licenseNumber: licenseNumber ?? this.licenseNumber,
      location: location ?? this.location, // Added
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      ...super.toJson(),
      'type': type.name,
      'specialty': specialty?.name,
      'availableSpecialties': availableSpecialties.map((s) => s.name).toList(),
      'serviceIds': serviceIds,
      'weeklyAvailability': weeklyAvailability.map((avail) => avail.toJson()).toList(),
      'ratingIds': ratingIds,
      'commentIds': commentIds,
      'appointmentIds': appointmentIds,
      'staffIds': staffIds,
      'licenseNumber': licenseNumber,
      'wilaya': wilaya,
      'commune': commune,
      'exactAddress': exactAddress,
      'location': location, // Added
    };
  }

  factory HealthcareProfessional.fromJson(Map<String, dynamic> json) {
    return HealthcareProfessional(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      wilaya: json['wilaya'],
      commune: json['commune'],
      exactAddress: json['exactAddress'],
      type: HealthcareType.values.firstWhere(
            (e) => e.name == json['type'],
        orElse: () => HealthcareType.medecin,
      ),
      specialty: json['specialty'] != null
          ? Specialty.fromString(json['specialty'])
          : null,
      availableSpecialties: json['availableSpecialties'] != null
          ? (json['availableSpecialties'] as List)
          .map((s) => Specialty.fromString(s)!)
          .toList()
          : [],
      serviceIds: List<String>.from(json['serviceIds']),
      weeklyAvailability: (json['weeklyAvailability'] as List)
          .map((avail) => WeeklyAvailability.fromJson(avail))
          .toList(),
      ratingIds: List<String>.from(json['ratingIds']),
      commentIds: List<String>.from(json['commentIds']),
      appointmentIds: List<String>.from(json['appointmentIds']),
      staffIds: json['staffIds'] != null ? List<String>.from(json['staffIds']) : null,
      licenseNumber: json['licenseNumber'],
      location: json['location'] ?? '${json['wilaya']}, ${json['commune']}, ${json['exactAddress']}', // Added with fallback
    );
  }

  bool get isClinic => type == HealthcareType.clinique;
  String get typeDisplay => typeDisplayMap[type] ?? type.name;

  static const typeDisplayMap = {
    HealthcareType.medecin: "Médecin",
    HealthcareType.clinique: "Clinique",
    HealthcareType.centre_imagerie: "Centre d'imagerie",
    HealthcareType.laboratoire_analyse: "Laboratoire d'analyse",
    HealthcareType.infermier: "Infirmier",
    HealthcareType.pharmacie: "Pharmacie",
    HealthcareType.dentiste: "Dentiste",
  };

  @override
  String toString() {
    return 'HealthcareProfessional('
        'id: $id, '
        'name: $name, '
        'type: ${type.name}, '
        'specialty: ${specialty?.name}, '
        'availableSpecialties: ${availableSpecialties.map((s) => s.name)}, '
        'wilaya: $wilaya, '
        'commune: $commune, '
        'location: $location, ' // Added
        'services: ${serviceIds.length}, '
        'staff: ${staffIds?.length ?? 0})';
  }
}