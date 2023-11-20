import 'package:flutter/material.dart';

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
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 200,
              width: 400,
              child: OutlinedButton(
                  onPressed: () {},
                  child: const Text(
                    "Restaurants",
                    style: TextStyle(fontSize: 20, fontFamily: "Raleway"),
                  )),
            ),
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              height: 200,
              width: 400,
              child: OutlinedButton(
                  onPressed: () {},
                  child: const Text(
                    "Auditoriums",
                    style: TextStyle(fontSize: 20),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
