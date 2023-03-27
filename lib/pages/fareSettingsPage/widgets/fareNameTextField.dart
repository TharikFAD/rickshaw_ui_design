// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class FareNameTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType typeInput;
  final String hintText;
  const FareNameTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.typeInput,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: typeInput,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(
            color: Color(0xFF4885ED),
          ),
        ),
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
      ),
      minLines: 1,
    );
  }
}
