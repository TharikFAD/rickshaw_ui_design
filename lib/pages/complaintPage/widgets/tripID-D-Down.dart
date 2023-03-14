import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const List<String> list = <String>[
  'Trip 1',
  'Trip 2',
  'Trip \'n\'',
];

class TripIdDropDownWidget extends StatefulWidget {
  const TripIdDropDownWidget({super.key});

  @override
  State<TripIdDropDownWidget> createState() => _TripIdDropDownWidgetState();
}

class _TripIdDropDownWidgetState extends State<TripIdDropDownWidget> {
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      isExpanded: true,
      elevation: 16,
      style: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Color.fromARGB(255, 102, 102, 102),
      ),
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
          child: Text(value, textAlign: TextAlign.center),
        );
      }).toList(),
    );
  }
}
