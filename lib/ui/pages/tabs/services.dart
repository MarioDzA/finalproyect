import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServicesTab extends StatefulWidget {
  const ServicesTab({super.key});

  @override
  State<ServicesTab> createState() => _ServicesTabState();
}

class _ServicesTabState extends State<ServicesTab> {
  Color mainTextColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 58, 71, 80),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 200,
              width: 400,
              child: OutlinedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 48, 56, 65)),
                  onPressed: () {
                    Get.offNamed("/restaurant_page");
                  },
                  child: const Text("Restaurants",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Raleway",
                        color: Colors.white,
                      ))),
            ),
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              height: 200,
              width: 400,
              child: OutlinedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 48, 56, 65)),
                  onPressed: () {
                    Get.offNamed("/auditoriums_page");
                  },
                  child: const Text(
                    "Auditoriums",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Raleway",
                        color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
