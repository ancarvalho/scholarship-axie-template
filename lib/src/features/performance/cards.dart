import 'package:flutter/material.dart';
import 'package:scholarship/src/features/performance/models/performance_model.dart';

class Cards extends StatelessWidget {
  final PerformanceModel performanceModel;
  const Cards({Key? key, required this.performanceModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            StatusCard(
                title: "Ranking",
                icon: Icons.emoji_flags_outlined,
                value: "${performanceModel.rank}"),
            SizedBox(
              width: 5,
            ),
            StatusCard(
                title: "Win Rate",
                icon: Icons.military_tech,
                value: "${performanceModel.winRate}"),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            StatusCard(
                title: "Trophies",
                icon: Icons.emoji_events,
                value: "${performanceModel.trophies}"),
          ],
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }

  Widget StatusCard(
      {required String title, required IconData icon, required String value}) {
    return StatefulBuilder(builder: (context, setState) {
      return Container(
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(20)),
          alignment: Alignment.center,
          height: 120,
          width: 200,
          child: ListTile(
            title: Text(
              "$title",
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            subtitle: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  "$value",
                  style: TextStyle(fontSize: 20),
                ),
                Icon(
                  icon,
                  size: 22,
                )
              ],
            ),
          ));
    });
  }
}
