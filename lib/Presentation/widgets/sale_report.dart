import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uireplica/Presentation/widgets/appbar_actions.dart';
import 'package:uireplica/Presentation/widgets/card.dart';
import 'package:uireplica/Presentation/widgets/graphs/sales_report_graph.dart';
import 'package:uireplica/Presentation/widgets/graphs/sales_report_payment_graph.dart';

class SalesReportCard extends StatefulWidget {
  SalesReportCard({super.key});

  @override
  State<SalesReportCard> createState() => _SalesReportCardState();
}

class _SalesReportCardState extends State<SalesReportCard> {
  final AppBarActions appBarActions = AppBarActions();

  final List<bool> _selections = [true, false];

  bool _isMainGraph = true;

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
                    "Sales Report",
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
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Week',
                          style: TextStyle(
                            color: Theme.of(context).iconTheme.color,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_drop_down_circle_outlined,
                          size: 15.0,
                          color: Theme.of(context).iconTheme.color,
                        ),
                      ],
                    ),
                  )),
              Row(
                children: [
                  ToggleButtons(
                    renderBorder: false,
                    isSelected: _selections,
                    // colors not working
                    color: Colors.grey,
                    selectedColor: Colors.white,
                    fillColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    constraints:
                        const BoxConstraints(maxHeight: 50, maxWidth: 200),
                    onPressed: (int index) {
                      setState(() {
                        if (index == 0) {
                          _isMainGraph = true;
                          _selections[index] = !_selections[index];
                          _selections[index + 1] = false;
                        } else {
                          _isMainGraph = false;
                          _selections[index] = !_selections[index];
                          _selections[index - 1] = false;
                        }
                      });
                    },
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: Text(
                          'Earnings',
                          style: TextStyle(
                            color: _selections[0] == true
                                ? Theme.of(context).iconTheme.color
                                : Colors.grey,
                            fontWeight: _selections[0] == true
                                ? FontWeight.bold
                                : FontWeight.w100,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Text(
                          'Payments',
                          style: TextStyle(
                            color: _selections[1] == true
                                ? Theme.of(context).iconTheme.color
                                : Colors.grey,
                            fontWeight: _selections[1] == true
                                ? FontWeight.bold
                                : FontWeight.w100,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
              Expanded(
                child: SizedBox(
                  child: _isMainGraph
                      ? const SalesReportBarGraph()
                      : const SalesReportPaymentGraph(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
