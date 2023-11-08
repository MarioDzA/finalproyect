import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    Color uiColor = const Color.fromARGB(255, 0, 51, 124);
    Color iconColor = Colors.white;
    Color selIconColor = Colors.white;

    return Scaffold();
  }
}
