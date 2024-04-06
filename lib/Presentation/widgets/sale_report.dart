import 'package:flutter/material.dart';
import 'package:uireplica/Presentation/widgets/card.dart';

class SalesReportCard extends StatelessWidget {
  const SalesReportCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InfoCard(
        backgroundColor: Theme.of(context).colorScheme.surface,
        content: Text("Sales Report"));
  }
}
