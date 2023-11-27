import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class UserLocation {
  final double latitude;
  final double longitude;
  final TimeOfDay time;

  UserLocation(
      {required this.latitude, required this.longitude, required this.time});

  static UserLocation fromPosition(Position position, TimeOfDay date) {
    return UserLocation(
        latitude: position.latitude, longitude: position.longitude, time: date);
  }
}
