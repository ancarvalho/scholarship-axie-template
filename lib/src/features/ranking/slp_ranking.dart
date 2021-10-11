import 'package:flutter/material.dart';
import 'package:scholarship/src/features/ranking/trophie_color.dart';
import 'package:scholarship/src/features/scholars/models/scholar_model.dart';

class SlpRanking extends StatefulWidget {
  final List<ScholarModel> scholars;
  const SlpRanking({Key? key, required this.scholars}) : super(key: key);

  @override
  _SlpRankingState createState() => _SlpRankingState();
}

class _SlpRankingState extends State<SlpRanking> {

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
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Wrap(
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
                      alignment: WrapAlignment.end,
                      children: [
                        Text(
                          "${widget.scholars[index].totalSlp}",
                          style: TextStyle(fontSize: 22),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Image.asset(
                          "assets/images/slp.png",
                          height: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }

  sortHightoLow() {
    widget.scholars.sort((f, l) => l.totalSlp.compareTo(f.totalSlp));
  }
}
