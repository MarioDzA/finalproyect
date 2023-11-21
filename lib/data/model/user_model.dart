import 'package:firebase_database/firebase_database.dart';

class AppUser {
  String? key;
  String email;
  String name;
  String uid;

  AppUser(this.key, this.email, this.name,this.uid);

  AppUser.fromJson(DataSnapshot snapshot, Map<dynamic, dynamic> json)
      : key = snapshot.key ?? "0",
        email = json['email'] ?? "email",
        name = json['name'] ?? "Name",
        uid = json['uid'] ?? "uid";

  toJson() {
    return {
      "email": email,
      "name": name,
      "uid": uid,
    };
  }
}