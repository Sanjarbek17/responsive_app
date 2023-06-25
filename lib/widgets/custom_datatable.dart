import 'package:flutter/material.dart';

import '../data/datatable_data.dart';

class CustomDataTable extends StatefulWidget {
  const CustomDataTable({
    super.key,
  });

  @override
  State<CustomDataTable> createState() => _CustomDataTableState();
}

class _CustomDataTableState extends State<CustomDataTable> {
  int? currentSortColumn;

  bool? currentSortAscending;

  List<DataColumn> getColumns(List<String> columns) => columns.map((e) => DataColumn(label: Expanded(child: Text(e, style: const TextStyle(fontWeight: FontWeight.bold))), onSort: onSort)).toList();

  List<DataRow> getRows(List<Map> rows) => rows.map((e) => DataRow(cells: getCells(e))).toList();

  List<DataCell> getCells(Map row) => row.values.map((e) => DataCell(Text(e.toString()))).toList();

  void onSort(columnIndex, ascending) {
    if (ascending) {
      rowsList.sort((rowA, rowB) => rowA.values.toList()[columnIndex].compareTo(rowB.values.toList()[columnIndex]));
    } else {
      rowsList.sort((rowA, rowB) => rowB.values.toList()[columnIndex].compareTo(rowA.values.toList()[columnIndex]));
    }

    currentSortColumn = columnIndex;
    currentSortAscending = ascending;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size constraints = MediaQuery.of(context).size;

    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: constraints.width),
            child: DataTable(
              sortColumnIndex: currentSortColumn,
              sortAscending: currentSortAscending ?? true,
              columns: getColumns(columnsList),
              rows: getRows(rowsList),
            ),
          ),
        ),
      ),
    );
  }
}
