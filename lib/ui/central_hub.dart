import 'package:finalproyect/ui/controllers/admin_controller.dart';
import 'package:finalproyect/ui/pages/auth_page.dart';
import 'package:finalproyect/ui/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CentralHub extends StatelessWidget {
  CentralHub({Key? key}) : super(key: key);
  final AdminController adminController = Get.find();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            return const AuthPage();
          }
        });
  }
}
