import 'package:finalproyect/data/model/block_model.dart';
import 'package:finalproyect/ui/controllers/location_controller.dart';
import 'package:finalproyect/ui/pages/blockinfo_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MapTab extends StatefulWidget {
  const MapTab({super.key});

  @override
  State<MapTab> createState() => _MapTabState();
}

class _MapTabState extends State<MapTab> {
  LocationController locationController = Get.find();
  @override
  void initState() {
    locationController.startlocation();
    super.initState();
  }

  @override
  void dispose() {
    locationController.stopLocation();
    super.dispose();
  }

  Widget _item(AppBlock element) {
    return Card(
      margin: const EdgeInsets.all(4.0),
      child: ListTile(
        onTap: () {
          Get.to(BlockInfoPage(
              arguments:           [
            element.id.toString(),
            element.name,
            element.description,
            element.howto,
            element.img,
          ]));
        },
        title: Text(
          element.name,
        ),
        subtitle: Text(element.id.toString()),
      ),
    );
  }

  Widget _list() {
    return GetX<LocationController>(builder: (controller) {
      if (locationController.blocks.length == 0) {
        return const Center(
          child: Text('No blocks'),
        );
      }

      return ListView.builder(
        itemCount: locationController.blocks.length,
        itemBuilder: (context, index) {
          var element = locationController.blocks[index];
          return _item(element);
        },
      );
    });
  }

  Color mainTextColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(children: [
          const Image(
            image: AssetImage(
              "assets/nortemap.png",
            ),
            fit: BoxFit.cover,
          ),
          Expanded(child: _list())
        ]),
      ),
    );
  }
}
