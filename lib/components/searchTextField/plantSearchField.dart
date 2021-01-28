import 'package:flutter/material.dart';
import 'package:plant/components/searchTextField/textFieldButton.dart';
import 'package:plant/components/searchTextField/search_field.dart';

class PlantSearchTextField extends StatelessWidget {
  static TextEditingController textEditingController = TextEditingController();
  final ValueChanged<String> onChanged;
  final TextFieldButton suffixIcon;
  PlantSearchTextField({this.onChanged, this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'searchBooks',
      child: SearchTextField(
        onChanged: onChanged,
        textEditingController: PlantSearchTextField.textEditingController,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
