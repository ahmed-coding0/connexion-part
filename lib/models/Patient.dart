import 'User.dart';
import 'MedicalDocument.dart';

class Patient extends User {
  final List<MedicalDocument> medicalRecord;
  final List<String> appointmentIds;

  Patient({
    required String id,
    required String name,
    required String email,
    required String password,
    required String location,
    required this.medicalRecord,
    required this.appointmentIds,
  }) : super(
         id: id,
         name: name,
         email: email,
         password: password,
         location: location,
         role: 'patient',
       );

  Patient copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? location,
    List<MedicalDocument>? medicalRecord,
    List<String>? appointmentIds,
  }) {
    return Patient(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      location: location ?? this.location,
      medicalRecord: medicalRecord ?? this.medicalRecord,
      appointmentIds: appointmentIds ?? this.appointmentIds,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      ...super.toJson(),
      'medicalRecord': medicalRecord.map((doc) => doc.toJson()).toList(),
      'appointmentIds': appointmentIds, // Just store IDs
    };
  }

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      location: json['location'],
      medicalRecord:
          (json['medicalRecord'] as List)
              .map((doc) => MedicalDocument.fromJson(doc))
              .toList(),
      appointmentIds: List<String>.from(json['appointmentIds']), // Just IDs
    );
  }

  @override
  String toString() {
    return 'Patient(id: $id, name: $name, email: $email, password: ****, '
        'location: $location, medicalRecords: ${medicalRecord.length}, '
        'appointmentIds: ${appointmentIds.length})';
  }
}
