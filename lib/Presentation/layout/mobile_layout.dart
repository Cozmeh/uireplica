import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:uireplica/Presentation/themes/theme_provider.dart';
import 'package:uireplica/Presentation/widgets/activity.dart';
import 'package:uireplica/Presentation/widgets/analytics.dart';
import 'package:uireplica/Presentation/widgets/appbar_actions.dart';
import 'package:uireplica/Presentation/widgets/invoices.dart';
import 'package:uireplica/Presentation/widgets/overview.dart';
import 'package:uireplica/Presentation/widgets/profit.dart';
import 'package:uireplica/Presentation/widgets/sale_report.dart';
import 'package:uireplica/Presentation/widgets/side_menu.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  // variables
  bool _isDarkMode = true;
  // final AppBarActions appBarActions = AppBarActions();

  // theme changing function
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
      AppBarActions(
          context: context,
          onTap: () {},
          icon: Icons.search,
          color: Theme.of(context).colorScheme.background),
      // theme mode
      AppBarActions(
          context: context,
          onTap: themeChanger,
          icon: _isDarkMode
              ? Icons.light_mode_outlined
              : Icons.dark_mode_outlined,
          color: Theme.of(context).colorScheme.background),
      // notification
      AppBarActions(
          context: context,
          onTap: () {},
          icon: Icons.notifications_none_rounded,
          color: Theme.of(context).colorScheme.background),
      // account
      AppBarActions(
          context: context,
          onTap: () {},
          icon: Icons.account_circle_outlined,
          color: Theme.of(context).colorScheme.background),
      const SizedBox(width: 20)
    ];

    // all 5 info cards
    List<Widget> cards = [
      //const OverviewText(),
      const ProfitCard(),
      const SalesReportCard(),
      AnalyticsCard(),
      const InvoicesCard(),
      const ActivityCard(),
    ];

    Widget drawer = Drawer(
      width: MediaQuery.of(context).size.width,
      backgroundColor: Theme.of(context).colorScheme.background,
      surfaceTintColor: Theme.of(context).colorScheme.background,
      child: SideMenuBar(
        isMobile: true,
      ),
    );

    // main UI
    return ScreenUtilInit(
      // approximation , not same as the design
      designSize: const Size(500, 1200),
      builder: (context, child) {
        return Scaffold(
          drawer: drawer,
          appBar: AppBar(
            title: const OverviewText(),
            toolbarHeight: 100.h,
            backgroundColor: Theme.of(context).colorScheme.background,
            surfaceTintColor: Theme.of(context).colorScheme.background,
            actions: actionButtons,
          ),
          body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1),
            itemCount: cards.length,
            itemBuilder: (context, index) {
              return cards[index];
            },
          ),
        );
      },
    );
  }
}

/*
GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
            itemBuilder: (context, index) {
              return cards[index];
            },
            itemCount: cards.length,
          ),
 */

/**
 * Scrollbar(
            child: ListView.builder(
              itemCount: cards.length,
              itemBuilder: (BuildContext context, index) {
                return cards[index];
              },
            ),
          ),
 */
