import 'package:finalproyect/ui/controllers/auth_controller.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 0;
  final GlobalKey _bottomNavigationKey = GlobalKey();
  final AuthenticationController authenticationController = Get.find();

  @override
  Widget build(BuildContext context) {
    _logout() async {
      try {
        await authenticationController.logout();
      } catch (e) {
        logError(e);
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            _logout();
          },
        ),
        backgroundColor: const Color.fromARGB(255, 48, 56, 65),
        centerTitle: true,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(0.1),
          child: Divider(
            color: Color.fromARGB(10, 48, 56, 65),
            height: 0.0,
          ),
        ),
        title: const Text(
          'Uninorte Help',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 50.0,
        items: const <Widget>[
          SizedBox(
            height: 45,
            child: Column(children: [
              Icon(Icons.travel_explore_outlined, size: 25),
              Text(
                "Map",
              )
            ]),
          ),
          SizedBox(
            height: 45,
            child: Column(children: [
              Icon(Icons.info_outlined, size: 25),
              Text(
                "Services",
              )
            ]),
          ),
          SizedBox(
            height: 45,
            child: Column(children: [
              Icon(Icons.contact_support_outlined, size: 25),
              Text(
                "Help",
              )
            ]),
          ),
        ],
        color: const Color.fromARGB(255, 58, 71, 80),
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.ease,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: Container(
        color: Colors.white,
        child: Center(),
      ),
    );
  }
}
