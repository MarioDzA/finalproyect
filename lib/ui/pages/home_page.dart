import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 48, 56, 65),
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
          style: TextStyle(color: Colors.white,),
        ),
    ),body: Center(child: ElevatedButton(onPressed: () {
      Get.offNamed('/auth_page');
    }, child: Text('Back')),));
  }
}
