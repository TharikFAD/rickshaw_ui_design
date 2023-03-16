// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class UserNameTextForm extends StatelessWidget {
  final keyBoardType;
  final controller;
  final String hintText;
  const UserNameTextForm({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyBoardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyBoardType,
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
