import 'dart:io';

class Vehicle {
  final String? id;
  final String name;
  final File image;

  Vehicle({
    this.id,
    required this.name,
    required this.image,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      id: json['id'] as String?,
      name: json['name'] as String,
      image: File(json['image'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image.path,
    };
  }
}
