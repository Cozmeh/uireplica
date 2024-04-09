import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:uireplica/Presentation/themes/theme_provider.dart';
import 'package:uireplica/Presentation/widgets/activity.dart';
import 'package:uireplica/Presentation/widgets/analytics.dart';
import 'package:uireplica/Presentation/widgets/appbar_actions.dart';
import 'package:uireplica/Presentation/widgets/overview.dart';
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
  final drawerWidth = 300.0;

  themeChanger() {
    setState(() {
      _isDarkMode =
          Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
    });
  }

  @override
  Widget build(BuildContext context) {
    // actions button in the appbar
    List<Widget> actionButtons = [
      // search
      appBarActions.appbarAction(context, () {}, Icons.search,
          Theme.of(context).colorScheme.background),
      // theme mode
      appBarActions.appbarAction(
          context,
          themeChanger,
          _isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
          Theme.of(context).colorScheme.background),
      // notification
      appBarActions.appbarAction(
          context,
          () {},
          Icons.notifications_none_rounded,
          Theme.of(context).colorScheme.background),
      // account
      appBarActions.appbarAction(context, () {}, Icons.account_circle_outlined,
          Theme.of(context).colorScheme.background),
      const SizedBox(
        width: 20,
      )
    ];

    // all 5 info cards
    List<Widget> mainCards = [
      //const OverviewText(),
      ProfitCard(),
      const SalesReportCard(),
      AnalyticsCard(),
      const InvoicesCard(),
      const ActivityCard(),
    ];

    // side menu
    Widget drawer = Drawer(
      width: drawerWidth,
      backgroundColor: Theme.of(context).colorScheme.background,
      surfaceTintColor: Theme.of(context).colorScheme.background,
      child: SideMenuBar(
        isMobile: false,
      ),
    );

    // main UI
    return ScreenUtilInit(
      designSize: const Size(1366, 1024),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            title: Row(
              children: [
                SizedBox(width: drawerWidth, child: spectra(context)),
                const OverviewText()
              ],
            ),
            toolbarHeight: 100,
            backgroundColor: Theme.of(context).colorScheme.background,
            surfaceTintColor: Theme.of(context).colorScheme.background,
            actions: actionButtons,
          ),
          body: Row(
            children: [
              //menu
              drawer,
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
