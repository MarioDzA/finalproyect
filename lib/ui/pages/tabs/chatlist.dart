import 'package:finalproyect/data/model/user_model.dart';
import 'package:finalproyect/ui/controllers/admin_controller.dart';
import 'package:finalproyect/ui/controllers/auth_controller.dart';
import 'package:finalproyect/ui/controllers/chat_controller.dart';
import 'package:finalproyect/ui/pages/tabs/help.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatList extends StatefulWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  // obtenemos la instancia de los controladores
  AuthenticationController authenticationController = Get.find();
  ChatController chatController = Get.find();
  AdminController userController = Get.find();

  @override
  void initState() {
    // le decimos al userController que se suscriba a los streams
    userController.start();
    super.initState();
  }

  @override
  void dispose() {
    // le decimos al userController que se cierre los streams
    userController.stop();
    super.dispose();
  }

  Widget _item(AppUser element) {
    // Widget usado en la lista de los usuarios
    // mostramos el correo y uid
    return Card(
      margin: const EdgeInsets.all(4.0),
      child: ListTile(
        onTap: () {
          Get.to(() => HelpTab(arguments: [
                element.uid,
                element.email,
              ]));
        },
        title: Text(
          element.name,
        ),
        subtitle: Text(element.email),
      ),
    );
  }

  Widget _list() {
    // Un widget con La lista de los usuarios con una validación para cuándo la misma este vacia
    // la lista de usuarios la obtenemos del userController
    return GetX<AdminController>(builder: (controller) {
      var actualemail = authenticationController.userEmail();

      if (userController.users.length == 0) {
        return const Center(
          child: Text('No users'),
        );
      }

      if (actualemail == "admin@uninorte.com") {
        return ListView.builder(
          itemCount: userController.users.length,
          itemBuilder: (context, index) {
            var element = userController.users[index];
            return _item(element);
          },
        );
      } else {
        return const HelpTab(arguments: [
          "rgejbwrBdSQ1fsticV1DZ8IExDm1",
          "admin@uninorte.com",
        ]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Chat"),
          actions: const [],
        ),
        body: _list());
  }
}
