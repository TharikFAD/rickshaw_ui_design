import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const List<String> list = <String>[
  'select the issue. e.g: low fare',
  'Km Low',
  'Fare Low',
  'Waiting Low',
  'Km High',
  'Fare High',
  'Waiting High',
  'Others',
];

class SubjectDropDownWidget extends StatefulWidget {
  const SubjectDropDownWidget({super.key});

  @override
  State<SubjectDropDownWidget> createState() => _SubjectDropDownWidgetState();
}

class _SubjectDropDownWidgetState extends State<SubjectDropDownWidget> {
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      value: dropdownValue,
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
