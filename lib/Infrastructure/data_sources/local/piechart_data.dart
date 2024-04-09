import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uireplica/Utils/constants.dart';

List<PieChartSectionData> pieChartSectionData(BuildContext context) {
  List<PieChartSectionData> piechartData = [
    PieChartSectionData(
      value: 452,
      color: Constants.SECONDARY,
      radius: 25,
      showTitle: false,
      badgePositionPercentageOffset: .98,
      badgeWidget: CircleAvatar(
          radius: 20,
          backgroundColor: Theme.of(context).colorScheme.background,
          child: Text(
            "452",
            style: TextStyle(color: Theme.of(context).iconTheme.color),
          )),
    ),
    PieChartSectionData(
      value: 412,
      color: Constants.PRIMARY,
      radius: 25,
      showTitle: false,
      badgePositionPercentageOffset: .98,
      badgeWidget: CircleAvatar(
          radius: 20,
          backgroundColor: Theme.of(context).colorScheme.background,
          child: Text(
            "412",
            style: TextStyle(color: Theme.of(context).iconTheme.color),
          )),
    ),
    PieChartSectionData(
      value: 715,
      color: Constants.DARK_BACKGROUND,
      radius: 30,
      showTitle: false,
      badgePositionPercentageOffset: .98,
      badgeWidget: CircleAvatar(
          radius: 20,
          backgroundColor: Theme.of(context).colorScheme.background,
          child: Text(
            "715",
            style: TextStyle(color: Theme.of(context).iconTheme.color),
          )),
    ),
    PieChartSectionData(
      value: 128,
      color: Colors.redAccent,
      radius: 35,
      showTitle: false,
      badgePositionPercentageOffset: .98,
      badgeWidget: CircleAvatar(
          radius: 20,
          backgroundColor: Theme.of(context).colorScheme.background,
          child: Text(
            "128",
            style: TextStyle(color: Theme.of(context).iconTheme.color),
          )),
    )
  ];
  return piechartData;
}
