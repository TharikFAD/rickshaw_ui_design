import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ComplaintsList extends StatelessWidget {
  const ComplaintsList({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.05,
        ),
        Container(
          height: size.height * 0.1,
          width: size.width,
          decoration: BoxDecoration(
            color: Color(0xFFFFF311),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey),
          ),
          child: Center(
              child: Text(
            'Pending Complaint',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          )),
        ),
        SizedBox(
          height: size.height * 0.05,
        ),
        Container(
          height: size.height * 0.1,
          width: size.width,
          decoration: BoxDecoration(
            color: Color(0xFFFF2201),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey),
          ),
          child: Center(
              child: Text(
            'Cancelled Complaint',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          )),
        ),
        SizedBox(
          height: size.height * 0.05,
        ),
      ],
    );
  }
}
