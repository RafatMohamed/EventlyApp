class AuthModel {
  String? userId;
  String name;
  String email;
  AuthModel({required this.name, required this.email, this.userId});

  factory AuthModel.fromFirebase(Map<String, dynamic> json) {
    return AuthModel(
      name: json["name"],
      email: json["email"],
      userId: json["userId"],
    );
  }

  Map<String, dynamic> toFirebase() => {
    "name": name,
    "email": email,
    "userId": userId,
  };
}
