import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uireplica/Infrastructure/data_sources/local/invoices_datatable.dart';
import 'package:uireplica/Presentation/widgets/card.dart';

class InvoicesCard extends StatelessWidget {
  const InvoicesCard({super.key});

   // card header
    Widget cardHeader(BuildContext context) {
      return Row(
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
                  onPressed: () {},
                  icon: const Icon(Icons.filter_list_rounded)),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  surfaceTintColor: Theme.of(context).colorScheme.surface,
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
      );
    }

  @override
  Widget build(BuildContext context) {
    // invoice count
    final Widget invoiceCount = Row(
      children: [
        Text(
          "${invoiceData.length} Invoices",
          style: const TextStyle(color: Colors.grey),
        )
      ],
    );

    // invoice table
    const Widget invoiceTable = Expanded(
      child: SizedBox(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            child: InvoiceTable(),
          ),
        ),
      ),
    );

    return InfoCard(
      backgroundColor: Theme.of(context).colorScheme.surface,
      content: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 30.w),
        child: SizedBox(
          child: Column(
            children: [
              cardHeader(context),
              invoiceCount,
              SizedBox(
                height: 20.h,
              ),
              invoiceTable,
            ],
          ),
        ),
      ),
    );
  }
}

// data table for invoices
class InvoiceTable extends StatelessWidget {
  const InvoiceTable({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      horizontalMargin: 0,
      dividerThickness: 0.000000000001,
      dataRowMinHeight: 5,
      showBottomBorder: false,
      sortAscending: true,
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
