// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_element

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meter_app/pages/bookingsPage/widgets/bookings_card.dart';
import 'package:meter_app/pages/homePage/widgets/drawer.dart';
import 'package:meter_app/routes/route_name.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class BookingsPage extends StatefulWidget {
  const BookingsPage({super.key});

  @override
  State<BookingsPage> createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      //Appbar
      appBar: AppBar(
        title: Text(
          "Bookings",
          style: GoogleFonts.bungee(fontSize: 22, fontWeight: FontWeight.w400),
        ), //appbar title
        backgroundColor: Color(0xFF4885ED), //appbar background color

        actions: [
          InkWell(
            onTap: () {
              Navigator.popAndPushNamed(context, homeScreenRoute);
            },
            child: Icon(
              Icons.home,
              size: 32,
            ),
          ),
          SizedBox(
            width: size.width * 0.05,
          )
        ],
      ),

      //Drawer
      drawer: MyDrawerWidget(),

      //Body
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.02,
          ),
          Center(
            child: Container(
              height: size.height * 0.05,
              width: size.width * 0.45,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(12),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Autoplay',
                      style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    LiteRollingSwitch(
                      width: size.width * 0.2,
                      onDoubleTap: () {},
                      onTap: () {},
                      onSwipe: () {},
                      value: true,
                      textOff: "OFF",
                      textOn: "ON",
                      colorOff: Colors.grey,
                      colorOn: Colors.blue,
                      onChanged: (bool state) {
                        //Use it to manage the different states
                        print('Current State of SWITCH IS: $state');
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14.0, right: 14.0),
            child: BookingsCard(),
          ),
        ],
      ),
    );
  }
}
