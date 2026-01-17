class UserModel {
  final int id;
  final String name;
  final String email;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
  });

  // From API JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }

  // To JSON (for storage / API)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}
