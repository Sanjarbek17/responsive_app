import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomContainer extends StatefulWidget {
  final String upTitle;
  final String title;
  final bool iconButton;

  const CustomContainer({
    super.key,
    required this.upTitle,
    required this.title,
    required this.iconButton,
  });

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  DateTime? date = DateTime(2023);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.upTitle, style: const TextStyle(fontSize: 10)),
              Text(!widget.iconButton ? widget.title : DateFormat('MM/dd/yyyy').format(date!).toString(), style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            ],
          ),
          Visibility(
            visible: widget.iconButton,
            replacement: const SizedBox(height: 40, width: 40),
            child: IconButton(
              iconSize: 20,
              padding: EdgeInsets.zero,
              onPressed: () async {
                DateTime? selected = await showDatePicker(context: context, initialDate: DateTime(2023), firstDate: DateTime(2000), lastDate: DateTime(2054));
                setState(() {
                  date = selected ?? date;
                });
              },
              icon: const Icon(Icons.calendar_month),
            ),
          )
        ],
      ),
    );
  }
}
