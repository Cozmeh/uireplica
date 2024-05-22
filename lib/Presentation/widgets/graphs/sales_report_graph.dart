import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:uireplica/Domain/data_classes/sales_report_bardata.dart';
import 'package:uireplica/Infrastructure/data_sources/local/weekly_amount_data.dart';
import 'package:uireplica/Presentation/widgets/sales_report_bottom_text.dart';

class SalesReportBarGraph extends StatelessWidget {
  const SalesReportBarGraph({super.key});

  @override
  Widget build(BuildContext context) {
    SalesReportBarData salesReportBarData = SalesReportBarData(
      sundayAmount: weeklyAmount[0],
      mondayAmount: weeklyAmount[1],
      tuesdayAmount: weeklyAmount[2],
      wednesdayAmount: weeklyAmount[3],
      thursdayAmount: weeklyAmount[4],
      fridayAmount: weeklyAmount[5],
      saturdayAmount: weeklyAmount[6],
    );

    return BarChart(
      BarChartData(
        maxY: 20000,
        minY: 0,
        barTouchData: BarTouchData(
          enabled: true,
          touchTooltipData: BarTouchTooltipData(
            tooltipRoundedRadius: 20,
          ),
        ),
        gridData:
            const FlGridData(drawVerticalLine: false, drawHorizontalLine: true),
        borderData: FlBorderData(show: false),
        titlesData: const FlTitlesData(
            show: true,
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
                sideTitles:
                    SideTitles(showTitles: true, getTitlesWidget: bottomText))),
        barGroups: salesReportBarData.barData
            .map(
              (data) => BarChartGroupData(
                x: data.x,
                barRods: [
                  BarChartRodData(
                    toY: data.y,
                    color: Theme.of(context).colorScheme.primary,
                    width: 10,
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}



