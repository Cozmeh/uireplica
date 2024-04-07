import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uireplica/Presentation/widgets/card.dart';
import 'package:uireplica/Presentation/widgets/graphs/analytics_line_graph.dart';

class AnalyticsCard extends StatelessWidget {
  AnalyticsCard({super.key});

  List<String> months = [
    '', // Index 0 is empty to align with DateTime month values
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      backgroundColor: Theme.of(context).colorScheme.surface,
      content: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 30.w),
        child: SizedBox(
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 0.w),
                title: Text(
                  "Analytical AI",
                  style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).iconTheme.color,
                      letterSpacing: 1),
                ),
                trailing: ElevatedButton(
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
              ),
              Row(
                children: [
                  Text(
                    "${months[DateTime.now().month]} ${DateTime.now().year}",
                    style: const TextStyle(color: Colors.grey),
                  )
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: SizedBox(
                    child: AnalyticsLineGraph(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
