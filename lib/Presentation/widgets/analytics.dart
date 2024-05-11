import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:uireplica/Presentation/widgets/card.dart';
import 'package:uireplica/Presentation/widgets/card_header.dart';
import 'package:uireplica/Presentation/widgets/graphs/analytics_line_graph.dart';

class AnalyticsCard extends StatelessWidget {
  const AnalyticsCard({super.key});

  @override
  Widget build(BuildContext context) {
    // graph
    Widget graph = const Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: 20),
        child: SizedBox(
          child: AnalyticsLineGraph(),
        ),
      ),
    );
    // month and year
    final Widget monthYear = Row(
      children: [
        Text(
          DateFormat('MMMM y').format(DateTime.now()),
          style: const TextStyle(color: Colors.grey),
        )
      ],
    );
    return InfoCard(
      backgroundColor: Theme.of(context).colorScheme.surface,
      content: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 30.w),
        child: SizedBox(
          child: Column(
            children: [
              const CardHeader(title: "Analytics"),
              monthYear,
              SizedBox(
                height: 30.h,
              ),
              graph,
            ],
          ),
        ),
      ),
    );
  }
}
