class Ticket {
  final int? id;
  final String numberPlate;
  final int vehicleId;
  final int userId;
  final DateTime createdAt;

  Ticket({
    this.id,
    required this.numberPlate,
    required this.vehicleId,
    required this.userId,
    required this.createdAt,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      id: json['id'] as int?,
      numberPlate: json['number_plate'] as String,
      vehicleId: json['vehicle_id'] as int,
      userId: json['user_id'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'number_plate': numberPlate,
      'vehicle_id': vehicleId,
      'user_id': userId,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
