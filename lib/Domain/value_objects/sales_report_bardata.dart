import 'package:uireplica/Domain/entities/weekday_bar.dart';

class SalesReportBarData {
  final double sundayAmount;
  final double mondayAmount;
  final double tuesdayAmount;
  final double wednesdayAmount;
  final double thursdayAmount;
  final double fridayAmount;
  final double saturdayAmount;

  SalesReportBarData(
      {required this.sundayAmount,
      required this.mondayAmount,
      required this.tuesdayAmount,
      required this.wednesdayAmount,
      required this.thursdayAmount,
      required this.fridayAmount,
      required this.saturdayAmount});

  List<WeekDayBar> bardata = [];

  void initBarData() {
    bardata = [
      WeekDayBar(x: 0, y: sundayAmount),
      WeekDayBar(x: 1, y: mondayAmount),
      WeekDayBar(x: 2, y: tuesdayAmount),
      WeekDayBar(x: 3, y: wednesdayAmount),
      WeekDayBar(x: 4, y: thursdayAmount),
      WeekDayBar(x: 5, y: fridayAmount),
      WeekDayBar(x: 6, y: saturdayAmount)
    ];
  }
}
