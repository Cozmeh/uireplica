import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardHeader extends StatelessWidget {
  final String title;
  const CardHeader({super.key , required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
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
  }