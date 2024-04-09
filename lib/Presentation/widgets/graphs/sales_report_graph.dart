import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uireplica/Domain/value_objects/sales_report_bardata.dart';
import 'package:uireplica/Infrastructure/data_sources/local/weekly_amount_data.dart';

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

    // initializing with data
    salesReportBarData.initBarData();

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
        barGroups: salesReportBarData.bardata
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

Widget bottomText(double value, TitleMeta meta) {
  const style =
      TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 10);

  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text("Sun", style: style);
      break;
    case 1:
      text = const Text("Mon", style: style);
      break;
    case 2:
      text = const Text("Tue", style: style);
      break;
    case 3:
      text = const Text("Wed", style: style);
      break;
    case 4:
      text = const Text("Thu", style: style);
      break;
    case 5:
      text = const Text("Fri", style: style);
      break;
    case 6:
      text = const Text("Sat", style: style);
      break;
    default:
      text = const Text(" ", style: style);
  }

  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}


