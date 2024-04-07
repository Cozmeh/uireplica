import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoCard extends StatefulWidget {
  final Widget content;
  final Color backgroundColor;
  const InfoCard(
      {super.key, required this.content, required this.backgroundColor});

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.h),
      child: Container(
        // Set the size of the card
        height: 500.h,
        width: 500.w,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(40.r), // Round corners
        ),
        child: widget.content,
      ),
    );
  }
}


// AspectRatio : 1/1