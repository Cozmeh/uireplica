import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OverviewText extends StatelessWidget {
  const OverviewText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.w),
      child: const Text(
        "Overview",
        style: TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 1.5),
      ),
    );
  }
}
