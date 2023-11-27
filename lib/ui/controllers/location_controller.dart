import 'dart:async';
import 'package:finalproyect/data/model/block_model.dart';
import 'package:finalproyect/data/model/user_location.dart';
import 'package:finalproyect/DuseCase/locator_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController {
  LocatorService service = Get.find();

  final _blocks = <AppBlock>[].obs;
  final databaseRef = FirebaseDatabase.instance.ref();
  late StreamSubscription<DatabaseEvent> newEntryStreamLocationSubscription;
  late StreamSubscription<DatabaseEvent> updateEntryStreamLocationSubscription;

  var userLocation = UserLocation(
          latitude: 0, longitude: 0, time: const TimeOfDay(hour: 0, minute: 0))
      .obs;

  void startlocation() {
    _blocks.clear();

    newEntryStreamLocationSubscription =
        databaseRef.child("blocks").onChildAdded.listen(_onEntryAdded);
    updateEntryStreamLocationSubscription =
        databaseRef.child("blocks").onChildChanged.listen(_onEntryChanged);
  }

  void stopLocation() async {
    await newEntryStreamLocationSubscription.cancel();
    await updateEntryStreamLocationSubscription.cancel();
  }

  get blocks {
    return _blocks.toList();
  }

  Set<Marker> getMarkers() {
    return Set<Marker>.from(_blocks.map((appBlock) {
      return Marker(
        markerId: MarkerId(appBlock.id.toString()),
        position: LatLng(
          double.parse(appBlock.lat),
          double.parse(appBlock.long),
        ),
        infoWindow: InfoWindow(title: appBlock.name),
        visible: true,
      );
    }));
  }

  _onEntryAdded(DatabaseEvent event) {
    final json = event.snapshot.value as Map<dynamic, dynamic>;
    _blocks.add(AppBlock.fromJson(event.snapshot, json));
  }

  _onEntryChanged(DatabaseEvent event) {
    var oldEntry = _blocks.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    final json = event.snapshot.value as Map<dynamic, dynamic>;
    _blocks[_blocks.indexOf(oldEntry)] =
        AppBlock.fromJson(event.snapshot, json);
  }

  Future<void> getLocation() async {
    userLocation.value =
        await service.getLocation().onError((error, stackTrace) {
      return Future.error(error.toString());
    });
  }
}
