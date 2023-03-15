// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unused_field

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meter_app/pages/homePage/widgets/appBarWidget.dart';
import 'package:meter_app/pages/homePage/widgets/drawer.dart';
import 'package:meter_app/routes/route_name.dart';

class CompleteRidePage extends StatefulWidget {
  const CompleteRidePage({super.key});

  @override
  State<CompleteRidePage> createState() => _CompleteRidePageState();
}

late GoogleMapController mapController;

final LatLng _center = const LatLng(10.9641042, 76.9562562);

void _onMapCreated(GoogleMapController controller) {
  mapController = controller;
}

class _CompleteRidePageState extends State<CompleteRidePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      //drawer
      drawer: MyDrawerWidget(),

      //body
      body: Stack(
        children: [
          //GoogleMap
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(target: _center, zoom: 17.0),
          ),

          //Custom AppBar
          Column(
            children: [
              CustomAppBar(),
            ],
          ),

          //On Ride Panel
          Column(
            children: [
              SizedBox(
                height: size.height * 0.848,
              ),
              Center(
                child: Container(
                  height: size.height * 0.152,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Color(0xFFd9d9d9),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      )),
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '1.04 KM',
                            style: GoogleFonts.inter(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          Icon(Icons.keyboard_arrow_up),
                          Text(
                            '02:52',
                            style: GoogleFonts.inter(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          //button
          Column(
            children: [
              SizedBox(
                height: size.height * 0.91,
              ),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                      Size(size.width * 0.5, size.height * 0.07),
                    ),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                  ),
                  onPressed: () {
                    Navigator.popAndPushNamed(context, homeScreenRoute);
                  },
                  child: Text(
                    'Complete Ride',
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),

          //OnRide Fare Meter
          Column(
            children: [
              SizedBox(
                height: size.height * 0.2,
              ),
              Center(
                child: Container(
                  height: size.height * 0.07,
                  width: size.width * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Color(0xFF4885ED), width: 5),
                  ),
                  child: Center(
                      child: Text(
                    '₹ 99.25',
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  )),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}