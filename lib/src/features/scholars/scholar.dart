import 'package:flutter/material.dart';
import 'package:scholarship/src/features/scholars/models/scholar_model.dart';

class Scholar extends StatelessWidget {
  final ScholarModel scholar;
  const Scholar({Key? key, required this.scholar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  // Text(""),
                  Spacer(
                    flex: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                                text: "Trophies: ${scholar.trophies}",
                                style: TextStyle(
                                    color: Theme.of(context).accentColor)),
                          ),
                          Icon(
                            Icons.emoji_events,
                            size: 16,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              text: "Ranking: ${scholar.ranking}",
                              style: TextStyle(
                                  color: Theme.of(context).accentColor),
                            ),
                          ),
                          Icon(
                            Icons.military_tech,
                            size: 16,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(
                    flex: 3,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                                text: "Today: ${scholar.todaySlp}",
                                style: TextStyle(
                                    color: Theme.of(context).accentColor)),
                          ),
                          Image.asset(
                            "assets/images/slp.png",
                            height: 16,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          RichText(
                              text: TextSpan(
                            text: "Mean: ${scholar.meanSlp}",
                            style:
                                TextStyle(color: Theme.of(context).accentColor),
                          )),
                          Image.asset(
                            "assets/images/slp.png",
                            height: 16,
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 4,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${scholar.name}",
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 18,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
