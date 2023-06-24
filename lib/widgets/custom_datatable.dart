import 'package:flutter/material.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

List<String> columnsList = ['N~', 'Savdo raqami', 'Holati', 'Mijozlar', 'Sana', 'Jami', 'SUM'];

List<Map> rowsList = [
  {'id': 1, 'savdo_raqami': 'Savdo N 18', 'Holati': 'O\'tkazilgan', 'mijoz': 'Klient', 'sana': '22/06/2023 06:53', 'JAMI': '3 000.00', 'sum': '34 000.00'},
  {'id': 2, 'savdo_raqami': 'Savdo N 18', 'Holati': 'O\'tkazilgan', 'mijoz': 'Klient', 'sana': '22/06/2023 06:53', 'JAMI': '3 000.00', 'sum': '34 000.00'},
  {'id': 3, 'savdo_raqami': 'Savdo N 18', 'Holati': 'O\'tkazilgan', 'mijoz': 'Klient', 'sana': '22/06/2023 06:53', 'JAMI': '3 000.00', 'sum': '34 000.00'},
  {'id': 4, 'savdo_raqami': 'Savdo N 18', 'Holati': 'O\'tkazilgan', 'mijoz': 'Klient', 'sana': '22/06/2023 06:53', 'JAMI': '3 000.00', 'sum': '34 000.00'},
  {'id': 5, 'savdo_raqami': 'Savdo N 18', 'Holati': 'O\'tkazilgan', 'mijoz': 'Klient', 'sana': '22/06/2023 06:53', 'JAMI': '3 000.00', 'sum': '34 000.00'},
  {'id': 6, 'savdo_raqami': 'Savdo N 18', 'Holati': 'O\'tkazilgan', 'mijoz': 'Klient', 'sana': '22/06/2023 06:53', 'JAMI': '3 000.00', 'sum': '34 000.00'},
  {'id': 7, 'savdo_raqami': 'Savdo N 18', 'Holati': 'O\'tkazilgan', 'mijoz': 'Klient', 'sana': '22/06/2023 06:53', 'JAMI': '3 000.00', 'sum': '34 000.00'},
  {'id': 8, 'savdo_raqami': 'Savdo N 18', 'Holati': 'O\'tkazilgan', 'mijoz': 'Klient', 'sana': '22/06/2023 06:53', 'JAMI': '3 000.00', 'sum': '34 000.00'},
  {'id': 9, 'savdo_raqami': 'Savdo N 18', 'Holati': 'O\'tkazilgan', 'mijoz': 'Klient', 'sana': '22/06/2023 06:53', 'JAMI': '3 000.00', 'sum': '34 000.00'},
  {'id': 10, 'savdo_raqami': 'Savdo N 18', 'Holati': 'O\'tkazilgan', 'mijoz': 'Klient', 'sana': '22/06/2023 06:53', 'JAMI': '3 000.00', 'sum': '34 000.00'},
];

class CustomDataTable extends StatelessWidget {
  const CustomDataTable({
    super.key,
  });

  List<TableViewColumn> getColumns(List<String> columns) => columns.map((e) => TableViewColumn(label: e)).toList();

  List<TableViewRow> getRows(List<Map> rows) => rows.map((e) => TableViewRow(cells: getCells(e))).toList();

  List<TableViewCell> getCells(Map row) => row.entries.map((e) => TableViewCell(child: Text(e.value.toString()))).toList();

  @override
  Widget build(BuildContext context) {
    Size constraints = MediaQuery.of(context).size;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: constraints.width),
        child: ScrollableTableView(
          columns: getColumns(columnsList),
          rows: getRows(rowsList),
        ),
      ),
    );
  }
}
