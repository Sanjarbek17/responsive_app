import 'package:flutter/material.dart';
import 'package:responsive_app/data/client_data.dart';

import '../../widgets/custom_container.dart';
import '../../widgets/custom_datatable.dart';

class TabletBody extends StatefulWidget {
  const TabletBody({super.key});

  @override
  State<TabletBody> createState() => _TabletBodyState();
}

class _TabletBodyState extends State<TabletBody> {
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
          InkWell(
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/responsive2');
              },
              child: const Icon(Icons.filter_alt_outlined, color: Colors.green)),
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
              const SizedBox(width: 20),
              SizedBox(
                width: 160,
                height: 41,
                child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(hintText: 'Savdo raqami', hintStyle: TextStyle(height: 1.1), border: OutlineInputBorder()),
                ),
              ),
              const SizedBox(width: 10),
              const CustomContainer(upTitle: 'Mijoz', title: 'Tanlash', iconButton: false),
              const SizedBox(width: 10),
              const CustomContainer(upTitle: 'Boshlang\'inch sana', title: '', iconButton: true),
              const SizedBox(width: 10),
              const CustomContainer(upTitle: 'Oxirgi sana', title: '', iconButton: true),
              const SizedBox(width: 10),
              TextButton(onPressed: () {}, child: const Text('FITRLASH', style: TextStyle(color: Colors.black))),
              const SizedBox(width: 20),
              TextButton(onPressed: () {}, child: const Text('BEKOR QILISH', style: TextStyle(color: Colors.black))),
            ],
          ),
          CustomDataTable(columnsList: columnsList, rowsList: rowsList)
        ],
      ),
    );
  }
}
