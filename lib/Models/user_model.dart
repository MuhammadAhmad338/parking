class UserModel {
  final String? id;
  final String name;
  final String cnic;
  final String pic;
  final String pin;
  final bool isAdmin;

  UserModel({
    this.id,
    required this.name,
    required this.cnic,
    required this.pic,
    required this.pin,
    required this.isAdmin,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'cnic': cnic,
      'pic': pic,
      'pin': pin,
      'isAdmin': isAdmin,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      cnic: json['cnic'],
      pic: json['pic'],
      pin: json['pin'],
      isAdmin: json['isAdmin'],
    );
  }
}
