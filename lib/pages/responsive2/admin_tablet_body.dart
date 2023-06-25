import 'package:flutter/material.dart';

import '../../widgets/custom_datatable.dart';

class AdminTabletBody extends StatefulWidget {
  const AdminTabletBody({super.key});

  @override
  State<AdminTabletBody> createState() => _AdminTabletBodyState();
}

class _AdminTabletBodyState extends State<AdminTabletBody> {
  String currentValue = 'Ustunlar';
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          const Icon(Icons.filter_alt_outlined, color: Colors.green),
          DropdownButton(
            value: currentValue,
            items: const [
              DropdownMenuItem<String>(
                value: 'Ustunlar',
                child: Text('Ustunlar'),
              ),
              DropdownMenuItem<String>(
                value: 'Ustunlsdfar',
                child: Text('Ustunlsdfar'),
              )
            ],
            onChanged: (value) {
              setState(() {
                currentValue = value.toString();
              });
            },
          )
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {},
                  child: const Row(
                    children: [Icon(Icons.add), Text('YANGI MAHSULOT')],
                  ))
            ],
          ),
          const CustomDataTable()
        ],
      ),
    );
  }
}
