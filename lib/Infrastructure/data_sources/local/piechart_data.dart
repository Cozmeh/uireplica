import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:uireplica/Utils/constants.dart';

List<PieChartSectionData> piechartData = [
  PieChartSectionData(
    value: 452,
    color: Constants.SECONDARY,
    radius: 20,
    titleStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
  ),
  PieChartSectionData(
    value: 412,
    color: Constants.PRIMARY,
    radius: 20,
    titleStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
  ),
  PieChartSectionData(
    value: 715,
    color: Constants.DARK_BACKGROUND,
    radius: 20,
    titleStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
  ),
  PieChartSectionData(
    value: 128,
    color: Colors.redAccent,
    radius: 20,
    titleStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
  )
];
