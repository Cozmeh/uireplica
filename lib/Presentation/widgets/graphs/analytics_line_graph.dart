import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:uireplica/Infrastructure/data_sources/local/analytical_line_data.dart';

class AnalyticsLineGraph extends StatelessWidget {
  const AnalyticsLineGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      // duration: Duration(milliseconds: 1500),
      // curve: Curves.linear,
      LineChartData(
        minX: 1,
        maxX: 30,
        minY: 0,
        maxY: 60000,
        gridData:
            const FlGridData(drawVerticalLine: false, drawHorizontalLine: true),
        borderData: FlBorderData(
          show: false,
        ),
        titlesData: const FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: lineSpots,
            isCurved: true,
            barWidth: 3,
            isStrokeCapRound: true,
            color: Theme.of(context).colorScheme.secondary,
            preventCurveOverShooting: true,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }
}
