import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FareList extends StatelessWidget {
  const FareList({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.15,
      width: size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.grey.shade200),
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Text(
                'Fare List',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF000000),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.035,
            ),
          ],
        ),
      ),
    );
  }
}
