import 'package:flutter/material.dart';

class ServicePage extends StatefulWidget {
  final Function(int) changeMainPageIndex;
  const ServicePage({super.key, required this.changeMainPageIndex});
  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 200,
              width: 400,
              child: OutlinedButton(
                  style: ElevatedButton.styleFrom(
                      side: const BorderSide(color: Colors.white),
                      backgroundColor:
                          const Color.fromARGB(255, 226, 222, 222)),
                  onPressed: () {
                    widget.changeMainPageIndex(1);
                  },
                  child: const Text("Restaurants",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Raleway",
                        color: Colors.black,
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
                      side: const BorderSide(color: Colors.white),
                      backgroundColor:
                          const Color.fromARGB(255, 226, 222, 222)),
                  onPressed: () {
                    widget.changeMainPageIndex(2);
                  },
                  child: const Text("Points of interest",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Raleway",
                          color: Colors.black))),
            )
          ],
        ),
      ),
    );
  }
}
