import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uireplica/Infrastructure/data_sources/local/piechart_data.dart';
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
                  centerSpaceRadius: 90,
                  sectionsSpace: 10,
                  startDegreeOffset: 0,
                  borderData: FlBorderData(show: false),
                  pieTouchData: PieTouchData(enabled: true),
                  sections: pieChartSectionData(context),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Wrap(
            spacing: 10,
            direction: Axis.horizontal,
            runAlignment: WrapAlignment.spaceAround,
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: pieChartSectionValue.entries
                .map((e) => Indicator(
                    color: e.value.entries.first.value,
                    text: e.key,
                    isSquare: false))
                .toList(),
          ),
        ),
      ],
    );
  }
}
