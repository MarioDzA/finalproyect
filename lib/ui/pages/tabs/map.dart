import 'package:finalproyect/data/model/block_model.dart';
import 'package:finalproyect/ui/controllers/location_controller.dart';
import 'package:finalproyect/ui/pages/blockinfo_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapTab extends StatefulWidget {
  const MapTab({super.key});

  @override
  State<MapTab> createState() => _MapTabState();
}

class _MapTabState extends State<MapTab> {
  Set<Marker> markers = {};

  LocationController locationController = Get.find();
  final LatLng _center = const LatLng(11.019316882971111, -74.8502691602245);

  late GoogleMapController mapController;
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    locationController.startlocation();
    _setupMap();
    super.initState();
  }

  @override
  void dispose() {
    locationController.stopLocation();
    super.dispose();
  }

  void _setupMap() async {
    await locationController.getLocation();
    setState(() {
      markers = locationController.getMarkers();
    });
  }

  Widget _item(AppBlock element) {
    return Card(
      margin: const EdgeInsets.all(4.0),
      child: ListTile(
        onTap: () {
          Get.to(BlockInfoPage(arguments: [
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
          markers = locationController.getMarkers();
          return _item(element);
        },
      );
    });
  }

  Color mainTextColor = Colors.black;
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(children: [
            Expanded(
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 17.0,
                ),
                markers: {
                  Marker(
                      markerId: const MarkerId("Me"),
                      position: LatLng(
                          locationController.userLocation.value.latitude,
                          locationController.userLocation.value.longitude),
                      infoWindow: const InfoWindow(
                        title: "Me",
                        snippet: "Me",
                      )),
                },
                // Add more markers as needed
              ),
            ),
            Expanded(child: _list())
          ]),
        ),
      );
}
