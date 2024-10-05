import 'dart:io';

class Vehicle {
  final int? id;
  final String name;
  final File image;
  final DateTime createdAt;

  Vehicle({
    this.id,
    required this.name,
    required this.image,
    required this.createdAt,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      id: json['id'] as int?,
      name: json['name'] as String,
      image: File(json['image'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image.path,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
