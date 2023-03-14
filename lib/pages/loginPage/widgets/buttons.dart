// ignore_for_file: prefer_const_constructors, avoid_returning_null_for_void

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  final String text;

  final VoidCallback? callback;

  const ButtonWidget({
    super.key,
    required this.text,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: callback,
      child: Container(
        height: size.height * 0.060,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFF4885ED),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.inter(
                fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
