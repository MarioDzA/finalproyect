import 'package:finalproyect/ui/controllers/admin_controller.dart';
import 'package:finalproyect/ui/controllers/auth_controller.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';
import 'package:get/get.dart';

//IMPORTAR TABS
// import 'package:finalproyect/ui/pages/tabs/help.dart';
import 'package:finalproyect/ui/pages/tabs/chatlist.dart';
import 'package:finalproyect/ui/pages/tabs/map.dart';
import 'package:finalproyect/ui/pages/tabs/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 0;
  final GlobalKey _bottomNavigationKey = GlobalKey();
  final AuthenticationController authenticationController = Get.find();
  final AdminController adminController = Get.find();

  final screens = const [
    MapTab(),
    ServicesTab(),
    ChatList(),
  ];

  @override
  Widget build(BuildContext context) {
    adminController.getUserNameByEmail(authenticationController.userEmail());

    logout() async {
      try {
        await authenticationController.logout();
      } catch (e) {
        logError(e);
      }
    }

    var name = adminController.userName.value;

    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
              color: Colors.white,
              onPressed: logout,
              icon: const Icon(Icons.logout_outlined),
            ),
          ],
          backgroundColor: const Color.fromARGB(255, 48, 56, 65),
          centerTitle: true,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(0.1),
            child: Divider(
              color: Color.fromARGB(255, 58, 71, 80),
              height: 0.0,
            ),
          ),
          title: Column(
            children: [
              const Text(
                'Uninorte Help',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Text(
                'Welcome back: $name',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          )),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 65.0,
        items: const <Widget>[
          SizedBox(
            height: 45,
            child: Column(children: [
              Icon(
                Icons.travel_explore_outlined,
                size: 25,
                color: Colors.white,
              ),
              Text(
                "Map",
                style: TextStyle(color: Colors.white),
              )
            ]),
          ),
          SizedBox(
            height: 45,
            child: Column(children: [
              Icon(
                Icons.info_outlined,
                size: 25,
                color: Colors.white,
              ),
              Text(
                "Services",
                style: TextStyle(color: Colors.white),
              )
            ]),
          ),
          SizedBox(
            height: 45,
            child: Column(children: [
              Icon(
                Icons.contact_support_outlined,
                size: 25,
                color: Colors.white,
              ),
              Text(
                "Help",
                style: TextStyle(color: Colors.white),
              )
            ]),
          ),
        ],
        color: const Color.fromARGB(255, 48, 56, 65),
        buttonBackgroundColor: const Color.fromARGB(255, 58, 71, 80),
        backgroundColor: const Color.fromARGB(255, 58, 71, 80),
        animationCurve: Curves.ease,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          if (index == 0) {}
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: Container(
        color: const Color.fromARGB(255, 58, 71, 80),
        child: Center(
          child: screens[_page],
        ),
      ),
    );
  }
}
