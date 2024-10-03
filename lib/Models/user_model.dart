class UserModel {
  final String name;
  final String cnic;
  final String pic;
  final String pin;
  final bool isAdmin;

  UserModel({
    required this.name,
    required this.cnic,
    required this.pic,
    required this.pin,
    required this.isAdmin,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'cnic': cnic,
      'pic': pic,
      'pin': pin,
      'isAdmin': isAdmin,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      cnic: json['cnic'],
      pic: json['pic'],
      pin: json['pin'],
      isAdmin: json['isAdmin'],
    );
  }
}
