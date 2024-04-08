import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:uireplica/Presentation/themes/theme_provider.dart';
import 'package:uireplica/Presentation/widgets/activity.dart';
import 'package:uireplica/Presentation/widgets/analytics.dart';
import 'package:uireplica/Presentation/widgets/appbar_actions.dart';
import 'package:uireplica/Presentation/widgets/profit.dart';
import 'package:uireplica/Presentation/widgets/sale_report.dart';
import 'package:uireplica/Presentation/widgets/side_menu.dart';
import 'package:uireplica/Presentation/widgets/spectra.dart';

import '../widgets/invoices.dart';

class TabletLayout extends StatefulWidget {
  const TabletLayout({super.key});

  @override
  State<TabletLayout> createState() => _TabletLayoutState();
}

class _TabletLayoutState extends State<TabletLayout> {
  bool _isDarkMode = true;
  bool _isThirdCard = false;
  final AppBarActions appBarActions = AppBarActions();

  themeChanger() {
    setState(() {
      _isDarkMode =
          Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
    });
  }

  @override
  Widget build(BuildContext context) {
    // actions button in the appbar
    List<Widget> actionsButtons = [
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
    //final currentwidth = MediaQuery.of(context).size.width;
    // all 5 info cards
    List<Widget> mainCards = [
      //const OverviewText(),
      ProfitCard(),
      SalesReportCard(),
      AnalyticsCard(),
      InvoicesCard(),
      const ActivityCard(),
    ];

    // main UI
    return ScreenUtilInit(
      designSize: const Size(1366, 1024),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            title: spectra(context),
            toolbarHeight: 100,
            backgroundColor: Theme.of(context).colorScheme.background,
            surfaceTintColor: Theme.of(context).colorScheme.background,
            actions: actionsButtons,
          ),
          body: Row(
            children: [
              //menu
              Drawer(
                width: 300,
                backgroundColor: Theme.of(context).colorScheme.background,
                surfaceTintColor: Theme.of(context).colorScheme.background,
                child: SideMenuBar(
                  isMobile: false,
                ),
              ),
              //
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: mainCards.length,
                  itemBuilder: (context, index) {
                    return mainCards[index];
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
