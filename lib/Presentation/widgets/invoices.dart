import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uireplica/Presentation/widgets/card.dart';

class InvoicesCard extends StatelessWidget {
  const InvoicesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      backgroundColor: Theme.of(context).colorScheme.surface,
      content: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 30.w),
        child: SizedBox(
          child: Column(
            children: [
              ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 0.w),
                  title: Text(
                    "Invoices",
                    style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).iconTheme.color,
                        letterSpacing: 1),
                  ),
                  trailing: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        surfaceTintColor: Theme.of(context).colorScheme.surface,
                        elevation: 0),
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.filter_list_rounded,
                          size: 20.0,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.arrow_drop_down_circle_outlined,
                          size: 20.0,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Report',
                          style: TextStyle(
                            color: Theme.of(context).iconTheme.color,
                          ),
                        ),
                      ],
                    ),
                  )),
              Row(
                children: [
                  Text(
                    "3251 Invoices",
                    style: const TextStyle(color: Colors.grey),
                  )
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
              const Expanded(
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
