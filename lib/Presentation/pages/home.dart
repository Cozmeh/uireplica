import 'package:flutter/material.dart';
import 'package:uireplica/Presentation/layout/mobile_layout.dart';
import 'package:uireplica/Presentation/layout/responsive.dart';
import 'package:uireplica/Presentation/layout/tablet_layout.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
			body: ResponsiveLayout(
					mobileLayout: MobileLayout(), tabletLayout: TabletLayout()),
		);
  }
}
