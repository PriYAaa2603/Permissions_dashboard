import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class InsightsPage extends StatelessWidget {
  // Update the type parameter to specify String for the domain axis
  final List<charts.Series<dynamic, String>> seriesList;

  InsightsPage(this.seriesList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Permission Insights'),
      ),
      body: charts.BarChart(seriesList),
    );
  }
}
