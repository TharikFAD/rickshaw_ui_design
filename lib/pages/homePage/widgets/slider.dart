import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MySlider extends StatefulWidget {
  const MySlider({super.key});

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  double _currentValue = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _currentValue.toString() + ' X',
          style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 20),
        ),
        Slider(
          min: 1,
          max: 3,
          divisions: 4,
          label: _currentValue.toString(),
          value: _currentValue,
          onChanged: (value) {
            setState(() {
              _currentValue = value;
            });
          },
        )
      ],
    );
  }
}
