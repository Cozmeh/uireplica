import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uireplica/Presentation/widgets/indicator.dart';
import 'package:uireplica/Utils/constants.dart';

class ActivityPieGraph extends StatelessWidget {
  const ActivityPieGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "+13%",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                    const TextSpan(
                      text: "\nSince last week",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    )
                  ],
                ),
              ),
              PieChart(
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
                      color: Constants.DARK_BACKGROUND,
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
            ],
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
              Indicator(
                  color: Constants.DARK_BACKGROUND,
                  text: "Sales",
                  isSquare: false),
              Indicator(
                  color: Colors.redAccent, text: "Reports", isSquare: false)
            ],
          ),
        ),
      ],
    );
  }
}
