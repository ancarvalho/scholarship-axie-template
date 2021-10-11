import 'package:flutter/material.dart';
import 'package:scholarship/src/features/ranking/trophie_color.dart';
import 'package:scholarship/src/features/scholars/models/scholar_model.dart';

class PvpRanking extends StatefulWidget {
  final List<ScholarModel> scholars;
  const PvpRanking({Key? key, required this.scholars}) : super(key: key);

  @override
  _PvpRankingState createState() => _PvpRankingState();
}

class _PvpRankingState extends State<PvpRanking> {
  

  @override
  void initState() {
    super.initState();
    sortHightoLow();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: ListView.builder(
              itemCount: widget.scholars.length,
              itemBuilder: (context, index) {
                TrophyColor? trophie = TrophyColor.getTrophyColor(index);
                return Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Wrap(
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          trophie != null
                              ? Icon(
                                  Icons.emoji_events,
                                  color: trophie.color,
                                  size: 22,
                                )
                              : SizedBox(
                                  width: 22,
                                ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "${index + 1}º",
                            style: TextStyle(
                                fontSize: 22,
                                color: Theme.of(context).accentColor),
                          ),
                        ],
                      ),
                      Spacer(flex: 1),
                      Text(
                        "${widget.scholars[index].name}",
                        style: TextStyle(fontSize: 22),
                      ),
                      Spacer(flex: 7),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            "${widget.scholars[index].trophies}",
                            style: TextStyle(fontSize: 22),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Icon(
                            Icons.emoji_events,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              })),
    );
  }

  sortHightoLow() {
    widget.scholars.sort((f, l) => l.trophies.compareTo(f.trophies));
  }
}
