import 'dart:async';
import 'package:finalproyect/data/model/block_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  final _blocks = <AppBlock>[].obs;
  final databaseRef = FirebaseDatabase.instance.ref();
  late StreamSubscription<DatabaseEvent> newEntryStreamLocationSubscription;
  late StreamSubscription<DatabaseEvent> updateEntryStreamLocationSubscription;
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
}
