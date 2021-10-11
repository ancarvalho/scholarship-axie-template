import 'package:flutter/material.dart';
import 'package:scholarship/src/features/ranking/pvp_ranking.dart';
import 'package:scholarship/src/features/ranking/ranking_controller.dart';
import 'package:scholarship/src/features/ranking/slp_ranking.dart';
import 'package:scholarship/src/shared/possible_states.dart';

class Ranking extends StatefulWidget {
  const Ranking({Key? key}) : super(key: key);

  @override
  _RankingState createState() => _RankingState();
}

class _RankingState extends State<Ranking> {
  late RankingController controller;
  @override
  void initState() {
    controller = RankingController();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == PossibleStates.success) {
      return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                new SliverAppBar(
                  title: Text('Ranking'),
                  centerTitle: true,
                  pinned: true,
                  floating: true,
                  bottom: TabBar(
                    indicatorColor: Color(0xFF0047B3),
                    isScrollable: true,
                    tabs: ["PVP Ranking", "Farm Ranking"]
                        .map((e) => Tab(
                              child: Text(e),
                            ))
                        .toList(),
                  ),
                ),
              ];
            },
            body: TabBarView(children: [
              PvpRanking(
                scholars: controller.data!,
              ),
              SlpRanking(scholars: controller.data!)
            ]),
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
