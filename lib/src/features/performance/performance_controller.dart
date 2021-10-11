import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:scholarship/src/features/performance/models/performance_model.dart';
import 'package:scholarship/src/shared/core.dart';

// Change to Notifier
class PerformanceController {
  final stateNotifier = ValueNotifier<PossibleStates>(PossibleStates.empty);
  set state(PossibleStates state) => stateNotifier.value = state;
  PossibleStates get state => stateNotifier.value;

  PerformanceController(){
    fromJson();
  }

  PerformanceModel? data = null;

  Future<String> getDummyData() async {
    return await rootBundle.loadString("assets/data/dummy_my_performace.json");
  }

  void fromJson() async {
    state = PossibleStates.loading;
    data = PerformanceModel.fromJson(await getDummyData());
    state = PossibleStates.success;
  }

}