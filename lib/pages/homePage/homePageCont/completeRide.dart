// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unused_field, prefer_const_declarations, unnecessary_new

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meter_app/pages/homePage/widgets/appBarWidget.dart';
import 'package:meter_app/pages/homePage/widgets/drawer.dart';
import 'package:meter_app/pages/homePage/widgets/inc_dec_button.dart';
import 'package:meter_app/pages/homePage/widgets/slider.dart';
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

          //On swipe Panel
          Column(
            children: [
              SizedBox(
                height: size.height * 0.828,
              ),
              Center(
                child: GestureDetector(
                  onVerticalDragUpdate: (details) {
                    int sensitivity = 8;
                    if (details.delta.dy > sensitivity) {
                      // Down Swipe
                    } else if (details.delta.dy < -sensitivity) {
                      // Up Swipe
                      showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            // <-- SEE HERE
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(30.0),
                            ),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                //Color(0xFFd9d9d9),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30.0),
                                  topRight: Radius.circular(30.0),
                                ),
                              ),
                              height: size.height * 0.4,
                              child: Center(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: size.height * 0.05,
                                    ),
                                    Text(
                                      'Surge Price',
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20),
                                    ),

                                    SizedBox(
                                      height: size.height * 0.05,
                                    ),
                                    //MySlider(),
                                    IncDecButtonWidget(),
                                    SizedBox(
                                      height: size.height * 0.05,
                                    ),

                                    //Complete button
                                    Center(
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          fixedSize: MaterialStateProperty.all(
                                            Size(size.width * 0.8,
                                                size.height * 0.07),
                                          ),
                                          shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12))),
                                        ),
                                        onPressed: () {
                                          _dialogBuilder(context);
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
                              ),
                            );
                          });
                    }
                  },
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            // <-- SEE HERE
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(30.0),
                            ),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                //Color(0xFFd9d9d9),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30.0),
                                  topRight: Radius.circular(30.0),
                                ),
                              ),
                              height: size.height * 0.4,
                              child: Center(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: size.height * 0.05,
                                    ),
                                    Text(
                                      'Surge Price',
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20),
                                    ),

                                    SizedBox(
                                      height: size.height * 0.05,
                                    ),
                                    MySlider(),
                                    SizedBox(
                                      height: size.height * 0.05,
                                    ),

                                    //button
                                    Center(
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          fixedSize: MaterialStateProperty.all(
                                            Size(size.width * 0.8,
                                                size.height * 0.07),
                                          ),
                                          shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12))),
                                        ),
                                        onPressed: () {
                                          _dialogBuilder(context);
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
                              ),
                            );
                          });
                    },
                    child: Container(
                      height: size.height * 0.172,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: // Colors.white,
                            Color(0xFFd9d9d9),
                        //border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            offset: const Offset(
                              5.0,
                              5.0,
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
                ),
              ),
            ],
          ),

          //Complete button
          Column(
            children: [
              SizedBox(
                height: size.height * 0.91,
              ),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                      Size(size.width * 0.8, size.height * 0.07),
                    ),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                  ),
                  onPressed: () {
                    _dialogBuilder(context);
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

//Start Ride Dialog Box-------------------------------------------------------->
Future<void> _dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Do you want to stop the ride?',
          style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Color(0xFF000000)),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: Text(
              'No',
              style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF000000)),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: Text(
              'Yes',
              style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF000000)),
            ),
            onPressed: () {
              Navigator.popAndPushNamed(context, riderInfoScreenRoute);
            },
          ),
        ],
      );
    },
  );
}