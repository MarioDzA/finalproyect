import 'package:finalproyect/ui/pages/auditoriums_page.dart';
import 'package:finalproyect/ui/pages/restaurant_page.dart';
import 'package:finalproyect/ui/pages/service_page.dart';
import 'package:flutter/material.dart';

//import 'package:get/get.dart';

class ServicesTab extends StatefulWidget {
  const ServicesTab({super.key});

  @override
  State<ServicesTab> createState() => _ServicesTabState();
}

class _ServicesTabState extends State<ServicesTab> {
  Color mainTextColor = Colors.black;
  static int mainPageIndex = 0;
  final screens = <Widget>[];
  @override
  void initState() {
    super.initState();
    screens.add(ServicePage(changeMainPageIndex: changeMainPageIndex));
    screens.add(RestaurantPage(changeMainPageIndex: changeMainPageIndex));
    screens.add(AuditoriumsPage(changeMainPageIndex: changeMainPageIndex));
  }

  void changeMainPageIndex(int newIndex) {
    setState(() {
      mainPageIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: screens[mainPageIndex]),
    );
  }
}
