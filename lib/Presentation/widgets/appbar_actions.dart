// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class AppBarActions {
  Widget appbarAction(BuildContext context, Function() ontap, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.5),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                  style: BorderStyle.solid,
                  color: Theme.of(context).iconTheme.color!)),
          padding: const EdgeInsets.all(10),
          child: Icon(
            icon,
            size: 30,
          ),
        ),
      ),
    );
  }
}
