// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class FareNameTextFormField extends StatefulWidget {
  final controller;
  final typeInput;
  final String hintText;
  const FareNameTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.typeInput,
  });

  @override
  State<FareNameTextFormField> createState() => _FareNameTextFormFieldState();
}

class _FareNameTextFormFieldState extends State<FareNameTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.typeInput,
      controller: widget.controller,
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
        hintText: widget.hintText,
      ),
      minLines: 1,
    );
  }
}
