import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class DropdownItem {
  final String label;
  final dynamic value;

  DropdownItem({required this.label, required this.value});
}

class Dropdown extends StatefulWidget {
  const Dropdown({
    super.key,
    required this.name,
    required this.items,
    this.labelText,
    this.hintText,
    this.initialValue,
  });

  final String name;
  final String? labelText;
  final String? hintText;
  final List<DropdownItem> items;
  final dynamic initialValue;

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderDropdown<String>(
      name: widget.name,
      initialValue: widget.initialValue,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
      ),
      items: widget.items
          .map(
            (item) => DropdownMenuItem<String>(
              alignment: AlignmentDirectional.center,
              value: item.value,
              child: Text(item.label),
            ),
          )
          .toList(),
    );
  }
}
