import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uireplica/Presentation/themes/theme_provider.dart';
import 'package:uireplica/Presentation/widgets/appbar_actions.dart';
import 'package:uireplica/Utils/constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      appBarActions.appbarAction(context, () {}, Icons.search),
      appBarActions.appbarAction(context, themeChanger,
          _isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined),
      appBarActions.appbarAction(
          context, () {}, Icons.notifications_none_rounded),
      appBarActions.appbarAction(context, () {}, Icons.account_circle_outlined),
      const SizedBox(
        width: 20,
      )
    ];
    final currentwidth = MediaQuery.of(context).size.width;

    // main UI
    return Scaffold(
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
