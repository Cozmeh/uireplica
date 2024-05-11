import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uireplica/Presentation/widgets/card.dart';
import 'package:uireplica/Presentation/widgets/card_header.dart';
import 'package:uireplica/Presentation/widgets/graphs/activity_piechart.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({super.key});

  @override
  Widget build(BuildContext context) {
    // pie chart
    Widget pieChart = const Expanded(
      child: SizedBox(
        child: ActivityPieGraph(),
      ),
    );

    return InfoCard(
      backgroundColor: Theme.of(context).colorScheme.surface,
      content: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 30.w),
        child: SizedBox(
          child: Column(
            children: [
              const CardHeader(title: "Activity"),
              SizedBox(
                height: 20.h,
              ),
              pieChart,
            ],
          ),
        ),
      ),
    );
  }
}
