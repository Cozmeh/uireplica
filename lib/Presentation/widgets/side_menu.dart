import 'package:flutter/material.dart';
import 'package:uireplica/Presentation/widgets/spectra.dart';

class SideMenuBar extends StatelessWidget {
  final bool isMobile;
  const SideMenuBar({super.key, required this.isMobile});

  Widget item(String title, IconData leadingIcon, void Function() onTap,
        bool selected, BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        child: Card(
          color: Theme.of(context).colorScheme.background,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListTile(
            selected: selected,
            selectedTileColor: Colors.grey.withOpacity(0.2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            onTap: onTap,
            leading: Icon(
              leadingIcon,
              color: Theme.of(context).iconTheme.color,
              size: 25,
            ),
            title: Text(
              title,
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
          ),
        ),
      );
    }

  @override
  Widget build(BuildContext context) {
    return Column(
      //padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      children: [
        isMobile
            ? DrawerHeader(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                ),
                child: Center(child: spectra(context)),
              )
            : const SizedBox(),
        // dummy buttons
        item("Dashboard", Icons.dashboard_outlined, () {}, true, context),
        item("Analytics", Icons.analytics_outlined, () {}, false, context),
        item("Contacts", Icons.contacts_outlined, () {}, false, context),
        item("Mail", Icons.mail_outline, () {}, false, context),
        item("Calendar", Icons.calendar_month_outlined, () {}, false, context),
        item("Settings", Icons.settings_outlined, () {}, false, context),
        const Expanded(child: SizedBox()),
        item("Logout", Icons.logout_rounded, () {}, false, context),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
