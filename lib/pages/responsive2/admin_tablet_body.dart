import 'package:flutter/material.dart';

import '../../data/admin_data.dart';
import '../../widgets/add_product_dialog.dart';
import '../../widgets/custom_datatable.dart';

class AdminTabletBody extends StatefulWidget {
  const AdminTabletBody({super.key});

  @override
  State<AdminTabletBody> createState() => _AdminTabletBodyState();
}

class _AdminTabletBodyState extends State<AdminTabletBody> {
  final TextEditingController name = TextEditingController(text: '');
  final TextEditingController lessName = TextEditingController(text: '');
  final TextEditingController shtrixCode = TextEditingController(text: '');
  final TextEditingController generalPrice = TextEditingController(text: '0');
  final TextEditingController group = TextEditingController(text: 'Ayollar qishki');

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
                Navigator.of(context).pushReplacementNamed('/responsive');
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
              ElevatedButton(
                onPressed: () async {
                  var data = await myShowDialog(context);
                  if (data == 'bekor') return;
                  adminRowsList.add(data);
                  setState(() {});
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 4, 160, 161)),
                  shape: MaterialStateProperty.all(const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))),
                ),
                child: const Row(
                  children: [Icon(Icons.add), SizedBox(width: 10), Text('YANGI MAHSULOT')],
                ),
              ),
            ],
          ),
          CustomDataTable(
            columnsList: adminColumnsList,
            rowsList: adminRowsList,
          )
        ],
      ),
    );
  }

  Future<dynamic> myShowDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              titleTextStyle: const TextStyle(color: Colors.white),
              titlePadding: EdgeInsets.zero,
              title: Container(
                color: const Color.fromARGB(255, 4, 136, 136),
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Maxsulot qo\'shish'),
                    const SizedBox(width: 10),
                    InkWell(
                        onTap: () {
                          Navigator.pop(context, 'bekor');
                        },
                        child: const Icon(Icons.close, size: 20, color: Colors.white)),
                  ],
                ),
              ),
              content: AddProductDialog(
                name: name,
                lessName: lessName,
                shtrixCode: shtrixCode,
                generalPrice: generalPrice,
                group: group,
              ),
              backgroundColor: const Color.fromARGB(255, 4, 160, 161),
              actionsAlignment: MainAxisAlignment.start,
              actions: [
                TextButton(
                  onPressed: () {
                    Map data = {
                      'id': adminRowsList.length + 1,
                      'name': name.text,
                      'lessName': lessName.text,
                      'group': group.text,
                      'shtrixCode': shtrixCode.text,
                      'price': '2000',
                      'buyPrice': '1000',
                    };

                    // clear all text controllers
                    name.clear();
                    lessName.clear();
                    shtrixCode.clear();
                    generalPrice.clear();

                    Navigator.pop(context, data);
                  },
                  child: const Text('Yaratish', style: TextStyle(color: Colors.white)),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, 'bekor');
                  },
                  child: const Text('Bekor qilish', style: TextStyle(color: Colors.white)),
                ),
              ],
            ));
  }
}
