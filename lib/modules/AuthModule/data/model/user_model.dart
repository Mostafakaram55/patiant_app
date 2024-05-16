class UserModel{
  final String name;
  final String email;
  final String phone;
  final String address;
  final String uId;
  UserModel({
    required this.name,
    required this.email,
    required this.uId,
    required this.phone,
    required this.address
});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      phone: json['phone'],
      name: json['fullName'],
      uId: json['uId'],
      address: json['address']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fullName': name,
      'email': email,
      'phone': phone,
      'uId': uId,
     'address':address
    };
  }
}