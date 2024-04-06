import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uireplica/Presentation/themes/theme_provider.dart';
import 'package:uireplica/Presentation/widgets/appbar_actions.dart';

class TabletLayout extends StatefulWidget {
  const TabletLayout({super.key});

  @override
  State<TabletLayout> createState() => _TabletLayoutState();
}

class _TabletLayoutState extends State<TabletLayout> {
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
    final currentwidth = MediaQuery.of(context).size.width;

    // main UI
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      drawer: const Drawer(),
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Theme.of(context).colorScheme.background,
        actions: actions,
      ),
      body: Center(
        child: Text("$currentwidth"),
      ),
    );
  }
}
