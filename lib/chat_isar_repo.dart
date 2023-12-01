import 'dart:async';
import 'dart:developer';

import 'package:isar/isar.dart';
import 'package:shapefile/model.dart';

class IsarRepo {
  IsarRepo._();
  static final instance = IsarRepo._();

  Future<void> postData(List<IndianStates>? states) async {
    if (states == null || states.isEmpty) {
      return;
    }

    var isar = Isar.getInstance('db');
    final stateCollection = isar!.collection<IsarModel>();

    final allData = await stateCollection.where().findAll();
    if (allData.isEmpty) {
      final statesMap = {for (var state in states) state.state: state};

      await isar.writeTxn(() async {
        for (var newState in statesMap.values) {
          var isarModel = IsarModel(
              state: newState.state, sarvayCount: newState.sarvayCount);
          await stateCollection.put(isarModel);
          log("Inserted ${newState.state}");
        }
      });
    }
  }

  Future<List<IndianStates>?> fetchStates() async {
    var isar = Isar.getInstance('db');

    final stateCollection = isar!.collection<IsarModel>();

    final lists = await stateCollection
        .where()
        .findAll(); // Get all items from the collection

    List<IndianStates> list = [];

    list = lists.map((result) {
      return IndianStates(result.state, sarvayCount: result.sarvayCount);
    }).toList();

    return list;
  }

  Future<String> updateSarvayCount(
      String newState, String newSarvayCount) async {
    var isar = Isar.getInstance('db');
    final stateCollection = isar!.collection<IsarModel>();
    final isarModel =
        stateCollection.where().filter().stateEqualTo(newState).findFirstSync();

    if (isarModel != null) {
      isarModel.sarvayCount = newSarvayCount;

      await isar.writeTxn(() async {
        await stateCollection.put(isarModel);
      });
    }
    return newSarvayCount;
  }
}
