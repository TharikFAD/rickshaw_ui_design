// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unused_field

import 'package:flutter/material.dart';
import 'package:meter_app/pages/homePage/widgets/rideInfoDetails.dart';

class MyNavBarWidget extends StatelessWidget {
  const MyNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.62,
      width: size.height,
      decoration: BoxDecoration(
        color: Color(0xFF4885ED),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      // child: Center(
      //   child: Column(
      //     children: [
      //       SizedBox(
      //         height: size.height * 0.04,
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.only(left: 12.0, right: 12.0),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Text(
      //               'Start',
      //               style: GoogleFonts.inter(
      //                 color: Colors.white,
      //                 fontSize: 15,
      //                 fontWeight: FontWeight.w700,
      //               ),
      //             ),
      //             Text(
      //               'Fri, Dec 2, 2022 09:57:30',
      //               style: GoogleFonts.inter(
      //                 color: Colors.white,
      //                 fontSize: 15,
      //                 fontWeight: FontWeight.w700,
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //       SizedBox(
      //         height: size.height * 0.02,
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.only(left: 12.0, right: 12.0),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Text(
      //               'End',
      //               style: GoogleFonts.inter(
      //                 color: Colors.white,
      //                 fontSize: 15,
      //                 fontWeight: FontWeight.w700,
      //               ),
      //             ),
      //             Text(
      //               'Fri, Dec 2, 2022 12:00:30',
      //               style: GoogleFonts.inter(
      //                 color: Colors.white,
      //                 fontSize: 15,
      //                 fontWeight: FontWeight.w700,
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //       SizedBox(
      //         height: size.height * 0.02,
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.only(left: 12.0, right: 12.0),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Text(
      //               'Trip Duration',
      //               style: GoogleFonts.inter(
      //                 color: Colors.white,
      //                 fontSize: 15,
      //                 fontWeight: FontWeight.w700,
      //               ),
      //             ),
      //             Text(
      //               '02:30:00',
      //               style: GoogleFonts.inter(
      //                 color: Colors.white,
      //                 fontSize: 15,
      //                 fontWeight: FontWeight.w700,
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //       SizedBox(
      //         height: size.height * 0.02,
      //       ),
      //       Container(
      //         width: size.width,
      //         height: 2,
      //         color: Colors.white,
      //       ),
      //       SizedBox(
      //         height: size.height * 0.02,
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.only(left: 12.0, right: 12.0),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Text(
      //               'Distance',
      //               style: GoogleFonts.inter(
      //                 color: Colors.white,
      //                 fontSize: 15,
      //                 fontWeight: FontWeight.w700,
      //               ),
      //             ),
      //             Text(
      //               '7 KM',
      //               style: GoogleFonts.inter(
      //                 color: Colors.white,
      //                 fontSize: 15,
      //                 fontWeight: FontWeight.w700,
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //       SizedBox(
      //         height: size.height * 0.02,
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.only(left: 12.0, right: 12.0),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Text(
      //               'Waiting Time',
      //               style: GoogleFonts.inter(
      //                 color: Colors.white,
      //                 fontSize: 15,
      //                 fontWeight: FontWeight.w700,
      //               ),
      //             ),
      //             Text(
      //               '00:10:01',
      //               style: GoogleFonts.inter(
      //                 color: Colors.white,
      //                 fontSize: 15,
      //                 fontWeight: FontWeight.w700,
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //       SizedBox(
      //         height: size.height * 0.02,
      //       ),
      //       Container(
      //         width: size.width,
      //         height: 2,
      //         color: Colors.white,
      //       ),
      //     ],
      //   ),
      // ),

      //Ride Info Data
      child: RideInfoDetails(),
    );
  }
}
