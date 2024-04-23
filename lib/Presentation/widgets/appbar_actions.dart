// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class AppBarActions extends StatelessWidget {
  final BuildContext context;
  final Function() ontap;
  final IconData icon;
  final Color color;
  const AppBarActions(
      {super.key,
      required this.context,
      required this.ontap,
      required this.icon,
      required this.color});

  @override
  Widget build(BuildContext context) {
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
}

// class AppBarActions {
//   Widget appbarAction(
//       BuildContext context, Function() ontap, IconData icon, Color color) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 1.5),
//       child: GestureDetector(
//         onTap: ontap,
//         child: Container(
//           decoration: BoxDecoration(
//               color: color,
//               borderRadius: BorderRadius.circular(10),
//               border: Border.all(
//                   style: BorderStyle.solid,
//                   color: const Color.fromARGB(255, 99, 98, 98),
//                   width: 1)),
//           padding: const EdgeInsets.all(8),
//           child: Icon(
//             icon,
//             size: 20,
//           ),
//         ),
//       ),
//     );
//   }
// }
