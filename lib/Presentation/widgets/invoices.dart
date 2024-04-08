import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uireplica/Infrastructure/data_sources/local/invoices_datatable.dart';
import 'package:uireplica/Presentation/widgets/card.dart';

class InvoicesCard extends StatefulWidget {
  InvoicesCard({super.key});

  @override
  State<InvoicesCard> createState() => _InvoicesCardState();
}

class _InvoicesCardState extends State<InvoicesCard> {
  bool _sortAscending = true;

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      backgroundColor: Theme.of(context).colorScheme.surface,
      content: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 30.w),
        child: SizedBox(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Invoices",
                    style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).iconTheme.color,
                        letterSpacing: 1),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              _sortAscending = !_sortAscending;
                            });
                          },
                          icon: const Icon(Icons.filter_list_rounded)),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.surface,
                          surfaceTintColor:
                              Theme.of(context).colorScheme.surface,
                          elevation: 0,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_drop_down_circle_outlined,
                              color: Theme.of(context).iconTheme.color,
                              size: 20.0,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              'Report',
                              style: TextStyle(
                                color: Theme.of(context).iconTheme.color,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "${invoiceData.length} Invoices",
                    style: const TextStyle(color: Colors.grey),
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: SizedBox(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      child: InvoiceTable(sortAscending: _sortAscending),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// data table for invoices
class InvoiceTable extends StatelessWidget {
  bool sortAscending;
  InvoiceTable({super.key, required this.sortAscending});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      horizontalMargin: 0,
      dividerThickness: 0.0,
      dataRowMinHeight: 5,
      sortAscending: sortAscending,
      columns: const [
        DataColumn(
            label: Text('Customer Name', style: TextStyle(color: Colors.grey))),
        DataColumn(label: Text('Date', style: TextStyle(color: Colors.grey))),
        DataColumn(label: Text('Amount', style: TextStyle(color: Colors.grey))),
        DataColumn(
            label: Text('Product ID', style: TextStyle(color: Colors.grey))),
        DataColumn(label: Text('Status', style: TextStyle(color: Colors.grey))),
        DataColumn(label: Text('Option', style: TextStyle(color: Colors.grey))),
      ],
      rows: invoiceData
          .map(
            (item) => DataRow(
              cells: [
                DataCell(
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        child: Text(item['name'].toString()[0]),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(item['name']),
                    ],
                  ),
                ),
                DataCell(Text(item['date'])),
                DataCell(Text(item['amount'])),
                DataCell(Text(item['productID'])),
                DataCell(Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      item['status'],
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: item['status'] == 'Unpaid'
                            ? Theme.of(context).colorScheme.primary
                            : null,
                      ),
                    ),
                  ),
                )),
                DataCell(Text(
                  item['option'],
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.secondary),
                )),
              ],
            ),
          )
          .toList(),
    );
  }
}


/*
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
                  trailing: Container(
                    color: Colors.amber,
                    width: 50.w,
                    child: Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.surface,
                              surfaceTintColor:
                                  Theme.of(context).colorScheme.surface,
                              elevation: 0),
                          onPressed: () {},
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
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
                        ),
                      ],
                    ),
                  )),
 */