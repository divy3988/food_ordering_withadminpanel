import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final int maxLines;
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.text,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: text,
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your $text';
        }
        return null;
      },
      maxLines: maxLines,
    );
  }
}
