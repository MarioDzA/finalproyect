import 'package:flutter/material.dart';

class AuditoriumsPage extends StatefulWidget {
  final Function(int) changeMainPageIndex;
  const AuditoriumsPage({super.key, required this.changeMainPageIndex});
  @override
  State<AuditoriumsPage> createState() => _AuditoriumsPageState();
}

class _AuditoriumsPageState extends State<AuditoriumsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 48, 56, 65),
        title: const Text(
          "Restaurants",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: BackButton(
          onPressed: () {
            widget.changeMainPageIndex(0);
          },
        ),
      ),
      body: Center(
          child: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(255, 548, 56, 65)),
                color: const Color.fromARGB(255, 58, 71, 80)),
            height: 100,
            child: const Center(
                child: Column(
              children: [
                Text(
                  "1966",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                Text(
                  "Restaurantes para cocteles y eventos institucionales",
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "Ubicado en el segundo pido del bloque F",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                )
              ],
            )),
          ),
        ],
      )),
    );
  }
}
