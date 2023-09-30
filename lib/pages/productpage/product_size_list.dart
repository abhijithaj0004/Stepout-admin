import 'package:flutter/material.dart';

class ProductSizeList extends StatefulWidget {
  final List<String> items;
  const ProductSizeList({super.key, required this.items});

  @override
  State<ProductSizeList> createState() => _ProductSizeListState();
}

class _ProductSizeListState extends State<ProductSizeList> {
  List<String> selecteditems = [];
  void itemChange(String itemVal, bool isSelected) {
    setState(() {
      if (isSelected) {
        selecteditems.add(itemVal);
      } else {
        selecteditems.remove(itemVal);
      }
    });
  }

  void cancel() {
    Navigator.pop(context);
  }

  void submit() {
    Navigator.pop(context, selecteditems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Sizes'),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map((item) => CheckboxListTile(
                    value: selecteditems.contains(item),
                    onChanged: (isChecked) {
                      itemChange(item, isChecked!);
                    },
                    title: Text(item),
                    controlAffinity: ListTileControlAffinity.leading,
                  ))
              .toList(),
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              cancel();
            },
            child: Text('CANCEL')),
        TextButton(
            onPressed: () {
              submit();
            },
            child: Text('SUBMIT'))
      ],
    );
  }
}
