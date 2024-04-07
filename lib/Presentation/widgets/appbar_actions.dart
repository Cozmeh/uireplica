// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class AppBarActions {
  Widget appbarAction(
      BuildContext context, Function() ontap, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.5),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  style: BorderStyle.solid,
                  color: const Color.fromARGB(255, 99, 98, 98),
                  width: 1)),
          padding: const EdgeInsets.all(8),
          child: Icon(
            icon,
            size: 20,
          ),
        ),
      ),
    );
  }

  Widget cardIcon(
      BuildContext context, Function() ontap, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.5),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(15),
              border:
                  Border.all(style: BorderStyle.solid, color: Colors.white)),
          padding: const EdgeInsets.all(10),
          child: Icon(
            color: Colors.black,
            icon,
            size: 30,
          ),
        ),
      ),
    );
  }
}
