import 'package:flutter/material.dart';
import 'package:uireplica/Presentation/widgets/card.dart';

class InvoicesCard extends StatelessWidget {
  const InvoicesCard({super.key});

  @override
  Widget build(BuildContext context) {
     return InfoCard(backgroundColor: Theme.of(context).colorScheme.surface,content: Text("Invoices"));
  }
}