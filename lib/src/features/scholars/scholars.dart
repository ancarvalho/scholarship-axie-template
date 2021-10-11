import 'package:flutter/material.dart';
import 'package:scholarship/src/features/scholars/scholar.dart';
import 'package:scholarship/src/features/scholars/scholars_controller.dart';
import 'package:scholarship/src/shared/possible_states.dart';

class Scholars extends StatefulWidget {
  const Scholars({Key? key}) : super(key: key);

  @override
  _ScholarsState createState() => _ScholarsState();
}

class _ScholarsState extends State<Scholars> {
  late ScholarsController controller;
  @override
  void initState() {
    controller = ScholarsController();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == PossibleStates.success) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Scholars"),
          centerTitle: true,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: ListView.builder(
              itemCount: controller.data!.length,
              itemBuilder: (context, index) {
                return Container(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Scholar(
                    scholar: controller.data![index],
                  ),
                ));
              }),
        ),
      );
    } else {
      return Scaffold(
          body: Center(
        child: CircularProgressIndicator(),
      ));
    }
  }
}
