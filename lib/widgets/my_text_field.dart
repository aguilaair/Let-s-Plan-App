import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String label;
  final int maxLines;
  final int minLines;
  final Icon icon;
  TextEditingController c;
  MyTextField(
      {this.label, this.maxLines = 1, this.minLines = 1, this.icon, this.c});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: c,
      style: TextStyle(color: Colors.grey),
      minLines: minLines,
      maxLines: maxLines,
      decoration: InputDecoration(
        focusColor: Colors.white,
        suffixIcon: icon == null ? null : icon,
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
