import 'package:flutter/material.dart';

List<String> columnsList = ['N~', 'Savdo raqami', 'Holati', 'Mijozlar', 'Sana', 'Jami', 'SUM'];

List<Map> rowsList = [
  {'id': 2, 'savdo_raqami': '1Savdo N 18', 'Holati': 'O\'tkazilgan', 'mijoz': 'Klient', 'sana': '22/06/2023 06:53', 'JAMI': '3 000.00', 'sum': '34 000.00'},
  {'id': 1, 'savdo_raqami': '2Savdo N 18', 'Holati': 'O\'tkazilgan', 'mijoz': 'Klient', 'sana': '22/06/2023 06:53', 'JAMI': '3 000.00', 'sum': '34 000.00'},
  {'id': 3, 'savdo_raqami': '3Savdo N 18', 'Holati': 'O\'tkazilgan', 'mijoz': 'Klient', 'sana': '22/06/2023 06:53', 'JAMI': '3 000.00', 'sum': '34 000.00'},
  {'id': 4, 'savdo_raqami': '4Savdo N 18', 'Holati': 'O\'tkazilgan', 'mijoz': 'Klient', 'sana': '22/06/2023 06:53', 'JAMI': '3 000.00', 'sum': '34 000.00'},
  {'id': 5, 'savdo_raqami': '5Savdo N 18', 'Holati': 'O\'tkazilgan', 'mijoz': 'Klient', 'sana': '22/06/2023 06:53', 'JAMI': '3 000.00', 'sum': '34 000.00'},
  {'id': 6, 'savdo_raqami': '6Savdo N 18', 'Holati': 'O\'tkazilgan', 'mijoz': 'Klient', 'sana': '22/06/2023 06:53', 'JAMI': '3 000.00', 'sum': '34 000.00'},
  {'id': 7, 'savdo_raqami': '7Savdo N 18', 'Holati': 'O\'tkazilgan', 'mijoz': 'Klient', 'sana': '22/06/2023 06:53', 'JAMI': '3 000.00', 'sum': '34 000.00'},
  {'id': 8, 'savdo_raqami': '8Savdo N 18', 'Holati': 'O\'tkazilgan', 'mijoz': 'Klient', 'sana': '22/06/2023 06:53', 'JAMI': '3 000.00', 'sum': '34 000.00'},
  {'id': 9, 'savdo_raqami': 'Savdo N 18', 'Holati': 'O\'tkazilgan', 'mijoz': 'Klient', 'sana': '22/06/2023 06:53', 'JAMI': '3 000.00', 'sum': '34 000.00'},
  {'id': 10, 'savdo_raqami': 'Savdo N 18', 'Holati': 'O\'tkazilgan', 'mijoz': 'Klient', 'sana': '22/06/2023 06:53', 'JAMI': '3 000.00', 'sum': '34 000.00'},
];

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
