// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var community = [
      'Auto Karan',
      'Meter Auto',
      'Saroja Auto Service',
      'Star Auto',
      'Unga Auto',
      'Enga Auto'
    ];
    return PreferredSize(
      //wrap with PreferredSize
      preferredSize: Size.fromHeight(20), //height of appbar
      child: AppBar(
          title: Text(
            community[0],
            style:
                GoogleFonts.bungee(fontSize: 22, fontWeight: FontWeight.w400),
          ), //appbar title
          backgroundColor: Color(0xFF4885ED) //appbar background color
          ),
    );
  }
}
