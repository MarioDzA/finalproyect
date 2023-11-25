import 'package:firebase_database/firebase_database.dart';

class AppBlock {
  String? key;
  String name;
  String description;
  String howto;
  int id;
  String img;

  AppBlock(this.key, this.description, this.name,this.id, this.img, this.howto);

  AppBlock.fromJson(DataSnapshot snapshot, Map<dynamic, dynamic> json)
      : key = snapshot.key ?? "0",
        name = json['name'] ?? "Name",
        description = json['description'] ?? "description",
        howto = json['howto'] ?? "howto",
        img = json['img'] ?? "img",
        id = json['id'] ?? "id";

  toJson() {
    return {
      "description": description,
      "name": name,
      "howto": howto,
      "img": img,
      "uid": id,
    };
  }
}