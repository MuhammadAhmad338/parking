// ignore_for_file: public_member_api_docs, sort_constructors_first
class Ticket {
  final String? id;
  final String number_plate;
  final String vehicle_type;
  final String userid;
  final String username;
  final DateTime date;

  Ticket(
      {this.id,
      required this.number_plate,
      required this.vehicle_type,
      required this.userid,
      required this.username,
      required this.date});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      'number_plate': number_plate,
      'vehicle_type': vehicle_type,
      'username': username,
      'userid': userid,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory Ticket.fromMap(Map<String, dynamic> map) {
    return Ticket(
      id: map['id'] as String?,
      number_plate: map['number_plate'] as String,
      vehicle_type: ['vehicle_type'] as String,
      username: ['username'] as String,
      userid: ['user'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
    );
  }
}
