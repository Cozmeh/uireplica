import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:uireplica/Presentation/widgets/card.dart';
import 'package:uireplica/Presentation/widgets/graphs/analytics_line_graph.dart';

class AnalyticsCard extends StatelessWidget {
  const AnalyticsCard({super.key});

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

  // month and year
  Widget monthYear() {
    return Row(
      children: [
        Text(
          "${DateFormat('MMMM').format(DateTime.now())} ${DateTime.now().year}",
          style: const TextStyle(color: Colors.grey),
        )
      ],
    );
  }

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
              monthYear(),
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
