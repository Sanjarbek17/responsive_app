import 'package:flutter/material.dart';
import 'package:responsive_app/widgets/custom_datatable.dart';

import '../widgets/custom_container.dart';

class MobileBody extends StatefulWidget {
  const MobileBody({super.key});

  @override
  State<MobileBody> createState() => _MobileBodyState();
}

class _MobileBodyState extends State<MobileBody> {
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
              debugPrint(value);
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
              const SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
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
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      CustomContainer(upTitle: 'Boshlang\'inch sana', title: '', iconButton: true),
                      SizedBox(width: 10),
                      CustomContainer(upTitle: 'Oxirgi sana', title: '', iconButton: true),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      TextButton(onPressed: () {}, child: const Text('FITRLASH', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))),
                      const SizedBox(width: 20),
                      TextButton(onPressed: () {}, child: const Text('BEKOR QILISH', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))),
                    ],
                  )
                ],
              ),
            ],
          ),
          const CustomDataTable(),
        ],
      ),
    );
  }
}
