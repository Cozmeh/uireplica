import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uireplica/Presentation/widgets/card.dart';
import 'package:uireplica/Presentation/widgets/graphs/activity_piechart.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({super.key});

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
                  "Activity",
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
              // const Row(
              //   children: [
              //     Text(
              //       "+14% ",
              //       style: TextStyle(fontWeight: FontWeight.bold),
              //       textAlign: TextAlign.left,
              //     ),
              //     Text(
              //       "Since last week",
              //       style: TextStyle(),
              //       textAlign: TextAlign.left,
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 20.h,
              ),
              const Expanded(
                child: SizedBox(
                  child: ActivityPieGraph(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
