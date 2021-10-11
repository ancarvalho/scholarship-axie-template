import 'package:flutter/material.dart';
import 'package:scholarship/src/features/performance/models/performance_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:ui' as ui;

class RadialWithStatus extends StatelessWidget {
  final PerformanceModel performanceModel;
  const RadialWithStatus({Key? key, required this.performanceModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    late List<Color> colors = const <Color>[
      Color(0xff0066B2),
      Color(0xff4B9CD3),
      Color(0xff1CA9C9),
    ];
    late List<double> stops = <double>[0.3, 0.6, 0.9];
    // value not in json because it's may be a scholar rule not a performance detail
    int metaSLP = 150;
    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Wrap(
                alignment: WrapAlignment.center,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: "${performanceModel.todaySlp}\n",
                        children: [
                          TextSpan(
                              text: "/$metaSLP", style: TextStyle(fontSize: 12))
                        ],
                        style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).accentColor)),
                  ),
                  Image.asset(
                    "assets/images/slp.png",
                    height: 40,
                  ),
                ],
              ),
              Container(
                height: 180,
                width: 175,
                child: SfCircularChart(
                  tooltipBehavior: TooltipBehavior(
                      enable: true, header: "", format: "point.y / 150"),
                  onCreateShader: (ChartShaderDetails chartShaderDetails) {
                    return ui.Gradient.sweep(
                        chartShaderDetails.outerRect.center,
                        colors,
                        stops,
                        TileMode.clamp,
                        _degreeToRadian(0),
                        _degreeToRadian(360),
                        _resolveTransform(
                            chartShaderDetails.outerRect, TextDirection.ltr));
                  },
                  series: getRadialBar(performanceModel.todaySlp),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                alignment: WrapAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                        text: "Total SLP: ",
                        children: [
                          TextSpan(text: "${performanceModel.totalSlp}")
                        ],
                        style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).accentColor)),
                  ),
                  Image.asset(
                    "assets/images/slp.png",
                    height: 20,
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Wrap(
                alignment: WrapAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "SLP Mean: ",
                      children: [TextSpan(text: "${performanceModel.meanSlp}")],
                      style: TextStyle(
                          fontSize: 20, color: Theme.of(context).accentColor),
                    ),
                  ),
                  Image.asset(
                    "assets/images/slp.png",
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  double _degreeToRadian(int deg) => deg * (3.141592653589793 / 180);

  dynamic _resolveTransform(Rect bounds, TextDirection textDirection) {
    final GradientTransform transform = GradientRotation(_degreeToRadian(-90));
    return transform.transform(bounds, textDirection: textDirection)!.storage;
  }

  // Adaptation to use unique value
  getRadialBar(int todaySlp) {
    return <RadialBarSeries<int, String>>[
      RadialBarSeries<int, String>(
        maximumValue: 150,
        innerRadius: "50",
        radius: '100%',
        gap: '1%',
        trackColor: Color.fromRGBO(234, 236, 239, 1.0),
        strokeWidth: 10,
        trackBorderWidth: 1,
        dataSource: [todaySlp],
        cornerStyle: CornerStyle.bothCurve,
        xValueMapper: (int data, _) => "Current",
        yValueMapper: (int data, _) => data,
      ),
    ];
  }
}
