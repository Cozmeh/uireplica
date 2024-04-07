import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uireplica/Presentation/widgets/indicator.dart';

class ActivityPieGraph extends StatelessWidget {
  const ActivityPieGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PieChart(
            PieChartData(
              centerSpaceRadius: 80,
              sectionsSpace: 0,
              startDegreeOffset: 0,
              borderData: FlBorderData(show: false),
              pieTouchData: PieTouchData(enabled: true),
              sections: [
                PieChartSectionData(
                  value: 452,
                  color: Theme.of(context).colorScheme.secondary,
                  radius: 20,
                  titleStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
                PieChartSectionData(
                  value: 412,
                  color: Theme.of(context).colorScheme.primary,
                  radius: 20,
                  titleStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
                PieChartSectionData(
                  value: 715,
                  color: Colors.black45,
                  radius: 20,
                  titleStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
                PieChartSectionData(
                  value: 128,
                  color: Colors.redAccent,
                  radius: 20,
                  titleStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Indicator(
                  color: Theme.of(context).colorScheme.secondary,
                  text: "Transactions",
                  isSquare: false),
              Indicator(
                  color: Theme.of(context).colorScheme.primary,
                  text: "Payouts",
                  isSquare: false)
            ],
          ),
        ),
        SizedBox(height: 10.h),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Indicator(color: Colors.black45, text: "Sales", isSquare: false),
              Indicator(
                  color: Colors.redAccent, text: "Reports", isSquare: false)
            ],
          ),
        ),
      ],
    );
  }
}
