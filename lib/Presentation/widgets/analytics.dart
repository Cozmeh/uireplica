import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:uireplica/Presentation/widgets/card.dart';
import 'package:uireplica/Presentation/widgets/graphs/analytics_line_graph.dart';

class AnalyticsCard extends StatelessWidget {
  AnalyticsCard({super.key});

  // month and year
  final Widget monthYear = Row(
    children: [
      Text(
        DateFormat('MMMM y').format(DateTime.now()),
        style: const TextStyle(color: Colors.grey),
      )
    ],
  );

  // graph
  Widget graph() {
    return const Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: 20),
        child: SizedBox(
          child: AnalyticsLineGraph(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      backgroundColor: Theme.of(context).colorScheme.surface,
      content: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 30.w),
        child: SizedBox(
          child: Column(
            children: [
              cardHeader(context),
              monthYear,
              SizedBox(
                height: 30.h,
              ),
              graph()
            ],
          ),
        ),
      ),
    );
  }
}

Widget cardHeader(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "Analytical AI",
        style: TextStyle(
            fontSize: 30.sp,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).iconTheme.color,
            letterSpacing: 1),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.surface,
            surfaceTintColor: Theme.of(context).colorScheme.surface,
            elevation: 0),
        onPressed: () {},
        child: Icon(
          Icons.more_vert,
          size: 25.sp,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
    ],
  );
}
