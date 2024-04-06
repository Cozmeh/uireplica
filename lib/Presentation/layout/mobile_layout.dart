import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uireplica/Presentation/themes/theme_provider.dart';
import 'package:uireplica/Presentation/widgets/activity.dart';
import 'package:uireplica/Presentation/widgets/analytics.dart';
import 'package:uireplica/Presentation/widgets/appbar_actions.dart';
import 'package:uireplica/Presentation/widgets/invoices.dart';
import 'package:uireplica/Presentation/widgets/profit.dart';
import 'package:uireplica/Presentation/widgets/sale_report.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  bool _isDarkMode = true;
  final AppBarActions appBarActions = AppBarActions();

  themeChanger() {
    setState(() {
      _isDarkMode =
          Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
    });
  }

  @override
  Widget build(BuildContext context) {
    // width of the screen
    final currentwidth = MediaQuery.of(context).size.width;
    // actions button in the appbar
    List<Widget> actions = [
      appBarActions.appbarAction(context, () {}, Icons.search,
          Theme.of(context).colorScheme.background),
      appBarActions.appbarAction(
          context,
          themeChanger,
          _isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
          Theme.of(context).colorScheme.background),
      appBarActions.appbarAction(
          context,
          () {},
          Icons.notifications_none_rounded,
          Theme.of(context).colorScheme.background),
      appBarActions.appbarAction(context, () {}, Icons.account_circle_outlined,
          Theme.of(context).colorScheme.background),
      const SizedBox(
        width: 20,
      )
    ];
    // all 5 info cards
    List<Widget> cards = [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          "Overview",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 2),
        ),
      ),
      ProfitCard(),
      const SalesReportCard(),
      const InvoicesCard(),
      const AnalyticsCard(),
      const ActivityCard()
    ];

    // main UI
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Theme.of(context).colorScheme.background,
        surfaceTintColor: Theme.of(context).colorScheme.background,
        title: Text("$currentwidth"),
        actions: actions,
      ),
      body: Scrollbar(
        child: ListView.builder(
          itemCount: cards.length,
          itemBuilder: (BuildContext context, index) {
            return cards[index];
          },
        ),
      ),
    );
  }
}
