import 'package:hng_authentication/src/models/user.dart';

class AppUser {
  final String id;
  String name;
  String email;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? credits;
  final String? cookie;

  @override
  String toString() => 'User Created Succesfully';

  AppUser({
    required this.id,
    required this.name,
    required this.email,
    this.createdAt,
    this.updatedAt,
    this.credits,
    this.cookie,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) => AppUser(
        id: json["id"],
        email: json["email"],
        credits: json["credits"],
        cookie: json["cookie"],
        name: json["name"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "credits": credits,
        "cookie": cookie,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };

  factory AppUser.fromAuthUser(User user) => AppUser(
        id: user.id,
        email: user.email,
        credits: user.credits,
        cookie: user.cookie,
        name: user.name,
        createdAt: user.createdAt,
        updatedAt: user.updatedAt,
      );
}
