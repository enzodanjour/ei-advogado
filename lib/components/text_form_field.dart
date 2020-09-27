import 'package:flutter/material.dart';

class TextFormFieldCustom extends StatelessWidget {
  final String hintText;
  final InputDecoration decoration;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Function onChanged;
  final Function validator;
  final bool obscureText;

  TextFormFieldCustom(
      {this.hintText,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      @required this.controller,
      this.decoration,
      this.validator,
      this.onChanged});

  InputDecoration inputDecorationCustom() {
    if (decoration != null) {
      if (hintText != null) {
        var newDecoration;
        newDecoration = decoration;
        newDecoration.hintText = hintText;
        return newDecoration;
      }
      return decoration;
    } else {
      return InputDecoration(
        hintText: hintText != null ? hintText : '',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        fillColor: Color(0xFFE8E8E8),
        filled: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: inputDecorationCustom(),
      onChanged: onChanged,
      controller: controller,
      validator: validator,   
    );
  }
}
