import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uireplica/Presentation/widgets/card.dart';

class ProfitCard extends StatelessWidget {
  const ProfitCard({super.key});

  @override
  Widget build(BuildContext context) {

    // card icon
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
    // card header
    Widget cardHeader = ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 0.w),
      leading: cardIcon(
          context, () => null, Icons.featured_play_list_outlined, Colors.white),
      title: Text(
        "Profit",
        style: TextStyle(
            fontSize: 25.sp, fontWeight: FontWeight.bold, color: Colors.black),
      ),
      trailing: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_vert_outlined,
            color: Colors.black,
          )),
    );

    // center content gif
    Widget gif = Expanded(
      child: SizedBox(
        child: Image.asset(
          'assets/profit.gif',
          fit: BoxFit.fill,
        ),
      ),
    );

    // text
    Widget sinceText = const Row(
      children: [
        Text(
          "+14% ",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
        ),
        Text(
          "Since last week",
          style: TextStyle(
            color: Colors.black,
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );

    // amount text
    Widget amountText = Row(
      children: [
        Text(
          "₹ ${faker.randomGenerator.decimal(min: 10000, scale: 1000).toStringAsFixed(2)}",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 50.sp),
          textAlign: TextAlign.left,
        ),
      ],
    );

    return InfoCard(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      content: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 30.w),
        child: SizedBox(
          child: Column(
            children: [
              cardHeader,
              gif,
              const SizedBox(
                height: 5,
              ),
              sinceText,
              amountText,
            ],
          ),
        ),
      ),
    );
  }
}



/*

Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  appBarActions.cardIcon(context, () => null,
                      Icons.featured_play_list_outlined, Colors.white),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Profit",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ],
              )
 */