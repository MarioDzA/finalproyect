import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

// Controlador usado para manejar los usuarios del chat
class UserController extends GetxController {
  // lista en la que se almacenan los uaurios, la misma es observada por la UI
  final databaseRef = FirebaseDatabase.instance.ref();
  // método para crear un nuevo usuario

  Future<void> createUser(name, email, uid) async {
    logInfo("Creating user in realTime for $email and $uid");
    try {
      await databaseRef
          .child('userList')
          .push()
          .set({'name': name, 'email': email, 'uid': uid});
    } catch (error) {
      logError(error);
      return Future.error(error);
    }
  }
}
