import 'package:flutter/material.dart';
import 'package:uireplica/Presentation/widgets/card.dart';

class AnalyticsCard extends StatelessWidget {
  const AnalyticsCard({super.key});

  @override
  Widget build(BuildContext context) {
     return InfoCard(backgroundColor: Theme.of(context).colorScheme.surface,content: Text("Analytics"));
  }
}