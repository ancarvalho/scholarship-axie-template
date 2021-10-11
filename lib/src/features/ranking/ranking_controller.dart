import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:scholarship/src/features/scholars/models/scholar_model.dart';
import 'package:scholarship/src/shared/core.dart';

class RankingController {
    final stateNotifier = ValueNotifier<PossibleStates>(PossibleStates.empty);
  set state(PossibleStates state) => stateNotifier.value = state;
  PossibleStates get state => stateNotifier.value;

  RankingController() {
    fromJson();
  }

  List<ScholarModel>? data = null;

  Future<String> getDummyData() async {
    return await rootBundle.loadString("assets/data/dummy_rank_scholars.json");
  }

  void fromJson() async {
    state = PossibleStates.loading;
    List response = json.decode(await getDummyData());
    data =
        List<ScholarModel>.from(response.map((e) => ScholarModel.fromMap(e)));
    state = PossibleStates.success;
  }
}