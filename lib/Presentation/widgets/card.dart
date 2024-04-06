import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.all(10),
      child: Container(
        // Set the size of the card
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(25), // Round corners
        ),
        child: widget.content,
      ),
    );
  }
}


// AspectRatio : 1/1