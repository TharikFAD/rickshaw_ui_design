// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unused_field

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meter_app/pages/homePage/widgets/appBarWidget.dart';
import 'package:meter_app/pages/homePage/widgets/drawer.dart';
import 'package:meter_app/pages/homePage/widgets/rideInfoNavContainer.dart';

class RiderInfoPage extends StatefulWidget {
  const RiderInfoPage({super.key});

  @override
  State<RiderInfoPage> createState() => _RiderInfoPageState();
}

class _RiderInfoPageState extends State<RiderInfoPage> {
  @override
  Widget build(BuildContext context) {
    double _myTestFareResult = 195.25;
    var _result = "₹" + _myTestFareResult.toString();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      //Drawer
      drawer: MyDrawerWidget(),
      //body
      body: Stack(
        //Appbar
        children: [
          Column(
            children: [
              CustomAppBar(),
            ],
          ),
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: SizedBox(
                        height: size.height * 0.07,
                        width: size.width * 0.1,
                        child: Icon(Icons.share),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.055,
                    ),
                  ],
                ),
                Text(
                  'Total',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700, fontSize: 25),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Text(
                  _result,
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700, fontSize: 25 * 2),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: MyNavBarWidget(),
    );
  }
}
