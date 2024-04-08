import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uireplica/Presentation/pages/home.dart';
import 'package:uireplica/Presentation/themes/theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Provider.of<ThemeProvider>(context).themeData,
            //darkTheme: darkMode,
            themeMode: ThemeMode.system,
            home: const Home(),
          );
        },
      ),
    );
  }
}
