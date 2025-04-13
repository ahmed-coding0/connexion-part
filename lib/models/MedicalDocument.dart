class MedicalDocument {
  final String id;
  final String type;
  final String filePath;
  final DateTime uploadDate;
  final String patientId;

  MedicalDocument({
    required this.id,
    required this.type,
    required this.filePath,
    required this.uploadDate,
    required this.patientId,
  });

  MedicalDocument copyWith({
    String? id,
    String? type,
    String? filePath,
    DateTime? uploadDate,
    String? patientId,
  }) {
    return MedicalDocument(
      id: id ?? this.id,
      type: type ?? this.type,
      filePath: filePath ?? this.filePath,
      uploadDate: uploadDate ?? this.uploadDate,
      patientId: patientId ?? this.patientId,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'filePath': filePath,
      'uploadDate': uploadDate.toIso8601String(),
      'patientId': patientId,
    };
  }

  factory MedicalDocument.fromJson(Map<String, dynamic> json) {
    return MedicalDocument(
      id: json['id'],
      type: json['type'],
      filePath: json['filePath'],
      uploadDate: DateTime.parse(json['uploadDate']),
      patientId: json['patientId'],
    );
  }

  @override
  String toString() {
    return 'MedicalDocument(id: $id, type: $type, filePath: $filePath, uploadDate: $uploadDate, patientId: $patientId)';
  }
}
