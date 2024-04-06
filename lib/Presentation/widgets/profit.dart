import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:uireplica/Presentation/widgets/appbar_actions.dart';
import 'package:uireplica/Presentation/widgets/card.dart';

class ProfitCard extends StatelessWidget {
  ProfitCard({super.key});

  final AppBarActions appBarActions = AppBarActions();

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: SizedBox(
          child: Column(
            children: [
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                leading: appBarActions.cardIcon(context, () => null,
                    Icons.featured_play_list_outlined, Colors.white),
                title: const Text(
                  "Profit",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert_outlined,
                      color: Colors.black,
                    )),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Image.asset(
                  'assets/3.gif',
                  fit: BoxFit.fill,
                ),
              ),
              const Row(
                children: [
                  Text(
                    "+14% ",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
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
              ),
              Row(
                children: [
                  Text(
                    "₹ ${faker.randomGenerator.decimal(min: 10000, scale: 1000).toStringAsFixed(2)}",
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 50),
                    textAlign: TextAlign.left,
                  ),
                ],
              )
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