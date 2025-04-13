class WeeklyAvailability {
  final String id;
  final String healthcareProfessionalId;
  final Map<String, List<int>> availability;

  WeeklyAvailability({
    required this.id,
    required this.healthcareProfessionalId,
    required this.availability,
  }) {
    // Initialize with all days if not provided
    const daysOfWeek = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];

    for (final day in daysOfWeek) {
      availability.putIfAbsent(day, () => List.filled(24, 0));
    }

    // Validate each day has exactly 24 hours
    for (final entry in availability.entries) {
      if (entry.value.length != 24) {
        throw ArgumentError('Each day must have exactly 24 time slots');
      }
    }
  }

  WeeklyAvailability copyWith({
    String? id,
    String? healthcareProfessionalId,
    Map<String, List<int>>? availability,
  }) {
    return WeeklyAvailability(
      id: id ?? this.id,
      healthcareProfessionalId:
          healthcareProfessionalId ?? this.healthcareProfessionalId,
      availability: availability ?? Map.from(this.availability),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'healthcareProfessionalId': healthcareProfessionalId,
      'availability': availability,
    };
  }

  factory WeeklyAvailability.fromJson(Map<String, dynamic> json) {
    return WeeklyAvailability(
      id: json['id'],
      healthcareProfessionalId: json['healthcareProfessionalId'],
      availability: (json['availability'] as Map).map(
        (k, v) => MapEntry(k as String, List<int>.from(v)),
      ),
    );
  }

  bool isAvailable(String day, int hour) {
    if (hour < 0 || hour > 23) return false;
    return availability[day]?[hour] == 1 ?? false;
  }

  void setAvailable(String day, int hour, bool available) {
    if (hour >= 0 && hour < 24) {
      availability[day]?[hour] = available ? 1 : 0;
    }
  }

  @override
  String toString() {
    return 'WeeklyAvailability(id: $id, healthcareProfessionalId: $healthcareProfessionalId, '
        'availability: $availability)';
  }
}
