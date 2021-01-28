import 'package:flutter/material.dart';
import 'package:plant/components/searchTextField/textFieldButton.dart';

class SearchTextField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController textEditingController;
  final TextFieldButton suffixIcon;

  SearchTextField({
    @required this.onChanged,
    this.textEditingController,
    this.suffixIcon,
  });

  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(7),
      child: Container(
        padding: EdgeInsets.only(left: 5.0),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(7),
        ),
        child: TextField(
          autofocus: false,
          controller: widget.textEditingController,
          textAlign: TextAlign.left,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(15),
            hintText: 'Search plants',
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            suffixIcon: widget.suffixIcon,
          ),
        ),
      ),
    );
  }
}
