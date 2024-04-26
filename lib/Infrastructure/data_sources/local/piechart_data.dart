import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:uireplica/Utils/constants.dart';

Map<String, Map<int, Color>> pieChartSectionValue = {
  "Transaction": {452: Constants.SECONDARY},
  "Payouts": {412: Constants.PRIMARY},
  "Sales": {715: Constants.DARK_BACKGROUND},
  "Reports": {128: Colors.redAccent},
};

PieChartSectionData sectionData(
    BuildContext context, double value, Color color, double radius) {
  return PieChartSectionData(
    value: value,
    color: color,
    radius: radius,
    showTitle: false,
    badgePositionPercentageOffset: .98,
    badgeWidget: CircleAvatar(
        radius: 20,
        backgroundColor: Theme.of(context).colorScheme.background,
        child: Text(
          value.toString(),
          style: TextStyle(color: Theme.of(context).iconTheme.color),
        )),
  );
}

List<PieChartSectionData> pieChartSectionData(BuildContext context) {
  return pieChartSectionValue.entries
      .map((e) => sectionData(context, e.value.entries.first.key.toDouble(),
          e.value.entries.first.value, 25))
      .toList();
}
