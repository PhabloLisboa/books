import 'package:flutter/material.dart';

class TextFormCustom extends StatelessWidget {
  final Color color;
  final String label;
  final String hintText;
  final bool password;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;

  TextFormCustom(this.label, this.hintText,
      {this.password = false,
      this.color = Colors.teal,
      this.controller,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: this.validator,
      controller: this.controller,
      style: TextStyle(color: this.color),
      obscureText: this.password,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: this.label,
        hintText: this.hintText,
      ),
    );
  }
}
