import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileLayout;
  final Widget tabletLayout;
  const ResponsiveLayout(
      {super.key, required this.mobileLayout, required this.tabletLayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      // average width of tablet is more than 600/650
      return constraints.maxWidth < 1000 ? mobileLayout : tabletLayout;
    });
  }
}
