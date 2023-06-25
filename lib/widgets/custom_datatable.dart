import 'package:flutter/material.dart';

class CustomDataTable extends StatefulWidget {
  final List<String> columnsList;
  final List<Map> rowsList;
  const CustomDataTable({
    super.key,
    required this.columnsList,
    required this.rowsList,
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
      widget.rowsList.sort((rowA, rowB) => rowA.values.toList()[columnIndex].compareTo(rowB.values.toList()[columnIndex]));
    } else {
      widget.rowsList.sort((rowA, rowB) => rowB.values.toList()[columnIndex].compareTo(rowA.values.toList()[columnIndex]));
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
              dataRowMinHeight: 30,
              dataRowMaxHeight: 30,
              sortColumnIndex: currentSortColumn,
              sortAscending: currentSortAscending ?? true,
              columns: getColumns(widget.columnsList),
              rows: getRows(widget.rowsList),
            ),
          ),
        ),
      ),
    );
  }
}
