import 'package:flutter/material.dart';
import 'package:scholarship/src/features/performance/cards.dart';
import 'package:scholarship/src/features/performance/models/performance_model.dart';
import 'package:scholarship/src/features/performance/performance_controller.dart';
import 'package:scholarship/src/features/performance/radial_with_status.dart';
import 'package:scholarship/src/shared/core.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Performance extends StatefulWidget {
  const Performance({Key? key}) : super(key: key);

  @override
  _PerformanceState createState() => _PerformanceState();
}

class _PerformanceState extends State<Performance> {
  late PerformanceController controller;
  @override
  void initState() {
    // change to a provider later
    controller = PerformanceController();
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
          title: Text("Performance"),
          centerTitle: true,
        ),
         backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Column(
              children: [
                RadialWithStatus(performanceModel: controller.data!,),
                SizedBox(
                  height: 10,
                ),
                Cards(performanceModel: controller.data!),
                
                SfCartesianChart(
                    // backgroundColor: Theme.of(context).cardColor,
                    primaryXAxis: CategoryAxis(
                      title: AxisTitle(text: "Days"),
                    ),
                    primaryYAxis: NumericAxis(labelFormat: "{value} SLP"),
                    // Chart title
                    title: ChartTitle(
                        text: 'Last 15 Days',
                        textStyle:
                            TextStyle(color: Theme.of(context).accentColor)),
                    // Enable legend
                    // legend: Legend(
                    //     isVisible: true, textStyle: TextStyle(color: Theme.of(context).accentColor)),
                    // Enable tooltip
                    tooltipBehavior: TooltipBehavior(
                      enable: true,
                      header: "",
                      format: 'Day point.x: point.y',
                    ),
                    series: _getRoundedBarSeries(controller.data!.last15Days)),
              ],
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
          body: Container(
        child: CircularProgressIndicator(),
      ));
    }
  }

  _getRoundedBarSeries(List<DailySlp> chartData) {
    return <ChartSeries>[
      ColumnSeries<DailySlp, String>(
          dataSource: chartData,
          xValueMapper: (DailySlp sales, _) => sales.day.day.toString(),
          yValueMapper: (DailySlp sales, _) => sales.slp,
          // Sets the corner radius
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
          color: Color(0xff40E0D0),
          isVisibleInLegend: false)
    ];
  }
}
