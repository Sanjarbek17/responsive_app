import 'package:flutter/material.dart';

Map group = {
  '1': 'Ayollar qishki',
  '2': 'Erkaklar qishki',
  '3': 'Ayollar kishki',
  '4': 'Erkaklar kishki',
};

class AddProductDialog extends StatefulWidget {
  final TextEditingController name;
  final TextEditingController lessName;
  final TextEditingController shtrixCode;
  final TextEditingController generalPrice;
  final TextEditingController group;

  const AddProductDialog({
    super.key,
    required this.name,
    required this.lessName,
    required this.shtrixCode,
    required this.generalPrice,
    required this.group,
  });

  @override
  State<AddProductDialog> createState() => _AddProductDialogState();
}

class _AddProductDialogState extends State<AddProductDialog> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FormTextField(name: 'Nomi', controller: widget.name),
        const SizedBox(height: 10),
        FormTextField(name: 'Qisqa nomi', controller: widget.lessName),
        const SizedBox(height: 10),
        FormTextField(name: 'Shtrix kod', controller: widget.shtrixCode),
        const SizedBox(height: 10),
        FormTextField(name: 'Umumiy miqdor', controller: widget.generalPrice, isNumber: true),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(child: FormTextField(name: 'Guruhi', controller: widget.group, isNumber: true, isGroup: true)),
            const SizedBox(width: 10),
            IconButton(onPressed: () {}, icon: const Icon(Icons.add, color: Colors.white)),
          ],
        ),
        const SizedBox(height: 10),
        const MyCheckBox('Xom ashyo?'),
        const SizedBox(height: 10),
        const MyCheckBox('Ishlab chiqarish uchun qo\'shish'),
      ],
    );
  }
}

class MyCheckBox extends StatefulWidget {
  final String name;
  const MyCheckBox(
    this.name, {
    super.key,
  });

  @override
  State<MyCheckBox> createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  bool cureentValue = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: cureentValue,
          onChanged: (value) {
            setState(() {
              cureentValue = value!;
            });
          },
        ),
        Text(widget.name, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}

class FormTextField extends StatefulWidget {
  final String name;
  final TextEditingController controller;
  final bool isNumber;
  final bool isGroup;

  const FormTextField({
    super.key,
    required this.name,
    required this.controller,
    this.isNumber = false,
    this.isGroup = false,
  });

  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  List<DropdownMenuItem<String>> getItems() => group.entries.map((e) => DropdownMenuItem<String>(value: e.key, child: Text(e.key))).toList();
  String currentValue = '1';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        maxLines: null,
        minLines: null,
        expands: true,
        controller: widget.controller,
        textAlignVertical: widget.isNumber ? TextAlignVertical.bottom : null,
        decoration: InputDecoration(
          suffix: widget.isGroup
              ? DropdownButton(
                  value: currentValue,
                  items: getItems(),
                  onChanged: (value) {
                    widget.controller.text = group[value].toString();
                    setState(() {
                      currentValue = value.toString();
                    });
                  },
                )
              : null,
          fillColor: Colors.white,
          filled: true,
          contentPadding: const EdgeInsets.all(10),
          label: widget.isNumber ? Transform.translate(offset: const Offset(0, 20), child: Text(widget.name, style: const TextStyle(color: Colors.grey, fontSize: 20))) : null,
          hintText: widget.isNumber ? null : widget.name,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelStyle: const TextStyle(color: Colors.grey),
          border: const OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
