// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meter_app/routes/route_name.dart';

class HistoryContentWidget extends StatelessWidget {
  const HistoryContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.25,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: const Offset(
              0.0,
              0.0,
            ),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ), //BoxShadow
          BoxShadow(
            color: Colors.white,
            offset: const Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
      ),
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 12),
              child: Row(
                children: [
                  Image.asset('assets/Driving.png'),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Text(
                    'Date :',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Text(
                    '10-03-2023',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 12),
              child: Row(
                children: [
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Image.asset('assets/reddot.png'),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Text(
                    'Pickup :',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Flexible(
                    child: Text(
                      '2, Palakkad main road, Kuniyamuthur, Coimbatore 641008',
                      overflow: TextOverflow.fade,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 12),
              child: Row(
                children: [
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Image.asset('assets/greendot.png'),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Text(
                    'Drop :',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Flexible(
                    child: Text(
                      '2, Palakkad main road, Kuniyamuthur, Coimbatore 641008',
                      overflow: TextOverflow.fade,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 12),
              child: Row(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color(0xFF4885ED),
                      ),
                    ),
                    onPressed: () {
                      Navigator.popAndPushNamed(context, addCompaintScreenRoute);
                    },
                    child: Text('Report'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
