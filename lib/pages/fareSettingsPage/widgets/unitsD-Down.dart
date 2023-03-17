import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const List<String> list = <String>[
  'Kilo Metres',
  'Miles',
];

class UnitsDropDownWidget extends StatefulWidget {
  const UnitsDropDownWidget({super.key});

  @override
  State<UnitsDropDownWidget> createState() => _UnitsDropDownWidgetState();
}

class _UnitsDropDownWidgetState extends State<UnitsDropDownWidget> {
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      elevation: 16,
      style: GoogleFonts.inter(
          fontSize: 20, fontWeight: FontWeight.w700, color: Color(0xFF000000)),
      underline: Container(
        height: 2,
        color: Colors.transparent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
