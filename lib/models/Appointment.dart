import 'package:flutter/material.dart';

class Appointment {
  final String id;
  final String patientId;
  final String healthcareProfessionalId;
  final String serviceId;
  final DateTime date;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final String status; // 'scheduled', 'completed', 'canceled'

  Appointment({
    required this.id,
    required this.patientId,
    required this.healthcareProfessionalId,
    required this.serviceId,
    required this.date,
    required this.startTime,
    required this.endTime,
    this.status = 'scheduled',
  });

  Appointment copyWith({
    String? id,
    String? patientId,
    String? healthcareProfessionalId,
    String? serviceId,
    DateTime? date,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
    String? status,
  }) {
    return Appointment(
      id: id ?? this.id,
      patientId: patientId ?? this.patientId,
      healthcareProfessionalId:
          healthcareProfessionalId ?? this.healthcareProfessionalId,
      serviceId: serviceId ?? this.serviceId,
      date: date ?? this.date,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'patientId': patientId,
      'healthcareProfessionalId': healthcareProfessionalId,
      'serviceId': serviceId,
      'date': date.toIso8601String(),
      'startTime': '${startTime.hour}:${startTime.minute}',
      'endTime': '${endTime.hour}:${endTime.minute}',
      'status': status,
    };
  }

  factory Appointment.fromJson(Map<String, dynamic> json) {
    final startParts = (json['startTime'] as String).split(':');
    final endParts = (json['endTime'] as String).split(':');

    return Appointment(
      id: json['id'],
      patientId: json['patientId'],
      healthcareProfessionalId: json['healthcareProfessionalId'],
      serviceId: json['serviceId'],
      date: DateTime.parse(json['date']),
      startTime: TimeOfDay(
        hour: int.parse(startParts[0]),
        minute: int.parse(startParts[1]),
      ),
      endTime: TimeOfDay(
        hour: int.parse(endParts[0]),
        minute: int.parse(endParts[1]),
      ),
      status: json['status'],
    );
  }

  @override
  String toString() {
    return 'Appointment(id: $id, patientId: $patientId, healthcareProfessionalId: $healthcareProfessionalId, serviceId: $serviceId, date: $date, startTime: $startTime, endTime: $endTime, status: $status)';
  }
}
