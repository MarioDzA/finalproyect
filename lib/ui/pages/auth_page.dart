import 'package:flutter/material.dart';

import 'login.dart';
import 'signup.dart';

// LOGIN y CREATE
class AuthPage extends StatefulWidget {
  const AuthPage({super.key});
  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  static int mainPageIndex = 0;
  final screens = <Widget>[];
  @override
  void initState() {
    super.initState();
    screens.add(LoginBox(changeMainPageIndex: changeMainPageIndex));
    screens.add(CreateBox(changeMainPageIndex: changeMainPageIndex));
  }

  void changeMainPageIndex(int newIndex) {
    setState(() {
      mainPageIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/norte1.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(child: screens[mainPageIndex]),
      ),
    );
  }
}
